
QBCore= Config.QbCoreExport()


PlayerData = {}
INV = nil


Citizen.CreateThread(function()
    if GetResourceState('ox_inventory') == 'started' then
        INV = 'ox'
        ox_inventory = exports.ox_inventory
    elseif GetResourceState('qs-inventory') == 'started' then
        INV = 'qs'
    else
        INV = 'other'
    end
end)

    Citizen.CreateThread(function()
            Citizen.Wait(2000)
                TriggerClientEvent(GetCurrentResourceName()..':client:sendPlaceItems', -1, Config.PlaceItems)
    end)

    if Config.SaveDB then
        Citizen.CreateThread(function()
            TriggerEvent(GetCurrentResourceName()..':server:getPlaceItems')
        end)
    end

    AddEventHandler('playerJoining', function(source)
        src = source
        TriggerClientEvent(GetCurrentResourceName()..':client:sendPlaceItems', src, Config.PlaceItems)
    end)



RegisterServerEvent(GetCurrentResourceName()..':server:HideConsumeItem')
AddEventHandler(GetCurrentResourceName()..':server:HideConsumeItem', function(item, size, content)
     src = source
     if (PlayerData[src]) then
        local Player = QBCore.Functions.GetPlayer(src)
        local data = Config.ConsumeItems[item]
         if INV == 'ox' then
                if data.Type == 'GLASS' and content ~= 'nil' then
                    exports.ox_inventory:AddItem(src, item, 1, { weight = size, value = size, content = content, description = content }, nil, function(success, reason)
                end)
            else
                exports.ox_inventory:AddItem(src, item, 1, { weight = size, value = size, content = content }, nil, function(success, reason)
                end)
            end
        elseif INV == 'qs' then
            exports['qs-inventory']:AddItem(src, item, 1, nil,{value = size, content = content})
        elseif INV == 'other' then
                local info = {value = size, content = content}
                Player.Functions.AddItem(item, 1, false, info)
        end
    end
end)



RegisterServerEvent(GetCurrentResourceName()..':server:StopConsume')
AddEventHandler(GetCurrentResourceName()..':server:StopConsume', function()
    src = source
    PlayerData[src] = nil
end)


Citizen.CreateThread(function()
if INV == 'ox' or INV == 'other' then

--REGISTER Alcohol Tester Item 
QBCore.Functions.CreateUseableItem(Config.DrunkSystem.TesterItem, function(source)
    if (not PlayerData[source]) then
        PlayerData[source] = Config.DrunkSystem.TesterItem
        
            TriggerClientEvent(GetCurrentResourceName()..':client:UseTester', source)
    end
end)

-- REGISTER ITEMS FOR CONSUME
for k, v in pairs(Config.ConsumeItems) do
	QBCore.Functions.CreateUseableItem(k, function(source, data)
        if (not PlayerData[source]) then
            PlayerData[source] = k
            local Player = QBCore.Functions.GetPlayer(source)
            
            if INV == 'ox' then
                local MainData = Config.ConsumeItems[k]
                if data.metadata.value ~= nil then
                    local value = data.metadata.value
                    TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', source, PlayerData[source], value, data.metadata.content)
                    exports.ox_inventory:RemoveItem(source, k, 1, nil, data.slot)
                else
                    local newvalue = nil
        
                if MainData.Type == 'GLASS' then
                    newvalue = 0
                else
                    newvalue = MainData.Size
                end
                    TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', source, PlayerData[source], newvalue, 'nil')
                    exports.ox_inventory:RemoveItem(source, k, 1, nil, data.slot)
                end
            else
                if data.info.value ~= nil then
                    if not Player.Functions.RemoveItem(k, 1, data.slot) then return end
                    local value = data.info.value
                        TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', source, PlayerData[source], value, data.info.content)
                else
                    
                if not Player.Functions.RemoveItem(k, 1, data.slot) then return end

                local Type = Config.ConsumeItems[k].Type



                local newvalue = nil
                if Type == 'GLASS' then
                    newvalue = 0
                else
                    newvalue = v.Size
                end
                    TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', source, PlayerData[source], newvalue, 'nil')
                end
            end
        else
            TriggerClientEvent(GetCurrentResourceName()..':client:Notify', source, Translations['TEXT']['already'], 'error')
        end
	end)
end

if INV == 'qs' then   
        --REGISTER Alcohol Tester Item 
        exports['qs-inventory']:CreateUsableItem(Config.DrunkSystem.TesterItem, function(source, data)
            if (not PlayerData[source]) then
                PlayerData[source] = Config.DrunkSystem.TesterItem
                
                    TriggerClientEvent(GetCurrentResourceName()..':client:UseTester', source)
            end
        end)

        -- REGISTER ITEMS FOR CONSUME
        for k, v in pairs(Config.ConsumeItems) do
            exports['qs-inventory']:CreateUsableItem(k, function(source, data)
                if (not PlayerData[source]) then
                    PlayerData[source] = k
                    local MainData = Config.ConsumeItems[k]
                    if data.info.value ~= nil then
                        local value = data.info.value
                        TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', source, PlayerData[source], value, data.info.content)
                        exports['qs-inventory']:RemoveItem(source, k, 1, data.slot, nil)
            
                    else
                        local newvalue = nil
            
                    if MainData.Type == 'GLASS' then
                        newvalue = 0
                    else
                        newvalue = MainData.Size
                    end
                            TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', source, PlayerData[source], newvalue, 'nil')
                            exports['qs-inventory']:RemoveItem(source, k, 1, data.slot, nil)
                        end
                    end
                end)
            end
        end
    end
end)


    
RegisterServerEvent(GetCurrentResourceName()..':server:AutoTake')
AddEventHandler(GetCurrentResourceName()..':server:AutoTake', function(item, data)
    src = source
        PlayerData[src] = item
        local MainData = Config.ConsumeItems[item]

        if data.metadata.value ~= nil then
            local value = data.metadata.value
            TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', src, PlayerData[src], value, data.metadata.content)
            exports.ox_inventory:RemoveItem(src, item, 1, nil, data.slot)

        else
            local newvalue = nil

        if MainData.Type == 'GLASS' then
            newvalue = 0
        else
            newvalue = MainData.Size
        end
            TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', src, PlayerData[src], newvalue, 'nil')
            exports.ox_inventory:RemoveItem(src, item, 1, nil, data.slot)
        end
    end)


RegisterServerEvent(GetCurrentResourceName()..':server:Receiver')
AddEventHandler(GetCurrentResourceName()..':server:Receiver', function(target, item, size, content)
    local src = source

    local _source = QBCore.Functions.GetPlayer(target)
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if PlayerData[_source] == nil then
        PlayerData[_source] = item
        TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', _source.PlayerData.source, item, size, content)
    else
        PlayerData[xPlayer] = item
        TriggerClientEvent(GetCurrentResourceName()..':client:Notify', xPlayer.PlayerData.source, Translations['TEXT']['player_already'], 'error')
        TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', xPlayer.PlayerData.source, item, size, content)
    end
end)


RegisterServerEvent(GetCurrentResourceName()..':server:resultRequest')
AddEventHandler(GetCurrentResourceName()..':server:resultRequest', function(target)
    local src = source
    local _source = QBCore.Functions.GetPlayer(target)
    TriggerClientEvent(GetCurrentResourceName()..':client:TargetRequest', _source.PlayerData.source, src)
end)

RegisterServerEvent(GetCurrentResourceName()..':server:cancelTesting')
AddEventHandler(GetCurrentResourceName()..':server:cancelTesting', function(target)
    local src = source
    local _source = QBCore.Functions.GetPlayer(target)
    TriggerClientEvent(GetCurrentResourceName()..':client:stopTesting', _source.PlayerData.source)
end)

RegisterServerEvent(GetCurrentResourceName()..':server:TargetResult')
AddEventHandler(GetCurrentResourceName()..':server:TargetResult', function(p1, result)
    local src = source
    local _source = QBCore.Functions.GetPlayer(p1)
    if result ~= nil then
        TriggerClientEvent(GetCurrentResourceName()..':client:TesterResult', _source.PlayerData.source, result)
    else
        TriggerClientEvent(GetCurrentResourceName()..':client:TesterResult', _source.PlayerData.source, result)
        TriggerClientEvent(GetCurrentResourceName()..':client:Notify', _source.PlayerData.source, Translations['TEXT']['request_rejected'], 'error')
    end
end)

RegisterServerEvent(GetCurrentResourceName()..':server:takePlacedItem')
AddEventHandler(GetCurrentResourceName()..':server:takePlacedItem', function(data, size, content)
    src = source
    Wait(200)
    if (not PlayerData[src]) then
        if size then
        PlayerData[src] = data
        TriggerClientEvent(GetCurrentResourceName()..':client:UseConsumeItem', src, PlayerData[src], size, content)
        end
    else
        TriggerClientEvent(GetCurrentResourceName()..':client:Notify', src, Translations['TEXT']['already'], 'error')
    end
end)


RegisterServerEvent(GetCurrentResourceName()..':server:destroyPlaceItem')
AddEventHandler(GetCurrentResourceName()..':server:destroyPlaceItem', function(placeId)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.PlaceItems) do
        if v.id == placeId then
            table.remove(Config.PlaceItems, k)
        end
    end

    TriggerClientEvent(GetCurrentResourceName()..':client:removePlaceObject', -1, placeId)
    if Config.SaveDB then
    TriggerEvent(GetCurrentResourceName()..':server:PlaceItemRemoved', placeId)
    end
    TriggerEvent(GetCurrentResourceName()..':server:UpdatePlaceItems')
end)

RegisterServerEvent(GetCurrentResourceName()..':server:getPlaceItems')
AddEventHandler(GetCurrentResourceName()..':server:getPlaceItems', function()
    local placeData = {}
    local result = MySQL.Sync.fetchAll('SELECT * FROM dc_needs')

    if result[1] then
        for i = 1, #result do
            local placeData = json.decode(result[i].data)
        
            table.insert(Config.PlaceItems, placeData)

        end
        
    end
end)


RegisterServerEvent(GetCurrentResourceName()..':server:PlaceItemRemoved')
AddEventHandler(GetCurrentResourceName()..':server:PlaceItemRemoved', function(placeId)
    local result = MySQL.Sync.fetchAll('SELECT * FROM dc_needs')

    if result then
        for i = 1, #result do
            local placeData = json.decode(result[i].data)
            if placeData.id == placeId then

                MySQL.Async.execute('DELETE FROM dc_needs WHERE id = @id', {
                    ['@id'] = result[i].id
                })

            end
        end
    end
end)


RegisterServerEvent(GetCurrentResourceName()..':server:savePlaceItem')
AddEventHandler(GetCurrentResourceName()..':server:savePlaceItem', function(item, pos, size, content)
    local src = source
    local data = {}
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local placeId = math.random(1111, 9999)

    
            local data = {id = placeId, item = item, x = pos.x, y = pos.y, z = pos.z, size = size, content = content}
            table.insert(Config.PlaceItems, data)


            if Config.SaveDB then
            TriggerEvent(GetCurrentResourceName()..':server:savePlaceDB', data)
            end
            TriggerEvent(GetCurrentResourceName()..':server:UpdatePlaceItems')

    end)


RegisterServerEvent(GetCurrentResourceName()..':server:savePlaceDB')
AddEventHandler(GetCurrentResourceName()..':server:savePlaceDB', function(data)
    local data = json.encode(data)
    
    MySQL.Async.execute('INSERT INTO dc_needs (data) VALUES (@data)', {
        ['@data'] = data,
    }, function ()
    end)
end)

RegisterServerEvent(GetCurrentResourceName()..':server:SaveContent')
AddEventHandler(GetCurrentResourceName()..':server:SaveContent', function(Id, size, content)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.PlaceItems) do
        if v.id == Id then
            Config.PlaceItems[k].size = size
            Config.PlaceItems[k].content = content
        end
        if Config.SaveDB then
        TriggerEvent(GetCurrentResourceName()..':server:SaveConceptDB', Id, Config.PlaceItems[k])
        end
    end

    TriggerEvent(GetCurrentResourceName()..':server:UpdatePlaceItems')
end)

RegisterServerEvent(GetCurrentResourceName()..':server:SaveConceptDB')
AddEventHandler(GetCurrentResourceName()..':server:SaveConceptDB', function(id, data)
    local result = MySQL.Sync.fetchAll('SELECT * FROM dc_needs')

    if result[1] then
        for i = 1, #result do
            local dbData = json.decode(result[i].data)
            if dbData.id == id then
                local newData = json.encode(data)
                MySQL.Async.execute('UPDATE dc_needs SET data = @data WHERE id = @id', {
                    ['@data'] = newData,
                    ['@id'] = result[i].id,
                }, function ()
                end)
            end
        end
    end
end)


RegisterServerEvent(GetCurrentResourceName()..':server:UpdatePlaceItems')
AddEventHandler(GetCurrentResourceName()..':server:UpdatePlaceItems', function()
    TriggerClientEvent(GetCurrentResourceName()..':client:sendPlaceItems', -1, Config.PlaceItems)
end)


