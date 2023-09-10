-- For support join my discord: https://discord.gg/Z9Mxu72zZ6
QBCore = exports["qb-core"]:GetCoreObject()

-- Create blip on the map for the cops.
RegisterNetEvent("ND_ATMRobbery:Report", function(coords, street, report)
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

    SetBlipSprite(blip, 161)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, true)
    
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("ATM Alarm: " .. street)
    EndTextCommandSetBlipName(blip)

    TriggerEvent("chat:addMessage", {
        color = {255, 0, 0},
        args = {"ATM Alarm", report}
    })

    Wait(30000)
    RemoveBlip(blip)
end)


if config.bridge.ox_inventory then
    exports("drill", function(data, slot)
        local used = useDrill()
        if used then
            exports.ox_inventory:useItem(data)
        end
    end)

    exports("rope", function(data, slot)
        local used = useRope()
        if used then
            exports.ox_inventory:useItem(data)
        end
    end)
else
    RegisterNetEvent("ND_ATMRobbery:useDrill", function(itemName)
        local used = useDrill()
        if used then
            TriggerServerEvent("ND_ATMRobbery:useItem", itemName)
        end
    end)

    RegisterNetEvent("ND_ATMRobbery:useRope", function(itemName)
        local used = useRope()
        if used then
            TriggerServerEvent("ND_ATMRobbery:useItem", itemName)
        end
    end)
end

function notify(notiTitle, notiDescription, notiType, duration, playSound)
    --QBCore.Functions.Notify({text = notiDescription, caption = notiTitle}, notiType, 5000)
    local time = duration or 5000
    local sound = playSound or true
    exports['okokNotify']:Alert(notiTitle, notiDescription, time, notiType, sound)

end
