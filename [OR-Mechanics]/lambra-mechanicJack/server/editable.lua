QBCore = exports["qb-core"]:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.ItemsNames.carjack, function(source, item)
    local src = source

    TriggerClientEvent("lambra-stealWheelsP:client:spawnCarjack", src)
end)

QBCore.Functions.CreateUseableItem(Config.ItemsNames.brick, function(source, item)
    local src = source

    TriggerClientEvent("lambra-stealWheelsP:client:usedBrick", src)
end)

QBCore.Functions.CreateUseableItem(Config.ItemsNames.wheel, function(source, item)
    local src = source

    TriggerClientEvent("lambra-stealWheelsP:client:usedWheel", src)
end)