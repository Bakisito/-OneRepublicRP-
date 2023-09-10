-- For support join my discord: https://discord.gg/Z9Mxu72zZ6
QBCore = exports["qb-core"]:GetCoreObject()

function notifyCops(notifyType, coords, street)
    if not street then return end
    local players = QBCore.Functions.GetQBPlayers()
    for _, v in pairs(players) do
        if v and v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            if notifyType == "drill" then
                TriggerClientEvent("ND_ATMRobbery:Report", v.PlayerData.source, coords, street, street .. " atm is drilled.")
            else
                TriggerClientEvent("ND_ATMRobbery:Report", v.PlayerData.source, coords, street, street .. " atm is pulled of the wall.")
            end
        end
    end
end

function atmRobbed(source)
    local moneyFound = math.random(100, 5000)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        Player.Functions.AddMoney("blackmoney", moneyFound, "ATM Robbery")
    end
end

function policeCheck()
    local cops = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            cops = cops + 1
        end
    end
    if cops >= config.copCheck then
        return true
    end
    return false
end

if not config.bridge.ox_inventory then
    QBCore.Functions.CreateUseableItem("drill", function(source, item)
        TriggerClientEvent("ND_ATMRobbery:useDrill", source, item.name)
    end)
    
    QBCore.Functions.CreateUseableItem("rope", function(source, item)
        TriggerClientEvent("ND_ATMRobbery:useRope", source, item.name)
    end)
    
    RegisterNetEvent("ND_ATMRobbery:useItem", function(item)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        Player.Functions.RemoveItem(item, 1)
    end)
end