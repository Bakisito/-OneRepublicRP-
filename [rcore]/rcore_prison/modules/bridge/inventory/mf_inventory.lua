CreateThread(function()
    IsResourceLoaded('mf-inventory', function(state, inventory)
        if state then
            local ESX = GetSharedObjectSafe()
    
            Bridge.CreateStashAndDefineItems = function(targetSID, charId)
                local stash = db.CreateStashForPrisoner(charId)
    
                if stash then
                    Bridge.TakePrisonerItems(targetSID, charId)
                end
            end
    
            Bridge.GetItem = function(serverId, itemName, metadata)
                local xPlayer = ESX.GetPlayerFromId(serverId)
                local retval = 0
    
                local data = exports['mf-inventory']:getInventoryItem(xPlayer.getIdentifier(), itemName)
    
                if data and data.count then
                    retval = data.count
                end
    
                return retval
            end
    
            Bridge.RemoveItem = function(serverId, itemName, count, metadata)
                local xPlayer = ESX.GetPlayerFromId(serverId)
    
                exports['mf-inventory']:removeInventoryItem(xPlayer.getIdentifier(), itemName, count, serverId)
    
                return true
            end
    
            Bridge.AddItem = function(serverId, itemName, count, metadata, cb)
                local xPlayer = ESX.GetPlayerFromId(serverId)
    
                exports['mf-inventory']:addInventoryItem(xPlayer.getIdentifier(), itemName, count, serverId, nil,metadata)
    
                return true
            end
    
            Bridge.TransferCreditToMoney = function(serverId, charid)
                if not Prison.Release.TransferCreditsFromAccount then return end
    
                local account = GetPrisonerAccount(charid)
    
                if account then
                    local prisonerCredits = account.balance
    
                    if prisonerCredits > 0 then
                        Bridge.AddItem(serverId, Prison.Accounts.CreditsItem, prisonerCredits)
                        cfxSetState(serverId, 'PrisonAccount', nil)
                    end
                end
            end
    
            Bridge.GetInventoryItems = function(serverId)
                local xPlayer = ESX.GetPlayerFromId(serverId)
    
                if not xPlayer then
                    return
                end
    
                local inventory = exports['mf-inventory']:getPlayerInventory(xPlayer.getIdentifier())
    
                return inventory or {}
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
                        Bridge.AddItem(serverId, item.name, item.count, item.metadata, item.slot or nil)
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
    
    
            Bridge.TakePrisonerItems = function(serverId, charId)
                if not Prison.Release.StashItems then return end
                if not serverId then return end
    
                local prisonerItems = Bridge.GetInventoryItems(serverId)
                local p = promise.new()
                local saveItems = {}
    
                if #prisonerItems > 0 then
                    for i = 1, #prisonerItems do
                        local item = prisonerItems[i]
                        local itemName = item.name and item.name:lower() or nil
                        local itemMetadata = item.metadata and item.metadata or nil
                        local itemCount = item.count
    
                        if itemName and not Prison.KeepItems[itemName] then
                            if not saveItems[i] then
                                saveItems[i] = item
                            end
    
                            Bridge.RemoveItem(serverId, itemName, itemCount, itemMetadata)
                        end
    
                        if i == #prisonerItems then
                            p:resolve()
                        end
                    end
                else
                    p:resolve()
                end
    
                Citizen.Await(p)
    
                db.SavePrisonerItems(saveItems, charId)
            end
    
            shared.inventory = 'ESX'
        end
    end)
end)