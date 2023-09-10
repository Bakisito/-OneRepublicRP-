
-- For support join my discord: https://discord.gg/Z9Mxu72zZ6
ESX = exports['es_extended']:getSharedObject()

function notifyCops(notifyType, coords, street)
    if not street then return end
    local xPlayers = ESX.GetExtendedPlayers("job", "police")
    for i=1, #xPlayers do
        if notifyType == "drill" then
            TriggerClientEvent("ND_ATMRobbery:Report", xPlayers[i].source, coords, street, street .. " atm is drilled.")
        else
            TriggerClientEvent("ND_ATMRobbery:Report", xPlayers[i].source, coords, street, street .. " atm is pulled of the wall.")
        end
    end
end

function policeCheck()
    local xPlayers = ESX.GetExtendedPlayers("job", "police")
    if #xPlayers >= config.copCheck then
        return true
    end
    return false
end

function atmRobbed(source)
    local moneyFound = math.random(100, 5000)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(moneyFound)
end

if not config.bridge.ox_inventory then
    ESX.RegisterUsableItem("drill", function(source)
        TriggerClientEvent("ND_ATMRobbery:useDrill", source)
    end)

    ESX.RegisterUsableItem("rope", function(source)
        TriggerClientEvent("ND_ATMRobbery:useRope", source)
    end)

    RegisterNetEvent("ND_ATMRobbery:useItem", function(item)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.removeInventoryItem(item, 1)
    end)
end