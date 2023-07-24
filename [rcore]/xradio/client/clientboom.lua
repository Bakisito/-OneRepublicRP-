QBCore = exports["qb-core"]:GetCoreObject()


RegisterNetEvent('kitipo:guardar', function()
      TriggerEvent("xradio:deleteRadioOnGround")
end)

RegisterNetEvent('kitipo:abrir', function()
     TriggerEvent("xradio:openRadio") 
end)


RegisterNetEvent('kitipo:hombro', function()
    TriggerEvent("xradio:radioOnShoulder") 
end)


-- Main Thread
CreateThread(function()

    -- --Kitipo 
    exports['qb-target']:AddTargetModel(`prop_boombox_01`, {
        options = {
            {
                event = "kitipo:guardar",
                icon = "fas fa-hand-paper",
                label = 'Guardar Kitipo'           
             },
             {
                event = "kitipo:abrir",
                icon = "fa-solid fa-radio",
                label = 'Usar Kitipo'
            }, 
            {   
                event = "kitipo:hombro",
                icon =  "fa-solid fa-person",
                label = 'Cargar Kitipo al hombro'
            }
        },
        distance = 2.5,
    })

end)
-- Abrir el menú de opciones del kitipo al presionar la tecla E
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(0, 38) then -- 38 es el código de la tecla E
            TriggerEvent("xradio:menuOpened", "shoulder")
        end
    end
end)

-- Mostrar el menú de opciones del kitipo cuando se abre
AddEventHandler("xradio:menuOpened", function(type)
    if type == "shoulder" then
        AbrirRadioMenuEnHombro()
    end
end)

-- Función para abrir el menú de opciones del kitipo
function AbrirRadioMenuEnHombro()
    -- Verificar si la radio está en el hombro
    if IsRadioOnShoulder() then
        -- Abrir el menú de opciones
        exports['qb-menu']:openMenu({
            {
                isMenuHeader = true,
                header = "Kitipo",
                icon = "boombox"
            },
            {
                header = "Usar",
                txt = "Pon musica y disfruta de ella",
                params = {
                    event = "xradio:openShoulderUi"
                }
            },
            {
                header = "Guardar",
                txt = "Guarda tu kitipo compañero",
                params = {
                    event = "xradio:hideShoulderRadio"
                }
            },
            {
                header = "Poner en el suelo",
                txt = "Pero compartan compartan!",
                params = {
                    event = "xradio:putRadioBackGround"
                }
            }
        })
    end
end