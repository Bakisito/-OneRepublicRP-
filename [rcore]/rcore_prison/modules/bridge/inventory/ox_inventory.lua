CreateThread(function()
    local SCRIPT_NAME = 'ox_inventory'
    local IMPORT_STATE = false
    local ITEM_LIST = {
        {
            label = 'Cigar',
            name = 'cigar',
            close = true,
            stackable = true,
            description = 'Cigar',
            weight = 0,
        },
        {
            label = 'Sludgie',
            name = 'sludgie',
            close = true,
            stackable = true,
            description = 'Sludgie',
            weight = 0,
        },
        {
            label = 'Sprunk',
            name = 'sprunk',
            close = true,
            stackable = true,
            description = 'Sprunk',
            weight = 0,
        },
        {
            label = 'Ecola light',
            name = 'ecola_light',
            close = true,
            stackable = true,
            description = 'Ecola light',
            weight = 0,
        },
        {
            label = 'Coffee',
            name = 'coffee',
            close = true,
            stackable = true,
            description = 'Coffee',
            weight = 0,
        },
        {
            label = '69 Brand',
            name = 'cigs_69brand',
            close = true,
            stackable = true,
            description = 'cigs_69brand',
            weight = 0,
        },
        {
            label = 'Cardiaque',
            name = 'cigs_cardiaque',
            close = true,
            stackable = true,
            description = 'cigs_cardiaque',
            weight = 0,
        },
        {
            label = 'Debonaire Blue',
            name = 'cigs_debonaireblue',
            close = true,
            stackable = true,
            description = 'cigs_debonaireblue',
            weight = 0,
        },
        {
            label = 'Debonaire Green',
            name = 'cigs_debonairegreen',
            close = true,
            stackable = true,
            description = 'cigs_debonairegreen',
            weight = 0,
        },
        {
            label = 'Red Wood',
            name = 'cigs_redwood',
            close = true,
            stackable = true,
            description = 'cigs_redwood',
            weight = 0,
        }
    }
    
    InsertAndSaveItemsFromPrison = function(func)
        local ItemList = func:Items()
    
        if #ITEM_LIST > 0 then
            local dump = {}
            local count = 0
    
            for i = 1, #ITEM_LIST do
                local item = ITEM_LIST[i]
    
                if not ItemList[item.name] then
                    item.close = item.close == nil and true or item.close
                    item.stack = item.stackable == nil and true or item.stackable
                    item.description = item.description
                    item.weight = item.weight or 0
                    item.client = item.client or nil
                    dump[i] = item
                    count += 1
    
                    if i == #ITEM_LIST then
                        IMPORT_STATE = true
                    end
                end
            end
    
            if IMPORT_STATE == false then
                return -- Items are fined boy.
            end
    
            local file = { string.strtrim(LoadResourceFile(SCRIPT_NAME, 'data/items.lua')) }
    
            file[1] = file[1]:gsub('}$', '')
    
            -- DONT TOUCH THIS, BREAKS CONVERTION
    
                        local itemFormat = [[
            
        ['%s'] = {
            label = '%s',
            weight = %s,
            stack = %s,
            close = %s,
            description = %s
        },
    ]]
    
    
            local fileSize = #file
    
            for _, item in pairs(dump) do
                local formatName = item.name:gsub("'", "\\'"):lower()
    
                if not ItemList[formatName] then
                    fileSize += 1
                    file[fileSize] = (itemFormat):format(formatName, item.label:gsub("'", "\\'"):lower(), item.weight,
                        item.stack, item.close, item.description and ('"%s"'):format(item.description) or 'nil')
                    ItemList[formatName] = v
                end
            end
    
            file[fileSize + 1] = '}'
    
            SaveResourceFile(SCRIPT_NAME, 'data/items.lua', table.concat(file), -1)
            dbg.debug('Imported needed items for [%s] with count [%s]', SCRIPT_NAME, count)
            dbg.debug('You should restart inventory resource to load the new items from our script! \nrefresh \nensure ox_inventory')
        end
    end
    
    IsResourceLoaded('ox_inventory', function(state, inventory)
        if state then
    
            if IsScriptLoaded('qb-inventory') then
                LevelDebug(3, 'error', 'Failed to hook ox_inventory, detected qb-inventory running along!') 
            end
    
            InsertAndSaveItemsFromPrison(inventory)
    
            Bridge.GetItem = function(serverId, itemName, metadata)
                return inventory:GetItem(serverId, itemName, metadata, {})
            end
    
            Bridge.RemoveItem = function(serverId, itemName, count, metadata)
                return inventory:RemoveItem(serverId, itemName, count, metadata)
            end
    
            Bridge.AddItem = function(serverId, itemName, count, metadata, cb)
                local retval = false
                
                inventory:AddItem(serverId, itemName, count, metadata, nil, function(state, reason)
                    if state then
                        retval = true
                    else
                        retval = false
                    end
                end)
    
                return retval
            end
    
            Bridge.TransferCreditToMoney = function(serverId, charid)
                if not Prison.Release.TransferCreditsFromAccount then return end
    
                local account = GetPrisonerAccount(charid)
    
                if account then
                    local prisonerCredits = account.balance
    
                    if prisonerCredits > 0 then
                        inventory:AddItem(serverId, Prison.Accounts.CreditsItem, prisonerCredits, nil, nil)
                        cfxSetState(serverId, 'PrisonAccount', nil)
                    end
                end
            end
    
            Bridge.GetInventoryItems = function(serverId)
                local inv = inventory:Inventory(serverId)
                local inventory, count = {}, 0
                for k, v in pairs(inv.items) do
                    if v.name and v.count > 0 then
                        count += 1
                        inventory[count] = {
                            name = v.name,
                            count = v.count,
                            slot = k,
                            metadata = next(v.metadata) and v.metadata or nil
                        }
                    end
                end
    
                return inventory
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
                        inventory:AddItem(serverId, item.name, item.count, item.metadata, item.slot or nil)
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
                local p = promise.new()
                local saveItems = {}
    
                if #prisonerItems > 0 then
                    for i = 1, #prisonerItems do
                        local item = prisonerItems[i]
                        local itemName = item.name:lower()
                        local itemCount = item.count
    
                        if not Prison.KeepItems[itemName] then
                            if not saveItems[i] then
                                saveItems[i] = item
                            end
    
                            inventory:RemoveItem(serverId, itemName, itemCount)
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
    
            shared.inventory = 'OX'
        end
    end)    
end)