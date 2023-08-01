QBCore = exports['qb-core']:GetCoreObject()
local progress = false

local playUnpackScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("unpacking_coke"))

    local animDict = "anim@amb@business@coc@coc_unpack_cut@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_coke_fullmetalbowl_02")
    requestObjModel("bkr_prop_coke_box_01a")

    local bowl = CreateObject("bkr_prop_coke_fullmetalbowl_02", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bowl
    SetEntityRotation(bowl, data.rotation)

    local box = CreateObject("bkr_prop_coke_box_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = box

    local scenePos = GetOffsetFromEntityInWorldCoords(bowl, data.offset)
    local sceneRot = GetEntityRotation(bowl)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "fullcut_cycle_v2_cokepacker", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(bowl, scene01, animDict, "fullcut_cycle_v2_cokebowl", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(box, scene01, animDict, "fullcut_cycle_v2_cokebox", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)

    local wait = (GetAnimDuration(animDict, "fullcut_cycle_v2_cokepacker")*1000)
    progressBar(getPhrase("unpacking_coke_text"), wait)

    Citizen.SetTimeout(wait, function()
        ClearPedTasks(playerPed)
        for k,v in pairs(sceneObjects) do
            if DoesEntityExist(v) then
                SetEntityAsMissionEntity(v, true, true)
                DeleteEntity(v)
            end
        end
        TriggerServerEvent("kaves_drugsv2:server:giveItem", mainData.itemName, mainData.itemCount)
        progress = false
    end)

end

local playCutterScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("cutting_coke"))

    local animDict = "anim@amb@business@coc@coc_unpack_cut_left@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_coke_bakingsoda_o")
    requestObjModel("prop_cs_credit_card")

    local bakingSoda = CreateObject("bkr_prop_coke_bakingsoda_o", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bakingSoda
    SetEntityRotation(bakingSoda, data.rotation)

    local card01 = CreateObject("prop_cs_credit_card", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = card01

    local card02 = CreateObject("prop_cs_credit_card", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = card02

    local scenePos = GetOffsetFromEntityInWorldCoords(bakingSoda, data.offset)
    local sceneRot = GetEntityRotation(bakingSoda)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "coke_cut_v5_coccutter", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(bakingSoda, scene01, animDict, "coke_cut_v5_bakingsoda", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(card01, scene01, animDict, "coke_cut_v5_creditcard", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(card02, scene01, animDict, "coke_cut_v5_creditcard^1", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)

    local wait = (GetAnimDuration(animDict, "coke_cut_v5_coccutter")*1000)
    progressBar(getPhrase("cutting_coke_text"), wait)

    Citizen.SetTimeout(wait, function()
        ClearPedTasks(playerPed)
        for k,v in pairs(sceneObjects) do
            if DoesEntityExist(v) then
                SetEntityAsMissionEntity(v, true, true)
                DeleteEntity(v)
            end
        end
        TriggerServerEvent("kaves_drugsv2:server:giveItem", mainData.itemName, mainData.itemCount)
        progress = false
    end)

end

local playPackingScene = function(data)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("packing_coke"))

    local animDict = "anim@amb@business@coc@coc_packing_hi@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_coke_fullscoop_01a")
    requestObjModel("bkr_prop_coke_doll")
    requestObjModel("bkr_prop_coke_boxedDoll")
    requestObjModel("bkr_prop_coke_dollCast")
    requestObjModel("bkr_prop_coke_dollmould")
    requestObjModel("bkr_prop_coke_fullmetalbowl_02")
    requestObjModel("bkr_prop_coke_press_01b")
    requestObjModel("bkr_prop_coke_dollboxfolded")

    local scoop = CreateObject("bkr_prop_coke_fullscoop_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = scoop
    SetEntityRotation(scoop, data.rotation)

    local doll = CreateObject("bkr_prop_coke_doll", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = doll

    local boxedDoll = CreateObject("bkr_prop_coke_boxedDoll", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = boxedDoll

    local dollCast01 = CreateObject("bkr_prop_coke_dollCast", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = dollCast01

    local dollCast02 = CreateObject("bkr_prop_coke_dollCast", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = dollCast02

    local dollCast03 = CreateObject("bkr_prop_coke_dollCast", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = dollCast03

    local dollCast04 = CreateObject("bkr_prop_coke_dollCast", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = dollCast04

    local dollMould = CreateObject("bkr_prop_coke_dollmould", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = dollMould

    local bowl = CreateObject("bkr_prop_coke_fullmetalbowl_02", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bowl

    local cokePress = CreateObject("bkr_prop_coke_press_01b", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = cokePress

    local foldedBox = CreateObject("bkr_prop_coke_dollboxfolded", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = foldedBox

    local scenePos = GetOffsetFromEntityInWorldCoords(scoop, data.offset)
    local sceneRot = GetEntityRotation(scoop)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene02 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene03 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene04 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "full_cycle_v3_pressoperator", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(scoop, scene01, animDict, "full_cycle_v3_scoop", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(doll, scene01, animDict, "full_cycle_v3_cocdoll", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(boxedDoll, scene01, animDict, "full_cycle_v3_boxedDoll", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene02, animDict, "full_cycle_v3_pressoperator", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(dollCast01, scene02, animDict, "full_cycle_v3_dollcast", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(dollCast02, scene02, animDict, "full_cycle_v3_dollcast^1", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(dollCast03, scene02, animDict, "full_cycle_v3_dollcast^2", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene03, animDict, "full_cycle_v3_pressoperator", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(dollCast04, scene03, animDict, "full_cycle_v3_dollcast^3", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(dollMould, scene03, animDict, "full_cycle_v3_dollmould", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(bowl, scene03, animDict, "full_cycle_v3_cocbowl", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene04, animDict, "full_cycle_v3_pressoperator", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(cokePress, scene04, animDict, "full_cycle_v3_cokePress", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(foldedBox, scene04, animDict, "full_cycle_v3_FoldedBox", 1.0, -1.0, 1148846080)


    NetworkStartSynchronisedScene(scene01)
    NetworkStartSynchronisedScene(scene02)
    NetworkStartSynchronisedScene(scene03)
    NetworkStartSynchronisedScene(scene04)

    local wait = (GetAnimDuration(animDict, "full_cycle_v3_pressoperator")*1000)
    progressBar(getPhrase("packing_coke_text"), wait)

    Citizen.SetTimeout(wait, function()
        ClearPedTasks(playerPed)
        for k,v in pairs(sceneObjects) do
            if DoesEntityExist(v) then
                SetEntityAsMissionEntity(v, true, true)
                DeleteEntity(v)
            end
        end
        TriggerServerEvent("kaves_drugsv2:server:giveItem", data.itemName, data.itemCount)
        progress = false
    end)

end

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local pCoords = GetEntityCoords(playerPed)
        for k,v in pairs(Config.Coke.labs) do
            local enterDst = #(pCoords - vector3(v.enterance.enterCoords.x, v.enterance.enterCoords.y, v.enterance.enterCoords.z))
            local exitDst = #(pCoords - vector3(v.enterance.exitCoords.x, v.enterance.exitCoords.y, v.enterance.exitCoords.z))

            if not progress then
                if enterDst <= 20 then
                    sleep = 0
                    if v.enterance.showMarker then
                        DrawMarker(2, v.enterance.enterCoords.x, v.enterance.enterCoords.y, v.enterance.enterCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                    end
                end

                if exitDst <= 5 then
                    sleep = 0
                    if v.enterance.showMarker then
                        DrawMarker(2, v.enterance.exitCoords.x, v.enterance.exitCoords.y, v.enterance.exitCoords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                    end
                end

                if enterDst <= 2 then
                    showHelpNotification(getPhrase("enter_coke_lab"))
                    if IsControlJustPressed(0, 38) and not progress then
                        if next(v.enterance.requiredItems) then
                            TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                if not result.status then
                                    return
                                end
                                progress = true
                                teleportPlayer(v.enterance.exitCoords)
                                progress = false
                            end, {items = v.enterance.requiredItems, remove = v.enterance.removeItem, bucketId = v.enterance.bucketId})
                        else
                            progress = true
                            teleportPlayer(v.enterance.exitCoords)
                            progress = false
                        end
                    end
                end

                if exitDst <= 2 then
                    showHelpNotification(getPhrase("exit_coke_lab"))
                    if IsControlJustPressed(0, 38) and not progress then
                        progress = true
                        teleportPlayer(v.enterance.enterCoords)
                        progress = false
                    end
                end

                for _, data in pairs(v.unpackScene.coords) do
                    local unpackDst = #(pCoords - data.coords)

                    if unpackDst <= 10 then
                        sleep = 1
                        DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                    end
                    
                    if unpackDst <= 1 then
                        showHelpNotification(getPhrase("start_unpacking_coke"))
                        if IsControlJustPressed(0, 38) and not progress then
    
                            if next(v.unpackScene.requiredItems) then
                                TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                    if not result.status then
                                        return
                                    end
                                    progress = true
                                    playUnpackScene(data, v.unpackScene)
                                end, {items = v.unpackScene.requiredItems, remove = v.unpackScene.removeItem})
                            else
                                progress = true
                                playUnpackScene(data, v.unpackScene)
                            end
                        end
                    end
                end

                for _, data in pairs(v.cutterScene.coords) do
                    local cutterDst = #(pCoords - data.coords)

                    if cutterDst <= 10 then
                        sleep = 1
                        DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                    end
                    
                    if cutterDst <= 1 then
                        showHelpNotification(getPhrase("start_cutting_coke"))
                        if IsControlJustPressed(0, 38) and not progress then
    
                            if next(v.cutterScene.requiredItems) then
                                TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                    if not result.status then
                                        return
                                    end
                                    progress = true
                                    playCutterScene(data, v.cutterScene)
                                end, {items = v.cutterScene.requiredItems, remove = v.cutterScene.removeItem})
                            else
                                progress = true
                                playCutterScene(data, v.cutterScene)
                            end
                        end
                    end
                end

                local packingDst = #(pCoords - v.packingScene.coords)

                if packingDst <= 10 then
                    sleep = 1
                    DrawMarker(2, v.packingScene.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if packingDst <= 2 then
                    showHelpNotification(getPhrase("start_packing_coke"))
                    if IsControlJustPressed(0, 38) and not progress then
                        if next(v.packingScene.requiredItems) then
                            TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                if not result.status then
                                    return
                                end
                                progress = true
                                playPackingScene(v.packingScene)
                            end, {items = v.packingScene.requiredItems, remove = v.packingScene.removeItem})
                        else
                            progress = true
                            playPackingScene(v.packingScene)
                        end
                    end
                end
                
            end
        end
        Citizen.Wait(sleep)
    end
end)