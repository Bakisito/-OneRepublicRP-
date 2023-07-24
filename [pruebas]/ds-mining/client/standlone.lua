QBCore = nil
if Config.Object.usingexport then
    QBCore = exports[Config.Object.CoreName]:GetCoreObject()
else
    TriggerEvent(Config.Object.event, function(obj) QBCore = obj end)
end

HasItem = function(item, qty)
    local hasitem = false
    local PlayerData = QBCore.Functions.GetPlayerData()
    for _, itemData in pairs(PlayerData.items) do
        if itemData and itemData.name == item and (not qty or (qty and itemData.amount >= qty)) then
            hasitem = true
        end
    end
    return hasitem
end

Notify = function(msg, type)
    QBCore.Functions.Notify(msg, type)
end


Progressbar = function(label, time)
    local retval = false
    QBCore.Functions.Progressbar(label, label, time, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() -- Done
        retval = true
    end, function() -- Cancel
        retval = false
    end)
    Wait(time+1000)
    return retval
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('ds-mining:server:getdata', function(Data)
        MineData = Data
    end)
    playerjob = QBCore.Functions.GetPlayerData().job.name
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    playerjob = QBCore.Functions.GetPlayerData().job.name
end)

RegisterNetEvent("Startprog")
AddEventHandler("Startprog", function(duration, label)
    local retval = nil
    QBCore.Functions.Progressbar("drugs", label, duration, false, false, {
        disableMovement = false,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = false,
    }, {}, {}, {}, function()
        retval = true
    end, function()
        retval = false
    end)

    while retval == nil do
        Wait(1)
    end
    return retval
end)

RegisterNetEvent("ds-mining:openfoodshop")
AddEventHandler("ds-mining:openfoodshop", function()
    local ShopItems = {}
    ShopItems.label = Language['mining_shop']
    ShopItems.items = Config.FoodShopItems
    ShopItems.slots = #Config.FoodShopItems
    TriggerServerEvent("jim-shops:ShopOpen", "shop", "Miningshop_"..math.random(1, 99), ShopItems)
end)

RegisterNetEvent("ds-mining:buystuff")
AddEventHandler("ds-mining:buystuff", function()
    local ShopItems = {}
    ShopItems.label = Language['mining_shop']
    ShopItems.items = Config.MineShopItems
    ShopItems.slots = #Config.MineShopItems
    TriggerServerEvent("jim-shops:ShopOpen", "shop", "Miningshop_"..math.random(1, 99), ShopItems)
end)


RegisterNetEvent("ds-mining:removeitem")
AddEventHandler("ds-mining:removeitem", function(item, qty)
    TriggerServerEvent("ds-mining:removeQBItem", item, qty)
end)

DrawText3Ds = function(x, y, z, text)
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 400
    DrawRect(0.0, 0.0+0.0110, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end


helpText = function(msg)
    -- BeginTextCommandDisplayHelp('STRING')
    -- AddTextComponentSubstringPlayerName(msg)
    -- EndTextCommandDisplayHelp(0, false, true, -1)
    QBCore.Functions.Notify(msg, "info")

end


CustomCoolDown = function()
    return true
end