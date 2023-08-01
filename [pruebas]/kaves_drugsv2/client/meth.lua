local progress = false

local playCookScene = function(data)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("cooking_meth"))

    local animDict = "anim@amb@business@meth@meth_monitoring_cooking@cooking@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_meth_ammonia")
    requestObjModel("bkr_prop_meth_sacid")
    requestObjModel("bkr_prop_fakeid_penclipboard")
    requestObjModel("bkr_prop_fakeid_clipboard_01a")

    local ammonia = CreateObject("bkr_prop_meth_ammonia", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = ammonia
    SetEntityRotation(ammonia, data.rotation)

    local sacid = CreateObject("bkr_prop_meth_sacid", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = sacid

    local pencil = CreateObject("bkr_prop_fakeid_penclipboard", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = pencil
    
    local clipboard = CreateObject("bkr_prop_fakeid_clipboard_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = clipboard

    local scenePos = GetOffsetFromEntityInWorldCoords(ammonia, data.offset)
    local sceneRot = GetEntityRotation(ammonia)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene02 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "chemical_pour_short_cooker", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(ammonia, scene01, animDict, "chemical_pour_short_ammonia", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(sacid, scene01, animDict, "chemical_pour_short_sacid", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(pencil, scene01, animDict, "chemical_pour_short_pencil", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene02, animDict, "chemical_pour_short_cooker", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(clipboard, scene02, animDict, "chemical_pour_short_clipboard", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)
    NetworkStartSynchronisedScene(scene02)

    local wait = (GetAnimDuration(animDict, "chemical_pour_short_cooker")*1000)
    progressBar(getPhrase("cooking_meth_text"), wait)

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

local playHammerScene = function(data)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("breaking_meth"))

    local animDict = "anim@amb@business@meth@meth_smash_weight_check@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_meth_tray_02a")
    requestObjModel("w_me_hammer")
    requestObjModel("bkr_prop_meth_tray_01a")
    requestObjModel("bkr_prop_meth_smashedtray_01_frag_")
    requestObjModel("bkr_prop_meth_bigbag_02a")

    local tray2a = CreateObject("bkr_prop_meth_tray_02a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = tray2a
    SetEntityRotation(tray2a, data.rotation)

    local hammer = CreateObject("w_me_hammer", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = hammer

    local tray1a = CreateObject("bkr_prop_meth_tray_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = tray1a
    
    local smashedTray = CreateObject("bkr_prop_meth_smashedtray_01_frag_", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = smashedTray

    local bigbag = CreateObject("bkr_prop_meth_bigbag_02a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bigbag

    local scenePos = GetOffsetFromEntityInWorldCoords(tray2a, data.offset)
    local sceneRot = GetEntityRotation(tray2a)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene02 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "break_weigh_char02", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(tray2a, scene01, animDict, "break_weigh_tray01^2", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(hammer, scene01, animDict, "break_weigh_hammer", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(tray1a, scene01, animDict, "break_weigh_tray01^1", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene02, animDict, "break_weigh_char02", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(smashedTray, scene02, animDict, "break_weigh_tray01", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(bigbag, scene02, animDict, "break_weigh_box01^1", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)
    NetworkStartSynchronisedScene(scene02)

    local wait = (GetAnimDuration(animDict, "break_weigh_char02")*1000)
    progressBar(getPhrase("breaking_meth_text"), wait)

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

local playPackingScene = function(data)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("packing_meth"))

    local animDict = "anim@amb@business@meth@meth_smash_weight_check@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_meth_bigbag_04a")
    requestObjModel("bkr_prop_meth_bigbag_03a")
    requestObjModel("bkr_prop_fakeid_clipboard_01a")
    requestObjModel("bkr_prop_meth_openbag_02")
    requestObjModel("bkr_prop_fakeid_penclipboard")
    requestObjModel("bkr_prop_coke_scale_01")
    requestObjModel("bkr_prop_meth_scoop_01a")

    local box1 = CreateObject("bkr_prop_meth_bigbag_04a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = box1
    SetEntityRotation(box1, data.rotation)

    local box2 = CreateObject("bkr_prop_meth_bigbag_03a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = box2

    local clipboard = CreateObject("bkr_prop_fakeid_clipboard_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = clipboard

    local methBag1 = CreateObject("bkr_prop_meth_openbag_02", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = methBag1

    local methBag2 = CreateObject("bkr_prop_meth_openbag_02", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = methBag2

    local methBag3 = CreateObject("bkr_prop_meth_openbag_02", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = methBag3

    local methBag4 = CreateObject("bkr_prop_meth_openbag_02", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = methBag4

    local methBag5 = CreateObject("bkr_prop_meth_openbag_02", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = methBag5

    local methBag6 = CreateObject("bkr_prop_meth_openbag_02", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = methBag6

    local methBag7 = CreateObject("bkr_prop_meth_openbag_02", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = methBag7

    local pencil = CreateObject("bkr_prop_fakeid_penclipboard", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = pencil

    local scale = CreateObject("bkr_prop_coke_scale_01", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = scale

    local scoop = CreateObject("bkr_prop_meth_scoop_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = scoop

    local scenePos = GetOffsetFromEntityInWorldCoords(box1, data.offset)
    local sceneRot = GetEntityRotation(box1)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene02 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene03 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene04 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene05 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "break_weigh_v3_char01", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(box1, scene01, animDict, "break_weigh_v3_box01", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(box2, scene01, animDict, "break_weigh_v3_box01^1", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(clipboard, scene01, animDict, "break_weigh_v3_clipboard", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene02, animDict, "break_weigh_v3_char01", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(methBag1, scene02, animDict, "break_weigh_v3_methbag01", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(methBag2, scene02, animDict, "break_weigh_v3_methbag01^1", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(methBag3, scene02, animDict, "break_weigh_v3_methbag01^2", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene03, animDict, "break_weigh_v3_char01", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(methBag4, scene03, animDict, "break_weigh_v3_methbag01^3", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(methBag5, scene03, animDict, "break_weigh_v3_methbag01^4", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(methBag6, scene03, animDict, "break_weigh_v3_methbag01^5", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene04, animDict, "break_weigh_v3_char01", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(methBag7, scene04, animDict, "break_weigh_v3_methbag01^6", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(pencil, scene04, animDict, "break_weigh_v3_pen", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(scale, scene04, animDict, "break_weigh_v3_scale", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene05, animDict, "break_weigh_v3_char01", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(scale, scene05, animDict, "break_weigh_v3_scale", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(scoop, scene05, animDict, "break_weigh_v3_scoop", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)
    NetworkStartSynchronisedScene(scene02)
    NetworkStartSynchronisedScene(scene03)
    NetworkStartSynchronisedScene(scene04)
    NetworkStartSynchronisedScene(scene05)

    local wait = (GetAnimDuration(animDict, "break_weigh_v3_char01")*1000)
    progressBar(getPhrase("packing_meth_text"), wait)

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
        for k,v in pairs(Config.Meth.labs) do
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
                    showHelpNotification(getPhrase("enter_meth_lab"))
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
                    showHelpNotification(getPhrase("exit_meth_lab"))
                    if IsControlJustPressed(0, 38) and not progress then
                        progress = true
                        teleportPlayer(v.enterance.enterCoords)
                        progress = false
                    end
                end

                local cookDst = #(pCoords - v.cookScene.coords)

                if cookDst <= 10 then
                    sleep = 1
                    DrawMarker(2, v.cookScene.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if cookDst <= 2 then
                    showHelpNotification(getPhrase("start_meth_cooking"))
                    if IsControlJustPressed(0, 38) and not progress then

                        if next(v.cookScene.requiredItems) then
                            TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                if not result.status then
                                    return
                                end
                                progress = true
                                playCookScene(v.cookScene)
                            end, {items = v.cookScene.requiredItems, remove = v.cookScene.removeItem})
                        else
                            progress = true
                            playCookScene(v.cookScene)
                        end
                    end
                end

                local hammerDst = #(pCoords - v.hammerScene.coords)

                if hammerDst <= 10 then
                    sleep = 1
                    DrawMarker(2, v.hammerScene.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if hammerDst <= 2 then
                    showHelpNotification(getPhrase("start_breaking_meth"))
                    if IsControlJustPressed(0, 38) and not progress then

                        if next(v.hammerScene.requiredItems) then
                            TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                if not result.status then
                                    return
                                end
                                progress = true
                                playHammerScene(v.hammerScene)
                            end, {items = v.hammerScene.requiredItems, remove = v.hammerScene.removeItem})
                        else
                            progress = true
                            playHammerScene(v.hammerScene)
                        end
                    end
                end

                local packingDst = #(pCoords - v.packingScene.coords)

                if packingDst <= 10 then
                    sleep = 1
                    DrawMarker(2, v.packingScene.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if packingDst <= 2 then
                    showHelpNotification(getPhrase("start_packing_meth"))
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