local progress = false

local playGatheringScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("gathering_weed"))

    local animDict = "anim@amb@business@weed@weed_inspecting_lo_med_hi@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_weed_spray_01a")

    local spray = CreateObject("bkr_prop_weed_spray_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = spray
    SetEntityRotation(spray, data.rotation)

    local scenePos = GetOffsetFromEntityInWorldCoords(spray, data.offset)
    local sceneRot = GetEntityRotation(spray)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "weed_spraybottle_stand_kneeling_01_inspector", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(spray, scene01, animDict, "weed_spraybottle_stand_kneeling_01_spraybottle", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)

    local wait = (GetAnimDuration(animDict, "weed_spraybottle_stand_kneeling_01_inspector")*1000)
    progressBar(getPhrase("gathering_weed_text"), wait)

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

local playPackingScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("packing_weed"))

    local animDict = "anim@amb@business@weed@weed_sorting_seated@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_weed_dry_01a")
    requestObjModel("bkr_prop_weed_leaf_01a")
    requestObjModel("bkr_prop_weed_bag_01a")
    requestObjModel("bkr_prop_weed_bud_02b")
    requestObjModel("bkr_prop_weed_bud_02a")
    requestObjModel("bkr_prop_weed_bag_pile_01a")
    requestObjModel("bkr_prop_weed_bucket_open_01a")

    local dryWeed01 = CreateObject("bkr_prop_weed_dry_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = dryWeed01
    SetEntityRotation(dryWeed01, data.rotation)

    local dryWeed02 = CreateObject("bkr_prop_weed_dry_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = dryWeed02

    local leaf01 = CreateObject("bkr_prop_weed_leaf_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = leaf01

    local leaf02 = CreateObject("bkr_prop_weed_leaf_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = leaf02

    local weedBag = CreateObject("bkr_prop_weed_bag_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = weedBag

    local bud01 = CreateObject("bkr_prop_weed_bud_02b", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bud01

    local bud02 = CreateObject("bkr_prop_weed_bud_02b", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bud02

    local bud03 = CreateObject("bkr_prop_weed_bud_02b", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bud03

    local bud04 = CreateObject("bkr_prop_weed_bud_02b", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bud04

    local bud05 = CreateObject("bkr_prop_weed_bud_02b", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bud05

    local bud06 = CreateObject("bkr_prop_weed_bud_02b", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bud06

    local aBud01 = CreateObject("bkr_prop_weed_bud_02a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = aBud01

    local aBud02 = CreateObject("bkr_prop_weed_bud_02a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = aBud02

    local aBud03 = CreateObject("bkr_prop_weed_bud_02a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = aBud03

    local bagPile = CreateObject("bkr_prop_weed_bag_pile_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bagPile

    local bucket01 = CreateObject("bkr_prop_weed_bucket_open_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bucket01


    local scenePos = GetOffsetFromEntityInWorldCoords(dryWeed01, data.offset)
    local sceneRot = GetEntityRotation(dryWeed01)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene02 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene03 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene04 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene05 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene06 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "sorter_right_sort_v3_sorter02", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(dryWeed01, scene01, animDict, "sorter_right_sort_v3_weeddry01a", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(dryWeed02, scene01, animDict, "sorter_right_sort_v3_weeddry01a^1", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(leaf01, scene01, animDict, "sorter_right_sort_v3_weedleaf01a", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene02, animDict, "sorter_right_sort_v3_sorter02", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(leaf02, scene02, animDict, "sorter_right_sort_v3_weedleaf01a^1", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(weedBag, scene02, animDict, "sorter_right_sort_v3_weedbag01a", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(bud01, scene02, animDict, "sorter_right_sort_v3_weedbud02b", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene03, animDict, "sorter_right_sort_v3_sorter02", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(bud02, scene03, animDict, "sorter_right_sort_v3_weedbud02b^1", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(bud03, scene03, animDict, "sorter_right_sort_v3_weedbud02b^2", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(bud04, scene03, animDict, "sorter_right_sort_v3_weedbud02b^3", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene04, animDict, "sorter_right_sort_v3_sorter02", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(bud05, scene04, animDict, "sorter_right_sort_v3_weedbud02b^4", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(bud06, scene04, animDict, "sorter_right_sort_v3_weedbud02b^5", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(aBud01, scene04, animDict, "sorter_right_sort_v3_weedbud02a", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene05, animDict, "sorter_right_sort_v3_sorter02", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(aBud02, scene05, animDict, "sorter_right_sort_v3_weedbud02a^1", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(aBud03, scene05, animDict, "sorter_right_sort_v3_weedbud02a^2", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(bagPile, scene05, animDict, "sorter_right_sort_v3_weedbagpile01a", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene06, animDict, "sorter_right_sort_v3_sorter02", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(bucket01, scene06, animDict, "sorter_right_sort_v3_bucket01a^1", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)
    NetworkStartSynchronisedScene(scene02)
    NetworkStartSynchronisedScene(scene03)
    NetworkStartSynchronisedScene(scene04)
    NetworkStartSynchronisedScene(scene05)
    NetworkStartSynchronisedScene(scene06)

    local wait = (GetAnimDuration(animDict, "sorter_right_sort_v3_sorter02")*1000)
    progressBar(getPhrase("packing_weed_text"), wait)

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

Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local pCoords = GetEntityCoords(playerPed)
        for k,v in pairs(Config.Weed.labs) do
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
                    showHelpNotification(getPhrase("enter_weed_lab"))
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
                    showHelpNotification(getPhrase("exit_weed_lab"))
                    if IsControlJustPressed(0, 38) and not progress then
                        progress = true
                        teleportPlayer(v.enterance.enterCoords)
                        progress = false
                    end
                end

                for _, data in pairs(v.gatheringScene.coords) do
                    local gatherDst = #(pCoords - data.coords)

                    if gatherDst <= 10 then
                        sleep = 1
                        DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                    end
                    
                    if gatherDst <= 1 then
                        showHelpNotification(getPhrase("start_gather_weed"))
                        if IsControlJustPressed(0, 38) and not progress then
    
                            if next(v.gatheringScene.requiredItems) then
                                TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                    if not result.status then
                                        return
                                    end
                                    progress = true
                                    playGatheringScene(data, v.gatheringScene)
                                end, {items = v.gatheringScene.requiredItems, remove = v.gatheringScene.removeItem})
                            else
                                progress = true
                                playGatheringScene(data, v.gatheringScene)
                            end
                        end
                    end
                end

                for _, data in pairs(v.packingScene.coords) do
                    local packingDst = #(pCoords - data.coords)

                    if packingDst <= 10 then
                        sleep = 1
                        DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                    end
                    
                    if packingDst <= 1 then
                        showHelpNotification(getPhrase("start_packing_weed"))
                        if IsControlJustPressed(0, 38) and not progress then
    
                            if next(v.packingScene.requiredItems) then
                                TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                    if not result.status then
                                        return
                                    end
                                    progress = true
                                    playPackingScene(data, v.packingScene)
                                end, {items = v.packingScene.requiredItems, remove = v.packingScene.removeItem})
                            else
                                progress = true
                                playPackingScene(data, v.packingScene)
                            end
                        end
                    end
                end
                
            end
        end
        Citizen.Wait(sleep)
    end
end)
