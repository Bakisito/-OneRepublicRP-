local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('baki:moneywash', function(amount, playerCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if tonumber(amount) < 0 then return end

    local currentLocation = nil
    for _, loc in ipairs(Config.Locations) do
        local dist = #(playerCoords - vector3(loc.x, loc.y, loc.z))
        if dist < 5.0 then
            currentLocation = loc
            break
        end
    end

    if not currentLocation then
        print("Location not found")
        return
    end

    local tax = tonumber(currentLocation.tax)
    local bidentax = math.floor((amount * tax) / 100)
    local newAmount = math.floor(amount - bidentax)
    if Player.Functions.RemoveItem(DirtyMoneyItem, amount) then
        print("Dirty Money Item:", DirtyMoneyItem)
        print("Amount to wash:", amount)
        TriggerClientEvent('QBCore:Notify', src, 'Espera unos segundos', 'success')
        TriggerClientEvent('baki:moneywash:start', src)
        Wait(15000)
        Player.Functions.AddItem(CleanMoneyItem, newAmount)
        TriggerClientEvent('QBCore:Notify', src, 'Haz recibido $' .. tonumber(newAmount) .. ' en efectivo', 'success')
    end
    
end)

function startup()
    print("[OR] Baki-Moneywash has started. | Version 1.0.4")
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        startup()
    end
end)
