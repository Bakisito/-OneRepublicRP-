local QBCore = exports['qb-core']:GetCoreObject()

local ox_inventory = nil
if Config.Inventory == 'ox' then
    ox_inventory = exports.ox_inventory
end

QBCore.Commands.Add(Config.AdminCommand, 'Show list of stores for robberies', {}, false, function(source, _)
    TriggerClientEvent('kevin-storerobbery:showstores', source)
end, 'admin')

RegisterNetEvent('kevin-storerobbery:setstate', function(id, state, type)
    local PlayerId = source
    if type == 'openregister' or type == 'blocktarget' or type == 'canloot' then
        state = not state
    end
    TriggerClientEvent('kevin-storerobbery:updatestate', -1, id, state, type)
end)

RegisterNetEvent('kevin-storerobbery:sendlog', function (id , data, storeLocation, waitTime)
    local PlayerId = source
	local Player = QBCore.Functions.GetPlayer(PlayerId)
    if not Player and data and storeLocation then return end

    TriggerEvent('qb-log:server:CreateLog', 'storerobbery', 'Store Robbery', 'green',
    '**'..'Player: '..GetPlayerName(Player.PlayerData.source)..'**\n'..
    '**'..'Citizen Id: '..Player.PlayerData.citizenid..'**\n'..
    '**'..'Player Id: '..Player.PlayerData.source..'**\n'..
    'Store Started : '..storeLocation..'\n'..
    'Store Type Id : '..id..'\n'..
    'Type : '..data.type..'\n'..
    'Time till '..data.type..' Opens : '..waitTime..' minutes'..'\n')
end)

RegisterNetEvent('kevin-storerobbery:giverewards', function (id, data, storeLocation)
    local PlayerId = source
	local Player = QBCore.Functions.GetPlayer(PlayerId)
    local cashreward
    local itemName = 'None Received'
    local itemAmt = 0
    local item = nil
    local PlayerCoords = GetEntityCoords(GetPlayerPed(PlayerId))
	local dist = #(PlayerCoords - vector3(data.target.coords.x, data.target.coords.y, data.target.coords.z))
    if not data and id and dist > 10.0 then return end
    if data.type == 'safe' then
        cashreward = math.random(Config.SafeData.min, Config.SafeData.max)
        Player.Functions.AddMoney('blackmoney', cashreward, 'Crime')
        
        local chance = math.random(1, 100)
        if chance < Config.SafeData.itemchance then
            item = Config.SafeData.items[math.random(#Config.SafeData.items)]
            itemName = item.name
            itemAmt = item.amount
            if Config.Inventory == 'ox' then
                local success, response = ox_inventory:AddItem(PlayerId, itemName, itemAmt)
                if not success then
                    TriggerClientEvent('QBCore:Notify', PlayerId, 'Inventory seems full', 'error', 6000)
                end
            else
                if Player.Functions.AddItem(itemName, itemAmt, false) then
                    TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[itemName], 'add', itemAmt)
                end
            end
        end
    else
        cashreward = math.random(Config.RegisterData.min, Config.RegisterData.max)
        Player.Functions.AddMoney('blackmoney', cashreward, 'Crime')
    end
    StartResetTimer(id, data)
    TriggerClientEvent('kevin-storerobbery:updatestate', -1, id, false, 'canloot')
    TriggerClientEvent('kevin-storerobbery:updatestate', -1, id, false, 'blocktarget')

    TriggerEvent('qb-log:server:CreateLog', 'storerobbery', 'Store Robbery', 'green',
    '**'..'Player: '..GetPlayerName(Player.PlayerData.source)..'**\n'..
    '**'..'Citizen Id: '..Player.PlayerData.citizenid..'**\n'..
    '**'..'Player Id: '..Player.PlayerData.source..'**\n'..
    'Store Location : '..storeLocation..'\n'..
    'Store Type Id : '..id..'\n'..
    'Type : '..data.type..'\n'..
    'Total Cash Earned: $'..cashreward..'\n'..
    'Item Earned: '..itemName..' '..itemAmt..'x'..'\n')
end)

function StartResetTimer(id, data)
    CreateThread(function ()
        Wait(Config.StoreRefreshTime * 60000)
        TriggerClientEvent('kevin-storerobbery:updatestate', -1, id, false, 'openregister')
    end)
end