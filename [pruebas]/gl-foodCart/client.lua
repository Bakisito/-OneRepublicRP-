QBCore = exports['qb-core']:GetCoreObject()
local myStand = nil
local vehicle, foodCart
local PlayerData = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

CreateThread(function()
    foodCartBlip = AddBlipForCoord(410.5, -1925.38, 24.98)
    SetBlipSprite(foodCartBlip, 210)
    SetBlipDisplay(foodCartBlip, 4)
    SetBlipScale(foodCartBlip, 0.5)
    SetBlipColour(foodCartBlip, 26)
    SetBlipAsShortRange(foodCartBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Alquiler de carritos de comida")
    EndTextCommandSetBlipName(foodCartBlip)

    exports['qb-target']:SpawnPed({
        model = 'a_m_y_soucent_03',
        coords = vector4(409.52, -1923.67, 24.05, 41.67),
        freeze = true,
        invincible = true,
        blockevents = true,
        target = {
            useModel = false,
            options = {
                {
                    event = "gl-foodCart:chooseCart",
                    icon = "far fa-comment",
                    label = "Alquilar un carro por $" .. Config.RentalPrice,
                },
                {
                    event = "gl-foodCart:returnVeh",
                    icon = "far fa-comment",
                    label = "Devolver el vehículo",
                },
            },
            distance = 3.0,
        },
    })
end)

RegisterNetEvent('gl-foodCart:openMenu', function()
    local foodMenu = {}
    for k, v in pairs(Config.Foods[myStand].Items) do
        foodMenu[#foodMenu + 1] = {
            header = 'Preparar ',
            txt = k,
            params = {
                event = 'gl-foodCart:cookFood',
                args = {
                    item = v.itemName,
                    cookTime = v.cookTime,
                    animType = v.animationType,
                    animDict = v.animDict,
                    animation = v.animation
                }
            }
        }
    end
    exports['qb-menu']:openMenu(foodMenu)
end)

RegisterNetEvent('gl-foodCart:chooseCart', function()
    QBCore.Functions.TriggerCallback("gl-foodCart:canIAffordIt", function(cb)
        if cb then
            local foodCarts = {}
            for k, v in pairs(Config.FoodCarts) do
                foodCarts[#foodCarts + 1] = {
                    header = 'Take Out ',
                    txt = v.cartName,
                    params = {
                        event = 'gl-foodCart:attachFood',
                        args = {
                            name = v.cartName,
                            selected = v.cartModel,
                            job = v.job,
                            propX = v.propX,
                            propY = v.propY,
                            propZ = v.propZ,
                        }
                    }
                }
            end
            exports['qb-menu']:openMenu(foodCarts)
        end
    end)
end)

RegisterNetEvent('gl-foodCart:returnVeh', function()
    if DoesEntityExist(vehicle) then
        local vehCoords = GetEntityCoords(vehicle)
        local pedCoords = GetEntityCoords(PlayerPedId())
        local dst = #(vehCoords - pedCoords)
        if dst < 50 then
            DeleteEntity(foodCart)
            QBCore.Functions.DeleteVehicle(vehicle)
            TriggerServerEvent('gl-foodCart:rentalReturn')
        end
    end
end)

RegisterNetEvent('gl-foodCart:cookFood', function(data)
    local ped = PlayerPedId()
    if data.animType == 'other' then
        QBCore.Functions.Progressbar("cooking_food", "Cocinando..", data.cookTime, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = true,
            disableCombat = true,
        }, {
            animDict = data.animDict,
            anim = data.animation,
            flags = 48,
        }, {}, {}, function()
            StopAnimTask(ped, data.animDict, data.animation, 1.0)
            TriggerServerEvent('gl-foodCart:addFood', data.item)
        end)
    else
        QBCore.Functions.Progressbar("cooking_food", "Cocinando..", data.cookTime, false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = true,
            disableCombat = true,
        }, {
            task = data.animation
        }, {}, {}, function()
            ClearPedTasks(ped)
            SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
            TriggerServerEvent('gl-foodCart:addFood', data.item)
        end)
    end
end)

RegisterNetEvent('gl-foodCart:attachFood', function(data)
    if data.job == 'all' or data.job == PlayerData.job.name then
        local hash = data.selected
        local vehHash = 'bmx'
        myStand = data.name
        QBCore.Functions.LoadModel(hash)
        QBCore.Functions.LoadModel(vehHash)
        
        local pedCoords = GetEntityCoords(PlayerPedId())
        local bone = GetEntityBoneIndexByName(vehicle, 'wheel_lf')

        QBCore.Functions.SpawnVehicle(vehHash, function(veh)
            Entity(veh).state.ignoreLocks = true
            local coords = GetEntityCoords(veh)
            foodCart = CreateObject(hash, coords, true, true, false)
            AttachEntityToEntity(foodCart, veh, bone, data.propX, data.propY, data.propZ, 0, 0, -100.0, 1, 1, 0, 0, 2, 1)
            SetEntityCollision(foodCart, true, true)
            
            local stands = {
                'prop_burgerstand_01',
                'prop_hotdogstand_01'
            }
            
            exports['qb-target']:AddTargetModel(stands, {
                options = {
                    {
                        event = "gl-foodCart:openMenu",
                        icon = "fas fa-hand-paper",
                        label = "Abrir el menú",
                    },
                
                },
                distance = 2.5
            })
            SetModelAsNoLongerNeeded(hash)
            SetModelAsNoLongerNeeded(vehHash)
        end, pedCoords, false)
    else
        TriggerServerEvent('gl-foodCart:wrongJob')
    end
end)
