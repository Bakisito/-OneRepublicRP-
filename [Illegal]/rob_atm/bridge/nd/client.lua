-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

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
    RegisterCommand("rope", function(source, args, rawCommand)
        useRope()
    end, false)
    
    RegisterCommand("drill", function(source, args, rawCommand)
        useDrill()
    end, false)
end

function notify(notiTitle, notiDescription, notiType)
    exports.ox_lib:notify({
        title = notiTitle,
        description = notiDescription,
        type = notiType,
        position = "bottom"
    })
end
