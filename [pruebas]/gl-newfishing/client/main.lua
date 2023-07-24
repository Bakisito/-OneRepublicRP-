QBCore = exports['qb-core']:GetCoreObject()

local isFishing = false
local baitAmount = 0
local baitType = ''
local MID, Cache, MissionBlip = nil, nil, nil
local fishSellerSpawned, illegalFishSellerSpawned = false, false
local fishSeller, illegalFishSeller
local fishingrod = nil

-- Functions
local function CreateRod()
	local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)
    fishingrod = CreateObject(`prop_fishing_rod_01`, pedCoords, true)
    AttachEntityToEntity(fishingrod, ped, GetPedBoneIndex(ped, 18905), 0.1, 0.05, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
    QBCore.Functions.RequestAnimDict('amb@world_human_stand_fishing@idle_a')
    TaskPlayAnim(ped, "amb@world_human_stand_fishing@idle_a", "idle_c", 1.0, -1.0, -1, 1, 0, 0, 48, 0)
end

local function DeleteRod()
    if fishingrod ~= 0 then
        DetachEntity(fishingrod)
		DeleteObject(fishingrod)
    end
end

local function FishAnimation()
    local ped = PlayerPedId()
    LocalPlayer.state:set("inv_busy", true, true)
    QBCore.Functions.LoadModel('a_c_fish')
    Fish = CreatePed(4, `a_c_fish`, 0,0,0, 0, true, true)
    SetEntityHealth(Fish, 0)
    AttachEntityToEntity(Fish, ped, GetPedBoneIndex(ped, 57005), 0.18, 0, 0.10, 0.10, 270.0, 60.0, true, true, false, true, 1, true)
    Wait(1000)
    QBCore.Functions.Progressbar("pickingupfish", 'Picking Up Fish', 1000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "pickup_object",
        anim = "putdown_low",
        flags = 48,
    }, {}, {}, function()
        StopAnimTask(ped, "pickup_object", "putdown_low", 1.0)
        LocalPlayer.state:set("inv_busy", false, true)
        DeleteEntity(Fish)
        SetModelAsNoLongerNeeded(`a_c_fish`)
    end)
end

local function CaughtFish(type)
    local types = {
        ['Deep'] = {
            {
                event = 'gl-fishing:catchFishDeep',
                attempts = 4,
            }
        },
        ['Normal'] = {
            {
                event = 'gl-fishing:catchFishCommon',
                attempts = 1,
            },
            {
                event = 'gl-fishing:catchFishMedium',
                attempts = 2,
            },
            {
                event = 'gl-fishing:catchFishRare',
                attempts = 3,
            }
        }
    }

    local ped = PlayerPedId()
    local Random = types[type][math.random(1, #types[type])]
    TaskPlayAnim(ped, "amb@world_human_stand_fishing@idle_a", "idle_c", 1.0, -1.0, -1, 1, 0, 0, 48, 0)
    local success = Config.MiniGame(Random.attempts)
    if success then
        TriggerServerEvent(Random.event)
        DeleteRod()
        isFishing = false
        StopAnimTask(ped, "amb@world_human_stand_fishing@idle_a", "idle_c", 1.0)
        FishAnimation()
    else
        DeleteRod()
        isFishing = false
        StopAnimTask(ped, "amb@world_human_stand_fishing@idle_a", "idle_c", 1.0)
        QBCore.Functions.Notify('The Fish Got Away, try a little harder next time', 'error', 2000)
    end 
end

local function CreateCache()
    QBCore.Functions.LoadModel('prop_drop_crate_01')
    Cache = CreateObject(`prop_drop_crate_01`, MIB.coords, false, true, true)
    exports['qb-target']:AddTargetEntity(Cache, {
        options = {
            {
                type = 'client',
                event = 'gl-fishing:openCache',
                icon = 'fa-solid fa-wine-bottle',
                label = 'Open Cache',
            }
        },
        distance = 2.5,
    })
end

local function SetDisplay(bool, message)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        message = message
    })
end

-- Events
RegisterNetEvent('gl-fishing:checkCanFish', function()
    local pos = GetEntityCoords(PlayerPedId())
    if pos.x <= Config.DeepSeaDistance and baitType == Config.DeepSeaBait and baitAmount > 0 then
        TriggerEvent('gl-fishing:fishStart','Deep')
    elseif baitType == Config.NormalBait and baitAmount > 0 then
        TriggerEvent('gl-fishing:fishStart','Normal')
    else
        QBCore.Functions.Notify('You think fish are not hungry? Try to put some bait on it first', 'error', 5000)
    end
end)

RegisterNetEvent('gl-fishing:fishStart', function(type)
    if not isFishing then
        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)
        local canFish = false
        if not IsPedInAnyVehicle(playerPed) then
            baitAmount = baitAmount - 1
            DeleteRod()
            
            if type == 'Deep' and pedCoords.x <= Config.DeepSeaDistance then
                canFish = true
            elseif type ~= 'Deep' then
                if Config.FishAnywhere then
                    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 5.0, 0.0)
                    local bool, ground = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, false)
                    local bool2, ground2 = GetGroundZFor_3dCoord(coords.x, coords.y, coords.z, true)
                    local hit, watercoords = TestProbeAgainstWater(coords.x, coords.y, ground2, coords.x, coords.y, ground+0.3, false,false)
                    if hit then
                        canFish = true
                    end
                elseif pedCoords.y >= Config.MinNorth or pedCoords.y <= Config.MinSouth or pedCoords.x <= Config.MinWest or pedCoords.x >= Config.MinEast then
                    canFish = true
                end
            end
            
            if canFish then
                CreateRod()
                QBCore.Functions.Progressbar("fishing", 'Fishing', math.random(Config.MinFishingTime, Config.MaxFishingTime), false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    CaughtFish(type)
                end, function()
                    StopAnimTask(ped, "amb@world_human_stand_fishing@idle_a", "idle_c", 1.0)
                    QBCore.Functions.Notify("Stopped Fishing", "primary", 1000)
                end)
            else
                QBCore.Functions.Notify('You can\'t fish here, try somewhere near the water', 'error', 5000)
            end
        end
    end
end)

RegisterNetEvent('gl-fishing:usedBait', function(type)
    baitType = type
    baitAmount = Config.BaitUses
end)

RegisterNetEvent('gl-fishing:spawnFishPed', function(coords, heading)
    QBCore.Functions.LoadModel('a_m_m_ktown_01')
    fishSeller = CreatePed(5, `a_m_m_ktown_01`, coords, heading, false, false)
    FreezeEntityPosition(fishSeller, true)
    SetEntityInvincible(fishSeller, true)
    SetBlockingOfNonTemporaryEvents(fishSeller, true)
    SetModelAsNoLongerNeeded(`a_m_m_ktown_01`)
    exports['qb-target']:AddTargetEntity(fishSeller, {
        options = {
            {
                type = 'server',
                event = 'gl-fishing:sellFish',
                icon = 'fa-solid fa-fish',
                label = 'Sell Fish',
            }
        },
        distance = 2.5,
    })    
end)

RegisterNetEvent('gl-fishing:spawnIllegalFishPed', function(coords, heading)
    QBCore.Functions.LoadModel('a_m_m_mlcrisis_01')
    illegalFishSeller = CreatePed(5, `a_m_m_mlcrisis_01`, coords, heading, false, false)
    FreezeEntityPosition(illegalFishSeller, true)
    SetEntityInvincible(illegalFishSeller, true)
    SetBlockingOfNonTemporaryEvents(illegalFishSeller, true)
    SetModelAsNoLongerNeeded(`a_m_m_mlcrisis_01`)
    exports['qb-target']:AddTargetEntity(illegalFishSeller, {
        options = {
            {
                type = 'server',
                event = 'gl-fishing:sellIllegalFish',
                icon = 'fa-solid fa-fish-fins',
                label = 'Sell Fish',
            }
        },
        distance = 2.5,
    })
end)

RegisterNetEvent('gl-fishing:useMIB', function()
    MIB = Config.MIB[math.random(1, #Config.MIB)]
    if MIB then
        RemoveBlip(MissionBlip)
        MissionBlip = AddBlipForCoord(MIB.coords)
        SetBlipSprite(MissionBlip , 478)
        SetBlipScale(MissionBlip , 0.8)
        SetBlipColour(MissionBlip, 83)
        SetBlipAsShortRange(MissionBlip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Cache")
        EndTextCommandSetBlipName(MissionBlip)
        SetDisplay(not display, MIB.message)
        CreateThread(function()
            while not Cache do
                local dst = #(GetEntityCoords(PlayerPedId()) - MIB.coords)
                if dst <= 30 then
                    CreateCache()
                    onMission = false
                end
                Wait(100)
            end
        end)
    end
end)

RegisterNetEvent('gl-fishing:openCache',function()
    local ped = PlayerPedId()
    QBCore.Functions.RequestAnimDict('amb@medic@standing@kneel@base')
    TaskPlayAnim(ped, "amb@medic@standing@kneel@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)
    QBCore.Functions.Progressbar("openingcache", "Opening Cache", 3000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = true,
        disableCombat = true,
    }, {
        animDict = "anim@gangops@facility@servers@bodysearch@",
        anim = "player_search",
        flags = 48,
    }, {}, {}, function()
        StopAnimTask(ped, "anim@gangops@facility@servers@bodysearch@", "player_search", 1.0)
        StopAnimTask(ped, "amb@medic@standing@kneel@base", "base", 1.0)
        DeleteEntity(Cache)
        RemoveBlip(MissionBlip)
        TriggerServerEvent('gl-fishing:lootCache', MIB.item1, MIB.item1Amount, MIB.item2, MIB.item2Amount)
    end)
end)

-- NUI Callbacks
RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

RegisterNUICallback("main", function(data)
    amount = tonumber(data.text)
    SetDisplay(false)
end)

RegisterNUICallback("error", function(data)
    SetDisplay(false)
end)

-- MainThread
CreateThread(function()
    local fishSellerblip = AddBlipForCoord(Config.FishSellSpot)
    SetBlipSprite(fishSellerblip, 272)
    SetBlipDisplay(fishSellerblip, 4)
    SetBlipScale(fishSellerblip, 0.8)
    SetBlipColour(fishSellerblip, 18)
    SetBlipAsShortRange(fishSellerblip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Fisherman")
    EndTextCommandSetBlipName(fishSellerblip)
    while true do
        Wait(1000)
        local ped = PlayerPedId() 
        local pedCoords = GetEntityCoords(ped)
        local dstSellSpot = #(Config.FishSellSpot - pedCoords)
        if dstSellSpot < 100 and fishSellerSpawned == false then
            TriggerEvent('gl-fishing:spawnFishPed', Config.FishSellSpot, 52.06)
            fishSellerSpawned = true
        end
        if dstSellSpot >= 101  then
            fishSellerSpawned = false
            DeleteEntity(fishSeller)
        end
        
        local dstIllegalSpot = #(Config.IllegalSellSpot - pedCoords)
        if dstIllegalSpot < 100 and illegalFishSellerSpawned == false then
            TriggerEvent('gl-fishing:spawnIllegalFishPed', Config.IllegalSellSpot, 52.06)
            illegalFishSellerSpawned = true
        end
        if dstSellSpot >= 101  then
            illegalFishSellerSpawned = false
            DeleteEntity(illegalFishSeller)
        end
    end
end)