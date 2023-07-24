QBCore = exports['qb-core']:GetCoreObject()

-- Events
RegisterServerEvent('gl-fishing:catchFishCommon', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local caughtFish = Config.CommonFish[math.random(1, #Config.CommonFish)]
    Player.Functions.AddItem(caughtFish.name, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[caughtFish.name], "add", 1)
end)

RegisterServerEvent('gl-fishing:catchFishMedium', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local caughtFish = Config.MediumFish[math.random(1, #Config.MediumFish)]
    Player.Functions.AddItem(caughtFish.name, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[caughtFish.name], "add", 1)
end)

RegisterServerEvent('gl-fishing:catchFishRare', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local random = math.random(1,100)
    if random <= Config.MIBChance then
        Player.Functions.AddItem('mib', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['mib'], "add", 1)
    else
        local caughtFish = Config.RareFish[math.random(1, #Config.RareFish)]
        Player.Functions.AddItem(caughtFish.name, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[caughtFish.name], "add", 1)
    end
end)

RegisterServerEvent('gl-fishing:catchFishDeep', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rareChance = math.random(1,5)
    if rareChance >= 3 then
        local caughtFish = Config.DeepSeaFish[math.random(1, #Config.DeepSeaFish)]
        Player.Functions.AddItem(caughtFish.name, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[caughtFish.name], "add", 1)
    else
        local caughtFish = Config.MediumFish[math.random(1, #Config.MediumFish)]
        Player.Functions.AddItem(caughtFish.name, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[caughtFish.name], "add", 1)
    end
end)

RegisterServerEvent('gl-fishing:sellFish', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    -- Common Fish
    for k, v in pairs(Config.CommonFish) do
        local item = Player.Functions.GetItemByName(v.name)
        if item then
            Player.Functions.RemoveItem(item.name, item.amount, item.slot)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "add", item.amount)
            Player.Functions.AddMoney('cash', (item.amount * v.price))
            Wait(1000)
        end
    end

    -- Medium Fish
    for k, v in pairs(Config.MediumFish) do
        local item = Player.Functions.GetItemByName(v.name)
        if item then
            Player.Functions.RemoveItem(item.name, item.amount, item.slot)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "add", item.amount)
            Player.Functions.AddMoney('cash', (item.amount * v.price))
            Wait(1000)
        end
    end

    -- Rare Fish
    for k, v in pairs(Config.RareFish) do
        local item = Player.Functions.GetItemByName(v.name)
        if item then
            Player.Functions.RemoveItem(item.name, item.amount, item.slot)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "add", item.amount)
            Player.Functions.AddMoney('cash', (item.amount * v.price))
            Wait(1000)
        end
    end
end)

RegisterServerEvent('gl-fishing:sellIllegalFish', function()
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.DeepSeaFish) do
        local item = Player.Functions.GetItemByName(v.name)
        if item then
            Player.Functions.RemoveItem(item.name, item.amount, item.slot)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.name], "add", item.amount)
            Player.Functions.AddMoney('cash', (item.amount * v.price))
            Wait(1000)
        end
    end
end)

RegisterServerEvent('gl-fishing:lootCache', function(item1, item1Amount, item2, item2Amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if item1 == 'money' then
        Player.Functions.AddMoney('cash', item1Amount)
    else
        Player.Functions.AddItem(item1, item1Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item1], "add", item1Amount)
    end

    if item2 == 'money' then
        Player.Functions.AddMoney('cash', item2Amount)
    else
        Player.Functions.AddItem(item2, item2Amount)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item2], "add", item2Amount)
    end
end)

-- Useable Items
QBCore.Functions.CreateUseableItem("fishingrod", function(source, item)
	TriggerClientEvent('gl-fishing:checkCanFish', source)
end)

QBCore.Functions.CreateUseableItem(Config.NormalBait, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(Config.NormalBait, 1, item.slot) then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.NormalBait], "remove", 1)
        TriggerClientEvent('gl-fishing:usedBait', source, Config.NormalBait)
    end
end)

QBCore.Functions.CreateUseableItem(Config.DeepSeaBait, function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem(Config.DeepSeaBait, 1, item.slot) then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.DeepSeaBait], "remove", 1)
        TriggerClientEvent('gl-fishing:usedBait', source, Config.DeepSeaBait)
    end
end)

QBCore.Functions.CreateUseableItem('mib', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if Player.Functions.RemoveItem('mib', 1, item.slot) then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mib'], "remove", 1)
        TriggerClientEvent('gl-fishing:useMIB', source)
    end
end)