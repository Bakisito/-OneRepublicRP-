local QBCore = exports['qb-core']:GetCoreObject()

function openwasher()
    local input = lib.inputDialog('Lavar dinero', {'Dinero Sucio'})

    if not input or not input[1] or input[1] == '' then
        QBCore.Functions.Notify('Debes ingresar una cantidad válida.', 'error')
        return
    end

    local amount = tonumber(input[1])

    if amount == 0 then 
        QBCore.Functions.Notify('El valor no puede ser 0', 'error')
        return
    end

    if amount < 0 then 
        QBCore.Functions.Notify('El valor debe ser mayor que 0', 'error')
        return
    end

    local currentLocation = nil
    for _, loc in ipairs(Config.Locations) do
        local dist = #(GetEntityCoords(PlayerPedId()) - vector3(loc.x, loc.y, loc.z))
        if dist < 5.0 then
            currentLocation = loc
            break
        end
    end

  

    local tax = currentLocation.tax
    local bidentax = (input[1] * tax) / 100

    if Config.Misc.UseprogressCircle then 
        if lib.progressCircle({
            duration = Config.Misc.Progressduration,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
                car = true,
            },
        }) then
            local amounttobegivenincash = input[1] - bidentax
            print(tonumber(amounttobegivenincash))
            local playerCoords = GetEntityCoords(PlayerPedId())
            TriggerServerEvent('baki:moneywash', amounttobegivenincash, playerCoords)
       
        else 
            print("Oh no")
        end
    end

    if not Config.Misc.UseprogressCircle then 
        
        local amounttobegivenincash = input[1] - bidentax
        local playerCoords = GetEntityCoords(PlayerPedId())
        TriggerServerEvent('baki:moneywash', input[1], playerCoords)
    
    end
end 

CreateThread(function()
    while true do
        Wait(100)
        local inRange = false
        local pos = GetEntityCoords(PlayerPedId())
        for _, loc in ipairs(Config.Locations) do
            local location = vector3(loc.x, loc.y, loc.z)
            if #(pos - location) < 5.0 then
                inRange = true
                lib.showTextUI('[E] - Lavar Dinero')
                if IsControlPressed(0, 38) then
                    openwasher()
                    lib.hideTextUI()
                end
                break
            end
        end

        if not inRange then
            lib.hideTextUI()
        end
    end
end)

RegisterNetEvent('baki:moneywash:start', function()
    QBCore.Functions.Progressbar("moneywash", "Lavando Dinero", 15000, false, true, {
        disableMovement = true,
        disableCarMovement = false,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_stand_impatient@female@no_sign@idle_a",
        anim = "idle_a",
        flags = 16,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "amb@world_human_stand_impatient@female@no_sign@idle_a", "idle_a", 1.0)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "amb@world_human_stand_impatient@female@no_sign@idle_a", "idle_a", 1.0)
        QBCore.Functions.Notify("Cancelado..", "error")
    end)
end)

