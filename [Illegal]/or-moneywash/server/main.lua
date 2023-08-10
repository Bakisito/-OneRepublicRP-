local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('baki:moneywash', function(amount, playerCoords)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    amount = tonumber(amount)

    if amount < 0 then return end
    local dirtyMoney = Player.Functions.GetItemByName(DirtyMoneyItem)

    -- print("Cantidad ingresada:", amount) -- Debug
    -- print("Dinero sucio disponible:", dirtyMoney and dirtyMoney.amount or "Ninguno") -- Debug

    if not dirtyMoney or (dirtyMoney.amount and dirtyMoney.amount < amount) then
        TriggerClientEvent('QBCore:Notify', src, 'No tienes suficiente dinero sucio.', 'error')
        return
    end

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
        -- print("Dirty Money Item:", DirtyMoneyItem)
        -- print("Amount to wash:", amount)
        TriggerClientEvent('QBCore:Notify', src, 'Espera unos segundos', 'success')
        TriggerClientEvent('baki:moneywash:start', src)
        Wait(15000)
        Player.Functions.AddItem(CleanMoneyItem, newAmount)
        TriggerClientEvent('QBCore:Notify', src, 'Haz recibido $' .. tonumber(newAmount) .. ' en efectivo', 'success')
    end
    local character = Player.PlayerData.charinfo
    local characterName = character.firstname .. " " .. character.lastname

    local steamName = GetPlayerName(src)

    local discordIdentifier = nil
    for _, id in ipairs(GetPlayerIdentifiers(src)) do
        if string.match(id, "discord:") then
            discordIdentifier = string.gsub(id, "discord:", "")
            break
        end
    end
    local discordUsername = "@" .. discordIdentifier

    SendToDiscord(characterName, steamName, discordUsername, amount, newAmount, currentLocation.name, tax)
end)

function startup()
    print("[OR] Baki-Moneywash has started. | Version 1.0.4")
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        startup()
    end
end)

function SendToDiscord(characterName, steamName, discordUsername, dirtyMoney, cleanMoney, locationName, tax)
    local embed = {
        {
            ["color"] = 16711680,
            ["title"] = "Lavado de Dinero",
            ["description"] = "Nombre: " .. characterName .. "\nSteam: " .. steamName .. "\nDiscord: " .. discordUsername .. "\nDinero Sucio: $" .. dirtyMoney .. "\nDinero Limpio: $" .. cleanMoney .. "\nUbicación: " .. locationName .. "\nImpuesto: " .. tax .. "%",
            ["thumbnail"] = {
                ["url"] = "https://hoy.com.do/wp-content/uploads/2022/07/14_El-Pais_15_4okp01.jpg"
            },
            ["footer"] = {
                ["text"] = "Logs de Lavado de Dinero",
            },
        }
    }

    PerformHttpRequest(Config.WebhookURL, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
end

