local clothing = {
    state = nil,
    data = {}
}

-- Note: No idea how to fix it (now)
-- Some-how throwing issues when not defined when player unloaded / loaded

DeletePeds = function() end
SpawnPeds = function() end

CreateThread(function()
    if Prison.Framework == nil or Prison.Framework == 2 or Prison.Framework == 0 then
        if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
            Prison.Framework = 2
        end
    end

    Wait(0)

    if Prison.Framework == 2 then
        if Prison.FrameworkTriggers['resourceNameClothing'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['resourceNameClothing'])) == 'qbcore' then
            Prison.FrameworkTriggers['resourceNameClothing'] = 'qb-clothing'
        end

        if Prison.FrameworkTriggers['playerUnloadedClient'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['playerUnloadedClient'])) == 'qbcore' then
            Prison.FrameworkTriggers['playerUnloadedClient'] = 'QBCore:Client:OnPlayerUnload'
        end

        if Prison.FrameworkTriggers['playerLoadedClient'] == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['playerLoadedClient'])) == 'qbcore' then
            Prison.FrameworkTriggers['playerLoadedClient'] = 'QBCore:Client:OnPlayerLoaded'
        end

        if Prison.FrameworkTriggers.resourceName == '' or string.strtrim(string.lower(Prison.FrameworkTriggers['resourceNameClothing'])) == 'qbcore' then
            Prison.FrameworkTriggers.resourceName = 'qb-core'
        end

        AddEventHandler(Prison.FrameworkTriggers.playerUnloadedClient, function()
            if clothing and clothing.state then
                -- clothing = nil
            end
        end)

        AddEventHandler(Prison.FrameworkTriggers.playerLoadedClient, function()
            local ped = PlayerPedId()
            local time = GetGameTimer()

            while (not HasCollisionLoadedAroundEntity(ped) and (GetGameTimer() - time) < 5000) do
                Wait(0)
            end

            SetTimeout(1000, function()
                TriggerServerEvent('rcore_prison:requestInternalLoad')
            end)

            if clothing and clothing.state == 'relog' then
                SetTimeout(2000, function()
                    Bridge.SetOutfit(clothing.state, clothing.data)
                end)
            end
        end)

        local name = 'unk'

        if IsScriptLoaded('qb-clothing') then
            name = 'qb-clothing'
        elseif IsScriptLoaded('illenium-appearance') then
            name = 'illenium-appearance'
        elseif IsScriptLoaded(Prison.FrameworkTriggers.resourceNameClothing) then
            name = Prison.FrameworkTriggers.resourceNameClothing
        end

        IsResourceLoaded(name, function(state, func)
            if not state and IsScriptLoaded('qb-clothing') then
                Prison.FrameworkTriggers.resourceNameClothing = 'qb-clothing'
                state = true
            end

            if state then
                -- Bridge.SetEntryOutfit = function()
                -- end

                local clothingEvents = Prison.ScriptEvents[Prison.FrameworkTriggers.resourceNameClothing] or nil

                if not clothingEvents and Prison.FrameworkTriggers.resourceNameClothing and IsScriptLoaded(Prison.FrameworkTriggers.resourceNameClothing) then
                    return
                end

                Bridge.SetOutfit = function(actionType, data)
                    local plyPed = PlayerPedId()

                    clothing.state = actionType
                    clothing.data = data

                    if data and actionType == 'release' then
                        TriggerEvent(clothingEvents.loadPlayerClothing, data, plyPed)
                    elseif actionType == 'selectOutfit' and data.components then
                        local outfit = {
                            outfitData = data.components
                        }

                        TriggerEvent(clothingEvents.loadOutfit, outfit)
                    elseif actionType == 'relog' and data.components then
                        local outfit = {
                            outfitData = data.components
                        }

                        TriggerEvent(clothingEvents.loadOutfit, outfit)
                    end
                end
            end
        end)

        IsResourceLoaded(Prison.FrameworkTriggers.resourceName or 'qb-core', function(state, func)
            if state then
                QBCore = func:GetCoreObject()

                if not Prison.Notify.DefaultNotify then
                    Bridge.Notify = function(data)
                        QBCore.Functions.Notify(data.description, data.type, 3000)
                    end
                end
            end
        end)
    end
end)