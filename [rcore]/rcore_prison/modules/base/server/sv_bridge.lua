local updateSpacing = Prison.Distance.updateSpacing or 100

Bridge.CreateLog = function(title, message)
    if not Logs.Hook then return LevelDebug(3, 'Failed to create log, undefined hook!') end

    local title = title and title or 'Action'
    local message = message and message or 'unk message'


    local embeds = {
        {
            ["color"] = 16007897,
            ["title"] = "**".. title .."**",
            ["description"] = message,
            ["footer"] = {
                ["text"] = "rcore_prison",
            },
        }
    }

    PerformHttpRequest(
        Logs.Hook, 
    function(err, text, headers) end, 
        'POST', 
        json.encode({username = 'Logs', embeds = embeds}), 
        { ['Content-Type'] = 'application/json' }
    )
end

Bridge.HandleAutoJailTimeout = function(serverId)
    local player = Bridge.GetPlayer(serverId)

    if not player then
        return
    end

    local charId = player.charid

    if charId and not IsUserOnCWPeroll(charId) then
        return
    end

    if CWUsers and CWUsers[serverId] and CWUsers[serverId].currentDone > 0 then
        return
    end

    local jailTime = Prison.CS.TimeoutToJail * 60

    local firstThreshold = jailTime / 1.2
    local secondThreshold = jailTime / 1.5
    local thirdTreshold = jailTime / 2

    local base = (jailTime * 1000) + GetGameTimer()

    local STATE = 0
    local isFinished = false

    local threadId = ('community_service_timeout_%s'):format(serverId)

    dbg.debug('Loading auto jail timeout [cs] for user [%s] | SID [%s]', GetPlayerName(serverId), serverId)

    SetServerInterval(threadId, 1000, function()
        local time = GetGameTimer()
        local timeLeft = tonumber(math.floor((base - time) / 1000)) + 2

        if CWUsers[serverId] and CWUsers[serverId].currentDone > 0 then
            ClearServerInterval(threadId)
        end

        if timeLeft <= (firstThreshold) and STATE == 0 then
            STATE = 1
            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(l('COMMUNITY_SERVICE_FIRST_THRESHOLD'), SecondsToClock(timeLeft)),
                position = 'top',
                lenght = 7000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        elseif timeLeft <= (secondThreshold) and STATE == 1 then
            STATE = 2
            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(l('COMMUNITY_SERVICE_FIRST_SECHOLD'), SecondsToClock(timeLeft)),
                position = 'top',
                lenght = 7000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        elseif timeLeft <= (thirdTreshold) and STATE == 2 then
            STATE = 3
            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(l('COMMUNITY_SERVICE_FIRST_THIRDHOLD'), SecondsToClock(timeLeft)),
                position = 'top',
                lenght = 7000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        elseif timeLeft <= 0 and STATE == 3 then
            ClearServerInterval(threadId)

            if timeLeft <= 0 then
                timeLeft = 0                
            end

            if isFinished then 
                return
            end

            isFinished = true

            if charId and IsUserOnCWPeroll(charId) then
                ReleasePrisonerInFrontOfPrison(serverId, charId)

                Bridge.CreateLog('Community Service', 'Enforced jail on citizen, not doing any perolls!\n' .. GetPlayerName(serverId))

                SetTimeout(5000, function()
                    isFinished = false

                    TriggerEvent('rcore_prison:startSentence', {
                        issuedBy = {
                            serverId = serverId
                        },
                        target = {
                            serverId = serverId,
                            time = Prison.CS.TimeoutToJailSentence,
                            state = 'jailed',
                            reason = l('COMMUNITY_SERVICE_AUTO_JAILED'),
                        }
                    })
                end) 
            end
        end
    end)
end

Bridge.HandleDistCheck = function()
    if Prison.CheckDist then
        if Utils.tablesize(Prisoners) > 0 then
            if IsServerIntervalRunning('prison_dist_check') then
                return dbg.debug('Distance check is already in progress!')
            end

            SetServerInterval('prison_dist_check', Prison.CheckDistTimeout, function()
                collectgarbage("collect")
        
                local prisoners = Prisoners
                local updateInterval = ComputeUpdateInterval(Utils.tablesize(prisoners))
        
                if Utils.tablesize(Prisoners) > 0 then
                    prisoners = Prisoners
        
                    CreateThread(function()
                        for _, data in pairs(prisoners) do
                            if data.serverId and data.state == 'jailed' and not data.isOutfitSelection then
                                local plyPed = GetPlayerPed(data.serverId)
                                local playerPos = GetEntityCoords(plyPed)
                                local prisonLoc = vector3(shared.data.prisonYard.x, shared.data.prisonYard.y, shared.data.prisonYard.z)
        
                                local dist = glm.distance(prisonLoc, playerPos)
        
                                if dist >= Prison.CheckEscapeDist then
                                    SetEntityCoords(plyPed, prisonLoc)
        
                                    Bridge.Notify(data.serverId, {
                                        title = l('WARDEN_TITLE'),
                                        subtitle = l('PRISON_TITLE'),
                                        description = ('%s'):format(l('JAIL_ESCAPE_PRISON')),
                                        position = 'top',
                                        lenght = 4000,
                                        style = {
                                            backgroundColor = '#141517',
                                            color = '#909296'
                                        },
                                    })
                                end
        
                                Wait(math.clamp(10, updateSpacing, 100))
                            end
                        end
                    end)
                else
                    ClearServerInterval('prison_dist_check')
                end
        
                Wait(updateInterval)
            end)
        end
    end
end

Bridge.InsertAccountCredits = function(Source, amount)
    local player = Bridge.GetPlayer(Source)

    HasUserPrisonAccount(player.charid, function(state)
        if state then
            dbg.debug('Insert credits for [%s] - amount [%s]', player.name, amount)

            InventoryTransaction(Source,
            {
                type = 'money',
                take = {
                    {
                        itemName = Prison.Accounts.CreditsItem,
                        count = amount,
                    }
                },
            },
            function()
                local prisonAccount = GetPrisonerAccount(player.charid)

                prisonAccount.balance = prisonAccount.balance + amount

                local accountId = prisonAccount.account_id

                db.UpdatePrisonAccountBalance(prisonAccount.balance, player.charid)

                local label = l('ACCOUNT_DEPOSIT_CREDITS_TRANSACTIONS')

                db.InsertNewTransaction({
                    accountId = accountId,
                    transanction = {
                        name = player.name,
                        text = '%s %s [%s]'
                    }
                }, label, amount, player.name)

                Bridge.Notify(Source, {
                    title = l('WARDEN_TITLE'),
                    subtitle = l('PRISON_TITLE'),
                    description = ('%s [%s]'):format(l('ACCOUNT_CREDITS_SENT'), amount),
                    position = 'top',
                    lenght = 4000,
                    style = {
                        backgroundColor = '#141517',
                        color = '#909296'
                    },
                })

                SyncAccountData(Source, prisonAccount)
            end,
            function(_, statusCode)
                Bridge.Notify(Source, {
                    title = l('WARDEN_TITLE'),
                    subtitle = l('PRISON_TITLE'),
                    description = ('%s [%s]'):format(l('ACCOUNT_CREDITS_FAILED_SENT'), amount),
                    position = 'top',
                    lenght = 4000,
                    style = {
                        backgroundColor = '#141517',
                        color = '#909296'
                    },
                })
            end)
        end
    end)
end


Bridge.BuyItemFromCanteen = function(Source, data)
    local packageId = data and data.itemId or nil
    local player = Bridge.GetPlayer(Source)

    if not packageId then
        return dbg.debug('[%s] cannot buy item from canteen | packageId.', GetPlayerName(Source))
    end

    local prisonerData = GetPrisonerData(player.charid)

    if not prisonerData then
        Bridge.Notify(Source, {
            title = l('CANTEEN_TITLE'),
            description = ('%s [%s]'):format(l('PRISONER_REQUIRED'), l('CANTEEN_TITLE')),
            position = 'top',
            subtitle = l('WARDEN_TITLE'),
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })

        return dbg.debug('[%s] Cannot buy item from canteen | prisonerState', GetPlayerName(Source))
    end

    local prisonAccount = GetPrisonerAccount(player.charid)

    if not prisonAccount then
        Bridge.Notify(Source, {
            title = l('CANTEEN_TITLE'),
            description = ('%s [%s]'):format(l('ACCOUNT_REQUIREMENT'), l('CANTEEN_TITLE')),
            position = 'top',
            subtitle = l('WARDEN_TITLE'),
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })

        return
    end

    local shopData = shared.data.Canteen[packageId]
    local itemAmount = tonumber(data.amount)

    if shopData then
        local price = itemAmount * shopData.cost

        if prisonAccount.balance and prisonAccount.balance >= price then
            InventoryTransaction(Source,
                {
                    give = {
                        {
                            itemName = shopData.itemName,
                            count = itemAmount,
                        }
                    },
                },
            function()
                prisonAccount.balance = prisonAccount.balance - price

                Bridge.Notify(Source, {
                    title = l('CANTEEN_TITLE'),
                    description = ('%s %s %s %s %s [%s]'):format(l('YOU_HAVE_BOUGHT_ITEM'), shopData.itemName,
                        l('FOR_PRICE'), price, l('CREDITS_LABEL'), itemAmount),
                    position = 'top',
                    subtitle = l('TRANSACTION'),
                    lenght = 4000,
                    style = {
                        backgroundColor = '#141517',
                        color = '#909296'
                    },
                })

                local accountId = prisonAccount.account_id

                
                db.InsertNewTransaction({
                    accountId = accountId,
                    transanction = {
                        name = l('CANTEEN_TITLE'),
                        text = ('%s %s %s %s %s [%s]'):format(l('YOU_HAVE_BOUGHT_ITEM'), shopData.itemName,
                            l('FOR_PRICE'), price, l('CREDITS_LABEL'), itemAmount)
                    }
                }, l('CANTEEN_TITLE'), shopData.itemName, price, itemAmount)

                db.UpdatePrisonAccountBalance(prisonAccount.balance, player.charid)

                SyncAccountData(Source, prisonAccount)
            end,
            function(_, statusCode)
            end)
        else
            Bridge.Notify(Source, {
                title = l('CANTEEN_TITLE'),
                description = ('%s [%s] | [%s].'):format(l('NOT_ENOUGH_CREDITS'), shopData.itemName, price),
                position = 'top',
                subtitle = l('TRANSACTION'),
                lenght = 4000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        end
    end
end

Bridge.BuyItemFromDealer = function(Source, interactIdx, tradeIdx)
    if not interactIdx then
        return
    end

    local interact = shared.data.interaction[interactIdx]

    if not interact then
        return
    end

    local trade = interact.trade[tradeIdx]

    if not trade then
        return
    end

    local player = Bridge.GetPlayer(Source)
    local isPrisoner = GetPrisonerData(player.charid)

    if not isPrisoner then
        Bridge.Notify(Source, {
            title = l('WARDEN_TITLE'),
            subtitle = l('PRISON_TITLE'),
            description = l('PRISONER_REQUIRED'),
            position = 'top',
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })

        return
    end

    InventoryTransaction(Source,
    {
        type = 'item',
        give = {
            {
                itemName = trade.transaction.giveItem,
                count = trade.transaction.giveCount,
            }
        },
        take = {
            {
                itemName = trade.transaction.takeItem,
                count = trade.transaction.takeCount
            }
        }
    },
    function()
        Bridge.Notify(Source, {
            title = l('WARDEN_TITLE'),
            subtitle = l('PRISON_TITLE'),
            description = ('%s [%s]'):format(l('NPC_DEALER_RECEIVED_ITEM'), trade.transaction.giveItem),
            position = 'top',
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })
    end,
    function(_, statusCode)
        Bridge.Notify(Source, {
            title = l('WARDEN_TITLE'),
            subtitle = l('PRISON_TITLE'),
            description = ('%s [%s] %sx'):format(l('NPC_DEALER_NOT_ENOUGH'), trade.transaction.takeItem, trade.transaction.takeCount),
            position = 'top',
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })
    end)
end

Bridge.HandleGiveCredits = function(serverId, input)
    local targetCreditsAmount = tonumber(input[1])
    local targetAccountId = tonumber(input[2])

    local targetAccountData = SearchAccountBySpecificId(targetAccountId)
    local unkAccountLabel = l('ACCOUNT_DOESNT_EXIST')
    
    if targetAccountData == nil then
        Bridge.Notify(serverId, {
            title = l('PRISON_TITLE'),
            subtitle = l('WARDEN_TITLE'),
            description = ('%s [%s]'):format(unkAccountLabel, targetAccountId),
            position = 'top',
            lenght = 4000,
            style = {
                backgroundColor = '#141517',
                color = '#909296'
            },
        })

        return
    end

    local targetCharId = targetAccountData.owner
    local prisonAccount = GetPrisonerAccount(targetCharId)
    local performGifts = prisonAccount.giftState and prisonAccount.giftState >= 1 and true or false

    if prisonAccount then
        local label = l('ACCOUNT_CANNOT_ACCEPT_GIFTS')

        if not performGifts then
            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(label, targetAccountId),
                position = 'top',
                lenght = 4000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })

            return
        end

        local lang =  l('ACCOUNT_RECEIVED_TRANSACTION')
        local targetSID = prisonAccount.serverId or nil

        InventoryTransaction(serverId, 
            {
                type = 'money',
                take = { 
                    {
                        itemName = Prison.Accounts.CreditsItem, 
                        count = targetCreditsAmount,
                    }
                },
            }, 
        function()
            prisonAccount.balance = prisonAccount.balance + targetCreditsAmount

            local accountId = prisonAccount.account_id

            db.UpdatePrisonAccountBalance(prisonAccount.balance, targetCharId)

            local label = l('ACCOUNT_RECEIVED_TRANSACTION')
            local targetUser = Bridge.GetPlayer(serverId)

            db.InsertNewTransaction({
                accountId = accountId,
                transanction = {
                    name = targetUser.name,
                    text = '%s %s [%s]'
                }
            }, label, targetCreditsAmount, targetUser.name)


            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(l('ACCOUNT_CREDITS_SENT'), targetAccountId),
                position = 'top',
                lenght = 4000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })

            NotifyPrisoner(targetCharId, '%s %s [%s]', lang, targetCreditsAmount, targetUser.name)

            if targetSID then
                SyncAccountData(targetSID, PrisonAccounts[targetCharId]) 
            end
        end, 
        function(_, statusCode)
            Bridge.Notify(serverId, {
                title = l('WARDEN_TITLE'),
                subtitle = l('PRISON_TITLE'),
                description = ('%s [%s]'):format(l('ACCOUNT_CREDITS_FAILED_SENT'), targetCreditsAmount),
                position = 'top',
                lenght = 4000,
                style = {
                    backgroundColor = '#141517',
                    color = '#909296'
                },
            })
        end)
    end
end

---Do a transaction in order to take or give items, or both.
---@param serverId integer The players server id.
---@param data table A table which determines what items that should be taken and given.
---@param successCb function A function which will determine what to do if the transaction is successful.
---@param failCb function A function which will determine what to do if the transaction is unsuccessful.
InventoryTransaction = function(serverId, data, successCb, failCb)
    if serverId == nil then
        print('Transaction failed, cannot get player serverId.')
        return
    end

    local transaction = data
    local transactionType = data.type or nil

    local transactionTake = false
    local transactionGive = false

    if transaction.take then
        local metadata = {}

        if transaction.take.metadata ~= nil then
            metadata = transaction.take.metadata
        end

        local hasItem = 0
        local player = nil
        local bankType = nil
        local Framework = GetSharedObjectSafe()

        if #transaction.take > 0 then
            for i = 1, #transaction.take, 1 do
                local item = transaction.take[i]
                
                if shared.framework  == 'QBCORE' then
                    player = Framework.Functions.GetPlayer(serverId)
                elseif shared.framework == 'ESX' then
                    player = Framework.GetPlayerFromId(serverId)
                end

                if shared.inventory == 'QBCORE' and transactionType == 'money' then
                    hasItem = Bridge.GetItem(
                        serverId,
                        item.itemName,
                        metadata
                    )

                    if hasItem <= 0 then
                        hasItem = player.Functions.GetMoney('cash')
                    end
                elseif shared.inventory == 'ESX' and transactionType == 'money' then
                    hasItem = Bridge.GetItem(
                        serverId,
                        item.itemName,
                        metadata
                    )

                    if hasItem and hasItem <= 0 then
                        local accounts = player.getAccounts('bank')
                        if accounts and accounts.bank and accounts.bank > 0 then
                            hasItem = tonumber(accounts.bank)
                            bankType = 'bank'
                        elseif accounts and  accounts.money and accounts.money > 0 then
                            hasItem = tonumber(accounts.money)
                            bankType = 'pocket'
                        else
                            if accounts and accounts[1] and accounts[1].name == 'bank' then
                                hasItem = tonumber(accounts[1].money)
                                bankType = 'bank'
                            end
                        end
                    end
                else
                    hasItem = Bridge.GetItem(
                        serverId,
                        item.itemName,
                        metadata
                    )
                end

                dbg.debug('Transaction for [%s] - has item -> amount [%s]', GetPlayerName(serverId), hasItem)

                local takeItem = tonumber(item.count)

                if hasItem and hasItem >= takeItem then
                    if shared.inventory == 'QBCORE' and transactionType == 'money' then
                        player.Functions.RemoveMoney("bank", takeItem , "")
                        transactionTake = true
                    elseif shared.inventory == 'ESX' and transactionType == 'money' then
                        if bankType == 'bank' then
                            player.removeAccountMoney('bank', takeItem, "")
                        elseif bankType == 'pocket' then
                            player.removeMoney(takeItem , "")
                        end

                        transactionTake = true
                    else
                        transactionTake = true
                        Bridge.RemoveItem(serverId, item.itemName, takeItem, metadata)
                    end
                else
                    transactionTake = false
                end
            end
        end
    end

    if transaction.give then
        local metadata = {}

        if transaction.give.metadata then
            metadata = transaction.give.metadata
        end

        if transaction.take and not transactionTake then
            return failCb(true)
        end

        if #transaction.give > 0 then
            for i = 1, #transaction.give, 1 do
                local item = transaction.give[i]
                local state = Bridge.AddItem(serverId, item.itemName, item.count, metadata)
               
                if i == #transaction.give then
                    if state then
                        transactionGive = true
                    else
                        transactionGive = false
                    end
                end
            end
        else
            transactionGive = false
        end
    end


    if (transaction.take and transaction.take ~= nil) and (transaction.give and transaction.give ~= nil) then
        if transactionTake and transactionGive then
            successCb(true)
        else
            failCb(true)
        end
    else
        if (transactionTake or transactionGive) then
            successCb(true)
        else
            failCb(true)
        end
    end
end