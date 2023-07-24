CreateThread(function()
    IsResourceLoaded('qs-inventory', function(state, inventory)
        if state then
            local version = GetResourceMetadata('qs-inventory', 'version', 0)
            local Framework = GetSharedObjectSafe()
    
            SetTimeout(1000, function()
                if shared.framework == 'ESX' then
                    shared.inventory = 'ESX'
                elseif shared.framework == 'QBCORE' then
                    shared.inventory = 'QBCORE'
                end
            end)
            
            Bridge.GetItem = function(serverId, itemName, metadata)
                local retval = 0

                if version >= '2.0.6' then
                    retval = exports['qs-inventory']:GetItemTotalAmount(serverId, itemName)
                else
                    if shared.framework == 'QBCORE' then
                        local player = Framework.Functions.GetPlayer(serverId)
                        retval = player.Functions.GetItemByName(itemName) and player.Functions.GetItemByName(itemName).amount or 0         
                    elseif shared.framework == 'ESX' then
                        local xPlayer = Framework.GetPlayerFromId(serverId)
                        local item = xPlayer.getInventoryItem(itemName)
        
                        if (item and item.count) or (item[1] and item[1].count) then
                            retval = (item and item.count) or (item[1] and item[1].count)
                        end
                    end    
                end
    
                return retval
            end
    
            Bridge.RemoveItem = function(serverId, itemName, amount, slot)
                if version >= '2.0.6' then
                    exports['qs-inventory']:RemoveItem(serverId, itemName, amount)
                else
                    TriggerEvent('inventory:server:removeItem', serverId, itemName, amount)
                end

                return true
            end
    
            Bridge.AddItem = function(serverId, itemName, amount, metadata, slot)
                if version >= '2.0.6' then
                    exports['qs-inventory']:AddItem(serverId, itemName, amount)
                else
                    TriggerEvent('inventory:server:addItem', serverId, itemName, amount)
                end
               
                return true
            end
    
            Bridge.TransferCreditToMoney = function(serverId, charid)
                if not Prison.Release.TransferCreditsFromAccount then return end
    
                local account = GetPrisonerAccount(charid)
                local player = nil
    
                if shared.framework == 'QBCORE' then
                    player = Framework.Functions.GetPlayer(serverId)
                elseif shared.framework == 'ESX' then
                    player = Framework.GetPlayerFromId(serverId)
                end
    
                if account then
                    local prisonerCredits = account.balance
    
                    if prisonerCredits > 0 then
                        if shared.framework == 'QBCORE' then
                            player.Functions.AddMoney('cash', tonumber(prisonerCredits))
                        elseif shared.framework == 'ESX' then
                            player.setAccountMoney('money', tonumber(prisonerCredits))
                        end
                        
                        cfxSetState(serverId, 'PrisonAccount', nil)
                    end
                end
            end
    
            Bridge.GetInventoryItems = function(serverId)
                local inventory = nil

                if version >= '2.0.6' then
                    inventory = exports['qs-inventory']:GetInventory(serverId)
                else
                    if shared.framework == 'QBCORE' then
                        inventory = Framework.Functions.GetPlayer(serverId).PlayerData.items
                    else
                        local xPlayer = Framework.GetPlayerFromId(serverId)
                        local minimalInv = true
        
                        inventory = xPlayer.getInventory(minimalInv) and xPlayer.getInventory(minimalInv)
                    end
                end
    
                return inventory and inventory or {}
            end
    
            function ReturnPrisonerItems(serverId)
                local player = Bridge.GetPlayer(serverId)
    
                if not player then return end
    
                local data = db.FetchStashItems(player.charid)
                local state = false
    
                if data and #data > 0 then
                    local items = json.decode(data)
    
                    state = true
    
                    for k, item in pairs(items) do
                        Bridge.AddItem(serverId, item.name, item.amount, item.info)
                    end
                end
    
                return state
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
    
                if shared.framework == 'QBCORE' then
                    local Player = Framework.Functions.GetPlayer(serverId)
                    local clearMain, clearMainErr = pcall(Player.Functions.ClearInventory)
    
                    if clearMain then
                        dbg.debug("[1] Inventory cleared successfully!")
                    else
                        local backClear, backClearErr = pcall(Player.Functions.SetPlayerData, "items", {})
           
                        if backClear then
                            dbg.debug("[2] Inventory cleared successfully!")
                        end
                    end
                else
                    for k, v in pairs(prisonerItems) do
                        Bridge.RemoveItem(serverId, v.name, v.amount)
                    end
                end
    
                Wait(1000)
    
                db.SavePrisonerItems(prisonerItems, charId)
            end
        end
    end)
end)
