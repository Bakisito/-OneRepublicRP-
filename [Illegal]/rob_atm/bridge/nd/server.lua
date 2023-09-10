-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

NDCore = exports["ND_Core"]:GetCoreObject()

-- you can notify cops using this, or not if you don't want to. notifyType can be "drill" or "rope".
function notifyCops(notifyType, coords, street)
    if not street then return end
    local players = NDCore.Functions.GetPlayers()
    local departments = {
        ["SAHP"] = true,
        ["LSPD"] = true,
        ["BCSO"] = true
    }

    if notifyType == "drill" then
        for player, playerData in pairs(players) do
            if departments[playerData.job] then
                TriggerClientEvent("ND_ATMRobbery:Report", player, coords, street, street .. " atm is drilled.")
            end
        end
        return
    end

    for player, playerData in pairs(players) do
        if departments[playerData.job] then
            TriggerClientEvent("ND_ATMRobbery:Report", player, coords, street, street .. " atm is pulled of the wall.")
        end
    end
end

-- result after searching the atm.
function atmRobbed(source)
    local moneyFound = math.random(100, 5000)
    NDCore.Functions.AddMoney(moneyFound, source, "cash")
end

-- check for amount of police and return true if there's enough. Other wise it will return false.
function policeCheck()
    local policeDepartments = {
        ["SAHP"] = true,
        ["LSPD"] = true,
        ["BCSO"] = true
    }
    local cops = 0
    local players = NDCore.Functions.GetPlayers()
    for player, playerInfo in pairs(players) do
        if policeDepartments[playerInfo.job] then
            cops = cops+1
        end
    end
    if cops >= config.copCheck then
        return true
    end
    return false
end