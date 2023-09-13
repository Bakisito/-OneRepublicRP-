local QBCore = exports['qb-core']:GetCoreObject()

local rentalVehicles = {}

CreateThread(function()
    for id, data in pairs(Config.Locations) do
        local hash = data.ped.hash
        local coords = data.ped.coords
        local scenario = data.ped.scenario
        local targetIcon = data.ped.icon
        local blipSprite = data.blip.sprite
        local blipColor = data.blip.color
        local blipShortRange = data.blip.shortrange
        local blipScale = data.blip.scale
        local blipName = data.blip.name
        QBCore.Functions.LoadModel(hash)
        local RentalPed = CreatePed(0, hash, coords.x, coords.y, coords.z-1.0, coords.w, false, false)
        TaskStartScenarioInPlace(RentalPed, scenario, true)
        FreezeEntityPosition(RentalPed, true)
        SetEntityInvincible(RentalPed, true)
        SetBlockingOfNonTemporaryEvents(RentalPed, true)

        local rentalBlip = AddBlipForCoord(coords)
        SetBlipSprite(rentalBlip, blipSprite)
        SetBlipColour(rentalBlip, blipColor)
        SetBlipAsShortRange(rentalBlip, blipShortRange)
        SetBlipScale(rentalBlip, blipScale)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(blipName)
        EndTextCommandSetBlipName(rentalBlip)

        exports['qb-target']:AddTargetEntity(RentalPed, {
            options = {
                {
                    num = 1,
                    icon = targetIcon,
                    label = Lang:t('targetlabels.rent_vehicle'),
                    action = function()
                        RentalMenu(id, data)
                    end,
                },
                {
                    num = 2,
                    icon = 'fas fa-list-ul',
                    label = Lang:t('targetlabels.view_rentals'),
                    action = function()
                        ShowRentals(id)
                    end,
                },
            },
            distance = 2.0
        })
    end
end)

function ShowRentals(id)
    if not id then return end
    local rentals = {
        id = 'rentals',
        title = Lang:t('info.current_rentals'),
        options = {}
    }
    local options = {}
    for key, rental in pairs(rentalVehicles) do
        if rental.id == id then
            local vehicleCoords = GetEntityCoords(rental.vehicle)
            local street = GetStreetNameAtCoord(vehicleCoords.x, vehicleCoords.y, vehicleCoords.z)
            local streetName = GetStreetNameFromHashKey(street)
            local gasLevel = GetVehicleFuelLevel(rental.vehicle)
            options[#options+1] = {
                title = rental.vehicleName,
                description = Lang:t('info.return_vehicle'),
                arrow = true,
                metadata = {
                    {label = Lang:t('info.vehicle_plate'), value = rental.vehiclePlate},
                    {label = Lang:t('info.vehicle_fuel'), value = gasLevel},
                    {label = Lang:t('info.vehicle_location'), value = streetName},
                },
                event = 'kevin-rentals:returnvehicle',
                args = {
                    key = key,
                    vehicle = rental.vehicle,
                    returnCoords = rental.returnCoords,
                    rentalPrice = rental.rentalPrice,
                }
            }
        end
    end
    rentals['options'] = options
    lib.registerContext(rentals)
    lib.showContext('rentals')
end

RegisterNetEvent('kevin-rentals:returnvehicle', function (data)
    if not data then return end
    local rentalVehicle = data.vehicle
    local returnCoords = data.returnCoords
    local rentalPrice = data.rentalPrice

    local vehicleLocation = GetEntityCoords(rentalVehicle)
    local dist = #(vector3(returnCoords) - vehicleLocation)
    if dist < 15 then
        NetworkRequestControlOfEntity(rentalVehicle)
        Wait(500)
        SetVehicleAsNoLongerNeeded(rentalVehicle)
        NetworkFadeOutEntity(rentalVehicle, false, true)
        DeleteEntity(rentalVehicle)
        table.remove(rentalVehicles, data.key)
        TriggerServerEvent('kevin-rentals:returnvehicle', rentalPrice, rentalVehicle)
    end
end)

function RentalMenu(id, data)
    if not id then return end
    local resgisteredMenu = {
        id = 'rentalmenu',
        title = Lang:t('info.available_vehicle'),
        options = {}
    }
    local options = {}
    for _, v in pairs(data.vehicles) do
        local vehiclename = QBCore.Shared.Vehicles[v.vehiclehash]['name']
        options[#options+1] = {
            title = vehiclename,
            image = v.vehicleimage,
            icon = v.icon,
            description = Lang:t('info.vehicle_fuel'),
            progress = v.gas,
            arrow = true,
            metadata = {
                {label = Lang:t('info.vehicle_price'), value = '$'..v.price},
            },
            event = 'kevin-rentals:sendform',
            args = {
                id = id,
                hash = v.vehiclehash,
                coords = data.spawnpoints,
                vehicle = vehiclename,
                price = v.price,
                gas = v.gas
            }
        }
    end

    resgisteredMenu['options'] = options
    lib.registerContext(resgisteredMenu)
    lib.showContext('rentalmenu')
end

RegisterNetEvent('kevin-rentals:sendform', function (data)
    if not data then return end
    local header = 'Rental Form'
    local input = lib.inputDialog(header, {
        { type = 'select', label = Lang:t('info.payment_method'), options = {
            { value = 'cash', label = Lang:t('info.payment_cash'), icon = 'fas fa-wallet'},
            { value = 'bank', label = Lang:t('info.payment_bank'), icon = 'fas fa-landmark'},
        }},
        { type = 'number', label = Lang:t('info.time_for_rental'), default = 0 },
    })
    local payMethod = input[1]
    local rentTime = input[2]
    if rentTime ~= nil then
        if rentTime < 12 then
            if payMethod then
                TriggerServerEvent('kevin-rentals:sendinfomation', data, payMethod, rentTime)
            else
                QBCore.Functions.Notify(Lang:t('error.no_payment_method'), 'error', 4500)
            end
        else
            QBCore.Functions.Notify(Lang:t('error.above_rental_limit'), 'error', 4500)
        end
    else
        QBCore.Functions.Notify(Lang:t('error.no_rental_time'), 'error', 4500)
    end
end)

RegisterNetEvent('kevin-rentals:createvehicle', function (data, rentTime)
    if not data then return end
    local hash = data.hash
    local vehiclePrice = data.price
    local vehicleName = data.vehicle
    local vehicleGas = data.gas
    local spawnPoints = data.coords
    local id = data.id
    local coords = spawnPoints[math.random(#spawnPoints)]
    if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 1.0) then
        repeat
            coords = spawnPoints[math.random(#spawnPoints)]
        until not IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 1.0)
    end
    QBCore.Functions.LoadModel(hash)
    local rentalVehicle = CreateVehicle(hash, coords.x, coords.y, coords.z, coords.w, true, true)
    if DoesEntityExist(rentalVehicle) then
        vehicleRented = true
        local vehiclePlate = QBCore.Functions.GetPlate(rentalVehicle)
        networkID = NetworkGetNetworkIdFromEntity(rentalVehicle)
        SetEntityAsMissionEntity(rentalVehicle)
        SetNetworkIdExistsOnAllMachines(networkID, true)
        NetworkRegisterEntityAsNetworked(rentalVehicle)
        SetNetworkIdCanMigrate(networkID, true)
        SetVehicleDirtLevel(rentalVehicle, 0)
        SetVehicleEngineOn(rentalVehicle, true, true)
        SetVehicleDoorsLocked(rentalVehicle, 1)
        exports[Config.FuelScript]:SetFuel(rentalVehicle, vehicleGas)
        NetworkFadeInEntity(rentalVehicle, 1)
        TriggerEvent('vehiclekeys:client:SetOwner', vehiclePlate)
        TriggerServerEvent('kevin-rentals:sendvehicledata', vehicleName, vehiclePlate, rentTime)

        table.insert(rentalVehicles, {id = id, vehicleName = vehicleName , vehicle = rentalVehicle, vehiclePlate = vehiclePlate, returnCoords = coords, rentalPrice = vehiclePrice})
    end
end)

RegisterNetEvent('kevin-rentals:client:givekeys', function (plate)
    local player = PlayerPedId()
    local closeVeh = lib.getClosestVehicle(GetEntityCoords(player), 5.0)
    local vehPlate = GetVehicleNumberPlateText(closeVeh)
    if closeVeh then
        if vehPlate == plate then
            TriggerEvent('vehiclekeys:client:SetOwner', plate)
        else
            QBCore.Functions.Notify(Lang:t('error.not_the_right_vehicle'), 'error', 4500)
        end
    else
        QBCore.Functions.Notify(Lang:t('error.no_vehicle_nearby'), 'error', 4500)
    end
end)

