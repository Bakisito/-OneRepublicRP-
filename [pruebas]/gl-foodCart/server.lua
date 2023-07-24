QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('gl-foodCart:rentalReturn', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local returnAmt = (Config.RentalPrice / 2)
    Player.Functions.AddMoney('cash', returnAmt)
end)

RegisterNetEvent('gl-foodCart:addFood', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.AddItem(item, 1) then
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)
    end
end)

QBCore.Functions.CreateCallback("gl-foodCart:canIAffordIt", function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.money["cash"] >= Config.RentalPrice then
        Player.Functions.RemoveMoney("cash", Config.RentalPrice)
        cb(true)
    end
end)

RegisterNetEvent('gl-foodCart:wrongJob', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney('cash', Config.RentalPrice)
    TriggerClientEvent('QBCore:Notify', src, 'You do not have the correct Job for this cart.', "error")
    TriggerClientEvent('gl-foodCart:chooseCart', src)
end)
