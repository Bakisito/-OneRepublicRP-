CreateThread(function()
    local resourceName = IsScriptLoaded('qb-inventory') and 'qb-inventory' or
    IsScriptLoaded('lj-inventory') and 'lj-inventory' or IsScriptLoaded('aj-inventory') and 'aj-inventory' or 'unk'

    IsResourceLoaded(resourceName, function(state, inventory)
        if state then
            
            QBCore = GetSharedObjectSafe()

            SetTimeout(1000, function()
                if shared.framework == 'ESX' then
                    shared.inventory = 'ESX'
                elseif shared.framework == 'QBCORE' then
                    shared.inventory = 'QBCORE'
                end
            end)

            function ReturnPrisonerItems(src)
                local player = Bridge.GetPlayer(src)

                if not player then return end

                local data = db.FetchStashItems(player.charid)
                local state = false

  
                if data and #data > 0 then
                    local items = json.decode(data)

                    state = true

                    for k, item in pairs(items) do
                        Bridge.AddItem(src, item.name, item.amount or item.count, item.info)
                    end
                end

                return state
            end

            Bridge.GetItem = function(serverId, itemName, metadata)
                local retval = 0
                local player = QBCore.Functions.GetPlayer(serverId)

                if player.Functions.GetItemByName(itemName) then
                    retval = player.Functions.GetItemByName(itemName).amount
                end

                return retval
            end

            Bridge.AddItem = function(serverId, itemName, amount, metadata, slot)
                local player = QBCore.Functions.GetPlayer(serverId)
                player.Functions.AddItem(itemName, amount, slot, metadata)

                return true
            end

            Bridge.RemoveItem = function(serverId, itemName, amount, metadata, slot)
                local player = QBCore.Functions.GetPlayer(serverId)
                player.Functions.RemoveItem(itemName, amount, slot, metadata)

                return true
            end

            Bridge.TransferCreditToMoney = function(serverId, charid)
                if not Prison.Release.TransferCreditsFromAccount then return end

                local account = GetPrisonerAccount(charid)
                local player = QBCore.Functions.GetPlayer(serverId)

                if account then
                    local prisonerCredits = account.balance

                    if prisonerCredits > 0 then
                        player.Functions.AddMoney('cash', tonumber(prisonerCredits))
                        cfxSetState(serverId, 'PrisonAccount', nil)
                    end
                end
            end

            Bridge.GetInventoryItems = function(serverId)
                local player = QBCore.Functions.GetPlayer(serverId)
                return player and player.PlayerData.items or {}
            end

            Bridge.ReturnPrisonerItems = function(serverId, charId, returnType)
                if not serverId then return end
                if not charId then return end

                local state = false

                if Prison.Release.ReturnItemsOnRelease and returnType == 'release' then
                    state = ReturnPrisonerItems(serverId)
                elseif not Prison.Release.ReturnItemsOnRelease and returnType == 'npc' then
                    state = ReturnPrisonerItems(serverId)
                end

                if not Prison.Release.ReturnItemsOnRelease and returnType == 'release' then
                    Bridge.Notify(serverId, {
                        title = l('WARDEN_TITLE'),
                        description = l('PRISONER_RELEASE_ITEMS_AT_NPC'),
                        position = 'top',
                        subtitle = l('LOBBY_MENU_TITLE'),
                        lenght = 6000,
                        style = {
                            backgroundColor = '#141517',
                            color = '#909296'
                        },
                    })
                end


                return state
            end

            Bridge.CreateStashAndDefineItems = function(targetSID, charId)
                local stash = db.CreateStashForPrisoner(charId)

                if stash then
                    Bridge.TakePrisonerItems(targetSID, charId)
                end
            end

            Bridge.TakePrisonerItems = function(serverId, charId)
                if not Prison.Release.StashItems then return end
                if not serverId then return end

                local prisonerItems = Bridge.GetInventoryItems(serverId)
                local Player = QBCore.Functions.GetPlayer(serverId)

                db.SavePrisonerItems(prisonerItems, charId)

                local clearMain, clearMainErr = pcall(Player.Functions.ClearInventory)

                if clearMain then
                    dbg.debug("[1] Inventory cleared successfully!")
                else
                    local backClear, backClearErr = pcall(Player.Functions.SetPlayerData, "items", {})
       
                    if backClear then
                        dbg.debug("[2] Inventory cleared successfully!")
                    end
                end
            end

            shared.inventory = 'QBCORE'
        end
    end)
end)
