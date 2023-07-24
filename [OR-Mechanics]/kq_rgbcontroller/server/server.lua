QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('rgb_controller', function(source)
    TriggerClientEvent('kq_rgbcontroller:toggleMenu', source)
end)