QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while Framework == nil do
        Citizen.Wait(100)
    end
    if Config.Framework == "esx" then

        Framework.RegisterServerCallback("kaves_drugsv2:server:checkItem", function(source, cb, data)
            local xPlayer = GetPlayer(source)

            if not xPlayer then
                return
            end

            for itemName, itemCount in pairs(data.items) do
                local getItem = GetInventoryItem(source, itemName)
                local checkCount = getItem and getItem.count or 0

                if checkCount < itemCount then
                    Notification(source, (Strings["dont_have_item"]):format(itemName))
                    return cb({status = false})
                end
                if data.remove then
                    RemoveInventoryItem(source, itemName, itemCount)
                end
            end

            if data.bucketId then
                if data.bucketId ~= 0 then
                    SetPlayerRoutingBucket(source, data.bucketId)
                end
            end

            cb({status = true})
        end)

        Framework.RegisterServerCallback("kaves_drugsv2:server:checkCopCount", function(source, cb)
            local xPlayer = GetPlayer(source)

            if not xPlayer then
                return
            end

            local players = GetPlayers()
            local policeCount = 0

            for i = 1, #players do
                local player = GetPlayer(players[i])
                for k,v in pairs(Config.CornerHolding.jobNames) do
                    if player.job.name == v then
                        policeCount = policeCount + 1
                    end
                end
            end

            if policeCount < Config.CornerHolding.requiredCops then
                Notification(source, Strings["cant_corner_not_enough_cops"])
                return cb({status = false})
            end

            cb({status = true})
        end)

    elseif Config.Framework == "qbcore" then

        Framework.Functions.CreateCallback('kaves_drugsv2:server:checkItem', function(source, cb, data)
            local xPlayer = GetPlayer(source)

            if not xPlayer then
                return
            end

            for itemName, itemCount in pairs(data.items) do
                local getItem = GetInventoryItem(source, itemName)
                local checkCount = getItem and getItem.amount or 0

                if checkCount < itemCount then
                    Notification(source, (Strings["dont_have_item"]):format(itemName))
                    return cb({status = false})
                end

                if data.remove then
                    RemoveInventoryItem(source, itemName, itemCount)
                end
            end

            cb({status = true})
        end)

        Framework.Functions.CreateCallback("kaves_drugsv2:server:checkCopCount", function(source, cb)
            local xPlayer = GetPlayer(source)

            if not xPlayer then
                return
            end

            local players = GetPlayers()
            local policeCount = 0

            for i = 1, #players do
                local player = GetPlayer(players[i])
                for k,v in pairs(Config.CornerHolding.jobNames) do
                    if player.PlayerData.job.name == v then
                        policeCount = policeCount + 1
                    end
                end
            end

            if policeCount < Config.CornerHolding.requiredCops then
                Notification(source, Strings["cant_corner_not_enough_cops"])
                return cb({status = false})
            end

            cb({status = true})
        end)
    end
end)

RegisterServerEvent("kaves_drugsv2:server:giveItem", function(itemName, itemCount)
    if itemName == "black_money" then
        if Config.Laundry.giveBlackMoney then
            AddBlackMoney(source, itemCount)
        else
            AddMoney(source, itemCount)
        end
    else
        AddInventoryItem(source, itemName, itemCount)
    end
    Notification(source, (Strings["gave_item"]):format(itemName, itemCount))
end)

RegisterServerEvent("kaves_drugsv2:server:sellItem", function(itemName, itemCount, itemPrice)
    if Config.CornerHolding.giveBlackMoney then
        AddBlackMoney(source, itemPrice)
    else
        AddMoney(source, itemPrice)
    end
    Notification(source, (Strings["sold_item"]):format(itemCount, itemName))
end)

local items = {
    {name = 'coke_small_brick', bags_needed = 50, result = 'cokebaggy', result_amount = 50},
    {name = 'coke_brick', bags_needed = 100, result = 'cokebaggy', result_amount = 100},
    {name = 'big_coke_brick', bags_needed = 250, result = 'cokebaggy', result_amount = 250},
    {name = 'bigger_coke_brick', bags_needed = 0, result = 'big_coke_brick', result_amount = 2},
    {name = 'coke_tons', bags_needed = 0, result = 'bigger_coke_brick', result_amount = 2}
}

for _, item in ipairs(items) do
    RegisterNetEvent('drugs:server:process' .. item.name, function()
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)

        if Player.Functions.GetItemByName('empty_bag').amount >= item.bags_needed then
            if Player.Functions.RemoveItem(item.name) then
                if item.bags_needed > 0 then
                    Player.Functions.RemoveItem('empty_bag', item.bags_needed)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['empty_bag'], 'remove', item.bags_needed)
                end

                Player.Functions.AddItem(item.result, item.result_amount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.result], 'add', item.result_amount)

                print('El jugador ' .. GetPlayerName(src) .. ' usó ' .. item.name)
            else
                TriggerClientEvent('QBCore:Notify', src, 'No tienes ninguna ' .. item.name, 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'No tienes suficientes bolsas vacías', 'error')
        end
    end)

    QBCore.Functions.CreateUseableItem(item.name, function(source, item)
        TriggerClientEvent('drugs:client:use' .. item.name, source, item)
    end)
end
