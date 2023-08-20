local QBCore = exports['qb-core']:GetCoreObject()

local CurrentCops = 0
local doingAnim = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
    onDuty = true
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = true
end)

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

CreateThread(function ()
    for id, data in pairs(Config.StoreData) do
        if Config.Target == 'ox' then
            exports.ox_target:addBoxZone({
                coords = data.target.coords,
                size = vec3(data.target.length, data.target.width, data.target.length),
                distance = 1.0,
                rotation = data.target.heading,
                debug = Config.DebugPolyZones,
                options = {
                    {
                        icon = 'fas fa-circle',
                        name='store'..id,
                        label = data.target.label,
                        onSelect = function()
                            AttemptStore(id, data)
                        end,
                        canInteract = function()
                            return not data.busy
                        end,
                    },
                    {
                        icon = 'fas fa-circle',
                        name='store'..id,
                        label = 'Grab Loot',
                        onSelect = function ()
                            GrabLoot(id, data)
                        end,
                        canInteract = function()
                            return data.canloot
                        end,
                    },
                }
            })
        else
            exports['qb-target']:AddBoxZone('store'..id, data.target.coords, data.target.length, data.target.width, {
                name='store'..id,
                heading= data.target.heading,
                debugPoly= Config.DebugPolyZones,
                minZ= data.target.minZ,
                maxZ= data.target.maxZ,
                }, {
                    options = {
                        {
                            icon = 'fas fa-circle',
                            label = data.target.label,
                            action = function ()
                                AttemptStore(id, data)
                            end,
                            canInteract = function()
                                return not data.busy
                            end,
                        },
                        {
                            icon = 'fas fa-circle',
                            label = 'Grab Loot',
                            action = function ()
                                GrabLoot(id, data)
                            end,
                            canInteract = function()
                                return data.canloot
                            end,
                        },
                    },
                distance = 1.0
            })
        end
        
    end
end)

RegisterNetEvent('kevin-storerobbery:showstores', function ()
    local resgisteredMenu = {
        id = 'stores',
        title = 'Store Robbery',
        options = {}
    }
    local options = {}
    for id, data in pairs(Config.StoreData) do
        local street = GetStreetNameAtCoord(data.target.coords.x, data.target.coords.y, data.target.coords.z)
        local streetName = GetStreetNameFromHashKey(street)
        options[#options+1] = {
            title = 'Store Location : '..streetName.. ' Id : '..id,
            icon ='fas fa-store',
            description = 'Click to go to store',
            event = 'kevin-storerobbery:teleporttostore',
            args = {
                coords = data.target.coords,
                heading = data.target.heading
            }
        }
    end

    resgisteredMenu["options"] = options
    lib.registerContext(resgisteredMenu)
    lib.showContext('stores')
end)

RegisterNetEvent('kevin-storerobbery:teleporttostore', function (data)
    if not data then return end
    local player = PlayerPedId()
    DoScreenFadeOut(800)
    Wait(800)
    SetEntityCoords(player, data.coords.x, data.coords.y, data.coords.z)
    SetEntityHeading(player, data.heading)
    Wait(800)
    DoScreenFadeIn(800)
end)

local regAnimDict = 'oddjobs@shop_robbery@rob_till'
local regAnim = 'loop'
local safeAnimDict = 'oddjobs@shop_robbery@rob_till' -- need to find a good animation for the safe looting
local safeAnim = 'loop'

function GrabLoot(id, data)
    local animDict = nil
    local animName = nil
    local player = PlayerPedId()
    if data.type == 'register' then animDict = regAnimDict animName = regAnim else animDict = safeAnimDict animName = safeAnim end
    TaskTurnPedToFaceCoord(player, data.target.coords.x, data.target.coords.y, data.target.coords.z, -1)
    TriggerServerEvent('kevin-storerobbery:setstate', id, data.canloot, 'canloot')
    QBCore.Functions.Progressbar('store_looting', 'Looting', 10000, false, true, {
        disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true,
    }, {
        animDict = animDict,
        anim = animName,
        flags = 1,
    }, {}, {}, function() -- Done
        ClearPedTasks(player)
        local street = GetStreetNameAtCoord(data.target.coords.x, data.target.coords.y, data.target.coords.z)
        local streetName = GetStreetNameFromHashKey(street)
        TriggerServerEvent('kevin-storerobbery:giverewards', id, data, streetName)
    end, function() -- Cancel
        ClearPedTasks(player)
        TriggerServerEvent('kevin-storerobbery:setstate', id, data.canloot, 'canloot')
        QBCore.Functions.Notify('Cancelled', 'error')
    end)
end

function AttemptStore(id, data)
    local player = PlayerPedId()
    local playerCoords = GetEntityCoords(player)
    local item = QBCore.Functions.HasItem(data.target.neededitem)
    local miniGameData = nil
    if item then
        if CurrentCops >= Config.Police.copsneeded then
            if not data.opended then
                local wearingGloves = IsWearingGloves()
                if not wearingGloves then
                    TriggerServerEvent('evidence:server:CreateFingerDrop', playerCoords)
                end
                Alert(id)
                DoAnimation()
                TaskTurnPedToFaceCoord(player, data.target.coords.x, data.target.coords.y, data.target.coords.z, -1)
                TriggerServerEvent('kevin-storerobbery:setstate', id, data.busy, 'blocktarget')
                if data.type == 'safe' then
                    miniGameData = Config.SafeData.minigame
                    Minigame(miniGameData, id, data)
                else
                    miniGameData = Config.RegisterData.minigame
                    Minigame(miniGameData, id, data)
                end
            else
                QBCore.Functions.Notify('Already opended..', 'error', 8000)
            end
        else
            QBCore.Functions.Notify('Try again later..', 'error', 8000)
        end
    else
        QBCore.Functions.Notify('You don\'t have the tools for the job..', 'error', 8000)
    end
end

function Alert(camId)
    if Config.Police.dispatch == 'ps' then
        exports['ps-dispatch']:StoreRobbery(camId)
    elseif Config.Police.dispatch == 'cd' then
        local data = exports['cd_dispatch']:GetPlayerInfo()
        TriggerServerEvent('cd_dispatch:AddNotification', {
            job_table = {'police'},
            coords = data.coords,
            title = '10-31 - Store Robbery', --- change to whatever 10 code your server uses here
            message = 'Store Robbery at'..data.street,
            flash = 0,
            unique_id = tostring(math.random(0000000,9999999)),
            blip = {
                sprite = 59,
                scale = 1.5,
                colour = 2,
                flashes = true,
                text = '911 - Store Robbery',
                time = (5*60*1000),
                sound = 1,
            }
        })
    end
end

function FailMiniGame(id, data)
    local player = PlayerPedId()
    ClearPedTasks(player)
    doingAnim = false
    TriggerServerEvent('kevin-storerobbery:setstate', id, data.busy, 'blocktarget')
    local chance = math.random(1, 100)
    if chance < Config.FailedAlertChance then
        Alert(id)
    end
end

function PassMiniGame(id, data)
    local player = PlayerPedId()
    ClearPedTasks(player)
    doingAnim = false
    StartTimer(id, data)
end

function Minigame(miniGameData, id, data)
    if miniGameData == 'ps-circle' then
        exports['ps-ui']:Circle(function(success)
            if success then
                PassMiniGame(id, data)
            else
                FailMiniGame(id, data)
            end
        end, Config.MiniGameData.circle.circles, Config.MiniGameData.circle.seconds) -- NumberOfCircles, MS
    elseif miniGameData == 'ps-maze' then
        exports['ps-ui']:Maze(function(success)
            if success then
                PassMiniGame(id, data)
            else
                FailMiniGame(id, data)
            end
        end, Config.MiniGameData.maze.seconds) -- Hack Time Limit
    elseif miniGameData == 'ps-var' then
        exports['ps-ui']:VarHack(function(success)
            if success then
                PassMiniGame(id, data)
            else
                FailMiniGame(id, data)
            end
        end, Config.MiniGameData.var.blocks, Config.MiniGameData.var.seconds) -- Number of Blocks, Time (seconds)
    elseif miniGameData == 'ps-thermite' then
        exports['ps-ui']:Thermite(function(success)
            if success then
                PassMiniGame(id, data)
            else
                FailMiniGame(id, data)
            end
        end, Config.MiniGameData.thermite.seconds, Config.MiniGameData.thermite.gridsize, Config.MiniGameData.thermite.incorrectblocks) -- Time, Gridsize (5, 6, 7, 8, 9, 10), IncorrectBlocks
    elseif miniGameData == 'ps-scrambler' then
        exports['ps-ui']:Scrambler(function(success)
            if success then
                PassMiniGame(id, data)
            else
                FailMiniGame(id, data)
            end
        end, Config.MiniGameData.scrambler.type, Config.MiniGameData.scrambler.seconds, Config.MiniGameData.scrambler.mirrored) -- Type (alphabet, numeric, alphanumeric, greek, braille, runes), Time (Seconds), Mirrored (0: Normal, 1: Normal + Mirrored 2: Mirrored only )
    elseif miniGameData == 'memorygame' then
        exports['memorygame']:thermiteminigame(Config.MiniGameData.memorygame.correctblocks, Config.MiniGameData.memorygame.incorrectblocks, Config.MiniGameData.memorygame.timetoshow, Config.MiniGameData.memorygame.timetolose,
        function() -- success
            PassMiniGame(id, data)
        end,
        function() -- failure
            FailMiniGame(id, data)
        end)
    end
end

function StartTimer(id, data)
    local street = GetStreetNameAtCoord(data.target.coords.x, data.target.coords.y, data.target.coords.z)
    local streetName = GetStreetNameFromHashKey(street)
    local waitTime = math.random(data.timer.min, data.timer.max)
    CreateThread(function ()
        QBCore.Functions.Notify('Wait '..waitTime..' minutes till it opens....', 'primary', 8000)
        TriggerServerEvent('kevin-storerobbery:sendlog', id, data, streetName, waitTime)
        Wait(waitTime * 60000)
        -- Wait(2000)
        QBCore.Functions.Notify('Grab the loot....', 'success', 8000)
        TriggerServerEvent('kevin-storerobbery:setstate', id, data.opended, 'openregister')
        TriggerServerEvent('kevin-storerobbery:setstate', id, data.canloot, 'canloot')
    end)
end

function DoAnimation()
    doingAnim = true
    local player = PlayerPedId()
    local animDict = 'veh@break_in@0h@p_m_one@'
    local animName = 'low_force_entry_ds'
    loadAnimDict(animDict)
    TaskPlayAnim(player, animDict, animName, 8.0, 8.0, -1, 49, 0.0, false, false, false)
    CreateThread(function ()
        while doingAnim do
            if not IsEntityPlayingAnim(player, animDict, animName, 3) then
                TaskPlayAnim(player, animDict, animName, 8.0, 8.0, -1, 49, 0.0, false, false, false)
            end
            Wait(1000)
        end
    end)
end
RegisterNetEvent('kevin-storerobbery:updatestate', function(id, state, type)
    if type == 'openregister' then
        Config.StoreData[id].opended = state
    elseif type == 'blocktarget' then
        Config.StoreData[id].busy = state
    else
        Config.StoreData[id].canloot = state
    end
end)

function IsWearingGloves()
    local armIndex = GetPedDrawableVariation(PlayerPedId(), 3)
    local model = GetEntityModel(PlayerPedId())

    if model == `mp_m_freemode_01` then
        return not (Config.MaleNoGloves[armIndex] == true)
    else
        return not (Config.FemaleNoGloves[armIndex] == true)
    end
end

function loadAnimDict(dict)
    RequestAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do Wait(5) end
end

