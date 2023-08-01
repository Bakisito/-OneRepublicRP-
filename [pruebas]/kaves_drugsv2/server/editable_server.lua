Framework = nil

Citizen.CreateThread(function()
    if Config.Framework == "esx" then
        TriggerEvent('esx:getSharedObject', function(obj) Framework = obj end)
    elseif Config.Framework == "qbcore" then
        Framework = exports['qb-core']:GetCoreObject()
    else
        print("[KAVES SCRIPTS] FRAMEWORK NOT FOUND!")
    end
end)

Citizen.CreateThread(function()
    if Framework == nil then
        print("[KAVES SCRIPTS] FRAMEWORK NOT FOUND!")
        return
    end
    if Config.Framework == "esx" then

        GetPlayer = function(Id)
            return Framework.GetPlayerFromId(Id)
        end

        GetIdentifier = function(Id)
            return Framework.GetPlayerFromId(Id).identifier
        end

        GetPlayerJob = function(Id)
            return Framework.GetPlayerFromId(Id).getJob().name
        end

        GetPlayerJobGrade = function(Id)
            return Framework.GetPlayerFromId(Id).getJob().grade
        end

        AddInventoryItem = function(Id, item, count)
            local xPlayer = Framework.GetPlayerFromId(Id)
            if xPlayer then
                xPlayer.addInventoryItem(item, count)
            end
        end

        RemoveInventoryItem = function(Id, item, count)
            local xPlayer = Framework.GetPlayerFromId(Id)
            if xPlayer then
                xPlayer.removeInventoryItem(item, count)
            end
        end

        GetInventoryItem = function(Id, item)
            local xPlayer = Framework.GetPlayerFromId(Id)
            if xPlayer then
                return xPlayer.getInventoryItem(item)
            end
        end

        UsableItem = Framework.RegisterUsableItem

        AddMoney = function(Id, amount)
            local xPlayer = Framework.GetPlayerFromId(Id)
            if xPlayer then
                xPlayer.addMoney(amount)
            end
        end

        AddBlackMoney = function(Id, amount)
            local xPlayer = Framework.GetPlayerFromId(Id)
            if xPlayer then
                xPlayer.addAccountMoney("black_money", amount)
            end
        end

        GetMoney = function(Id)
            local xPlayer = Framework.GetPlayerFromId(Id)
            if xPlayer then
                return xPlayer.getMoney()
            end
        end

        GetPlayerSource = function(identifier)
            return Framework.GetPlayerFromIdentifier(identifier)
        end

        RemoveMoney = function(Id, amount)
            local xPlayer = Framework.GetPlayerFromId(Id)
            if xPlayer then
                xPlayer.removeMoney(amount)
            end
        end

        Notification = function(Id, message)
            local xPlayer = Framework.GetPlayerFromId(Id)
            if xPlayer then
                xPlayer.showNotification(message)
            end
        end
        
    elseif Config.Framework == "qbcore" then

        GetPlayer = function(Id)
            return Framework.Functions.GetPlayer(Id)
        end

        GetIdentifier = function(Id)
            return Framework.Functions.GetIdentifier(Id, 'license')
        end

        GetPlayerJob = function(Id)
            return Framework.Functions.GetPlayer(Id).PlayerData.job.name
        end

        GetPlayerJobGrade = function(Id)
            return Framework.Functions.GetPlayer(Id).PlayerData.job.grade.level
        end

        AddInventoryItem = function(Id, item, count)
            local xPlayer = Framework.Functions.GetPlayer(Id)
            if xPlayer then
                xPlayer.Functions.AddItem(item, count)
            end
        end

        RemoveInventoryItem = function(Id, item, count)
            local xPlayer = Framework.Functions.GetPlayer(Id)
            if xPlayer then
                xPlayer.Functions.RemoveItem(item, count)
            end
        end

        GetInventoryItem = function(Id, item)
            local xPlayer = Framework.Functions.GetPlayer(Id)
            if xPlayer then
                return xPlayer.Functions.GetItemByName(item)
            end
        end

        UsableItem = Framework.Functions.CreateUsableItem

        AddMoney = function(Id, amount)
            local xPlayer = Framework.Functions.GetPlayer(Id)
            if xPlayer then
                xPlayer.Functions.AddMoney("cash", amount)
            end
        end

        AddBlackMoney = function(Id, amount)
            local xPlayer = Framework.GetPlayerFromId(Id)
            if xPlayer then
                xPlayer.Functions.AddMoney("black_money", amount)
            end
        end

        RemoveMoney = function(Id, amount)
            local xPlayer = Framework.Functions.GetPlayer(Id)
            if xPlayer then
                xPlayer.Functions.RemoveMoney("cash", amount)
            end
        end

        GetPlayerSource = function(identifier)
            return Framework.Functions.GetSource(identifier)
        end

        GetMoney = function(Id)
            local xPlayer = Framework.Functions.GetPlayer(Id)
            if xPlayer then
                return xPlayer.PlayerData.money.cash
            end
        end

        Notification = function(Id, message)
            local xPlayer = Framework.Functions.GetPlayer(Id)
            if xPlayer then
                TriggerClientEvent("QBCore:Notify", Id, message)
            end
        end

    end
end)

