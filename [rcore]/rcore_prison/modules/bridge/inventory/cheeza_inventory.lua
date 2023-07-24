CreateThread(function()
    IsResourceLoaded('inventory', function(state, inventory)
        if state then
            local ESX = GetSharedObjectSafe()
            
            local loadouts = {}
    
            function Search(inv, search, item, metadata)
                local player = ESX.GetPlayerFromId(inv)
                local data = player.getInventory()
    
                search = tostring(search)
    
                if search and search:lower() == "count" then
                    local retval = 0
                    for k,v in pairs(data) do
                        if v.name == item then
                            retval += v.count
                        end
                    end
        
                    return retval
                end
        
                local retval = {}
    
                retval[item] = 0
        
                for k,v in pairs(data) do
                    if v.name == item then
                        retval[item] += v.count
                    end
                end
        
                return retval
            end
    
            Bridge.GetItem = function(serverId, itemName, metadata)
                return Search(serverId, 'count', itemName, metadata)
            end
    
            Bridge.GetInventoryItems = function(inv)
                local player = ESX.GetPlayerFromId(inv)
                local data = player.getInventory()
                local retval = {}
                local size = 0
    
                for k, v in pairs(data) do
                    if Search(inv, 'count', v.name) > 0 then
                        size = size + 1
                        if not retval[size] then
                            retval[size] = v
                        end
                    end    
                end
    
                return retval
            end
    
            Bridge.RemoveItem = function(serverId, itemName, count, metadata)
                local xPlayer = ESX.GetPlayerFromId(serverId)
                xPlayer.removeInventoryItem(itemName, count)
                return true
            end
    
            Bridge.AddItem = function(serverId, itemName, count, metadata, cb)
                local xPlayer = ESX.GetPlayerFromId(serverId)
    
                if itemName:find('WEAPON') then
                    xPlayer.addWeapon(itemName, count)
                else
                    xPlayer.addInventoryItem(itemName, count)
                end
    
                return true
            end
    
            Bridge.TransferCreditToMoney = function(serverId, charid)
                if not Prison.Release.TransferCreditsFromAccount then return end
    
                local xPlayer = ESX.GetPlayerFromId(serverId)
                local account = GetPrisonerAccount(charid)
    
                if account then
                    local prisonerCredits = account.balance
    
                    if prisonerCredits > 0 then
                        local accounts = xPlayer.getAccounts('bank')
                        local hasAccounts = false
    
                        if accounts then
                            hasAccounts = true
                            xPlayer.addMoney(prisonerCredits , "")
                        end
    
                        if not hasAccounts then
                            Bridge.AddItem(serverId, Prison.Accounts.CreditsItem, prisonerCredits)
                        end
    
                        cfxSetState(serverId, 'PrisonAccount', nil)
                    end
                end
            end
    
            function ReturnPrisonerItems(serverId)
                local player = Bridge.GetPlayer(serverId)
    
                if not player then return end
    
                local data = db.FetchStashItems(player.charid)
                local state = false
    
                local charId = player.charid
                local xPlayer = ESX.GetPlayerFromId(serverId)
    
                if xPlayer and loadouts[charId] then
                    for i=1, #loadouts[charId], 1 do
                        xPlayer.addWeapon(loadouts[charId][i].name, loadouts[charId][i].ammo)
    
                        if i == #loadouts[charId] then
                            loadouts[charId] = nil
                        end
                    end
                end
    
                Bridge.ReturnUserMoney(xPlayer, charId)
    
                if data and #data > 0 then
                    local items = json.decode(data)
    
                    state = true
    
                    for k, item in pairs(items) do
                        Bridge.AddItem(serverId, item.name, item.count, item.metadata)
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
    
            Bridge.ReturnUserMoney = function(xPlayer, charId)
                if not xPlayer then return end
                
                local accounts = xPlayer.getAccounts('bank')
    
                if not accounts then return end
    
                table.insert(accounts, {
                    label = 'pocketMoney',
                })
    
                Wait(0)
    
                for indexName, data in pairs(accounts) do
                    local prefix = nil
                    local label = nil
    
                    if type(data) == 'number' then
                        label = indexName
                        prefix = ('money:%s:%s'):format(charId, label)
                    else
                        label = data and data.label
                        prefix = ('money:%s:%s'):format(charId, label)
                    end
    
                    if prefix and label then
                        local money = GetResourceKvpInt(prefix)
    
                        if money and money > 0 then
                            if label == 'pocketMoney' then
                                xPlayer.addMoney(money)
                            elseif label == 'black_money' then
                                xPlayer.addAccountMoney(label, money, "")
                            end
    
                            SetTimeout(1000, function()
                                DeleteResourceKvp(prefix)
                            end) 
                        end
                    end
                end
            end
    
            Bridge.SaveUserMoney = function(xPlayer, charId)
                if not xPlayer then return end
                
                local accounts = xPlayer.getAccounts('bank')
    
                if not accounts then return end
    
                local pocketMoney = xPlayer.getMoney()
    
                if pocketMoney and pocketMoney > 0 then
                    table.insert(accounts, {
                        label = 'pocketMoney',
                        money = pocketMoney
                    })
                end
    
                for indexName, data in pairs(accounts) do
                    local prefix = nil
                    local label = nil
                    local amount = 0
    
                    if type(data) == 'number' then
                        label = indexName
                        amount = data
                        prefix = ('money:%s:%s'):format(charId, label)
                    else
                        label = data.label
                        amount = data.money
                        prefix = ('money:%s:%s'):format(charId, label)
                    end
    
                    if prefix then
                        if label and label == 'pocketMoney' then
                            xPlayer.removeMoney(amount)
                            SetResourceKvpInt(prefix, amount)
                        elseif label and label == 'black_money' then
                            xPlayer.removeAccountMoney(label, amount, "")
                            SetResourceKvpInt(prefix, amount)
                        end
                    end
                end
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
                local p = promise.new()
                local saveItems = {}
    
                local xPlayer = ESX.GetPlayerFromId(serverId)
    
                if not loadouts[charId] then
                    loadouts[charId] = xPlayer.getLoadout()
                end
    
                if xPlayer and xPlayer.loadout then
                    for i=1, #xPlayer.loadout, 1 do
                        xPlayer.removeWeapon(xPlayer.loadout[i].name)
                    end
                end
    
                Bridge.SaveUserMoney(xPlayer, charId)
                
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