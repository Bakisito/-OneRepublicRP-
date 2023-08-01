local progress = false

local playPlacePaperScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("place_money"))

    local animDict = "anim@amb@business@cfm@cfm_machine_oversee@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_scrunched_moneypage")

    local money01 = CreateObject("bkr_prop_scrunched_moneypage", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = money01
    SetEntityRotation(money01, data.rotation)

    local money02 = CreateObject("bkr_prop_scrunched_moneypage", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = money02

    local money03 = CreateObject("bkr_prop_scrunched_moneypage", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = money03

    local money04 = CreateObject("bkr_prop_scrunched_moneypage", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = money04

    local money05 = CreateObject("bkr_prop_scrunched_moneypage", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = money05

    local money06 = CreateObject("bkr_prop_scrunched_moneypage", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = money06

    local scenePos = GetOffsetFromEntityInWorldCoords(money01, data.offset)
    local sceneRot = GetEntityRotation(money01)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene02 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "stop_blockage_operator", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(money01, scene01, animDict, "stop_blockage_scrunchedmoney", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(money02, scene01, animDict, "stop_blockage_scrunchedmoney^1", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(money03, scene01, animDict, "stop_blockage_scrunchedmoney^2", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene02, animDict, "stop_blockage_operator", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(money04, scene02, animDict, "stop_blockage_scrunchedmoney^3", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(money05, scene02, animDict, "stop_blockage_scrunchedmoney^4", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(money06, scene02, animDict, "stop_blockage_scrunchedmoney^5", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)
    NetworkStartSynchronisedScene(scene02)

    local wait = (GetAnimDuration(animDict, "stop_blockage_operator")*1000)
    progressBar(getPhrase("place_money_text"), wait)

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

local playCuttingScene = function(data)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("cutting_money"))

    local animDict = "anim@amb@business@cfm@cfm_cut_sheets@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_fakeid_papercutter")
    requestObjModel("bkr_prop_cutter_moneypage")
    requestObjModel("bkr_prop_fakeid_table")
    requestObjModel("bkr_prop_cutter_moneystack_01a")
    requestObjModel("bkr_prop_cutter_moneystrip")
    requestObjModel("bkr_prop_cutter_singlestack_01a")

    local cutter = CreateObject("bkr_prop_fakeid_papercutter", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = cutter
    SetEntityRotation(cutter, data.rotation)

    local moneyPage01 = CreateObject("bkr_prop_cutter_moneypage", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = moneyPage01

    local moneyPage02 = CreateObject("bkr_prop_cutter_moneypage", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = moneyPage02

    local moneyPage03 = CreateObject("bkr_prop_cutter_moneypage", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = moneyPage03

    local table = CreateObject("bkr_prop_fakeid_table", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = table
    
    local moneyStack = CreateObject("bkr_prop_cutter_moneystack_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = moneyStack

    local singleStack = CreateObject("bkr_prop_cutter_singlestack_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = singleStack

    local moneyStrip01 = CreateObject("bkr_prop_cutter_moneystrip", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = moneyStrip01

    local moneyStrip02 = CreateObject("bkr_prop_cutter_moneystrip", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = moneyStrip02

    local moneyStrip03 = CreateObject("bkr_prop_cutter_moneystrip", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = moneyStrip03

    local moneyStrip04 = CreateObject("bkr_prop_cutter_moneystrip", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = moneyStrip04

    local moneyStrip05 = CreateObject("bkr_prop_cutter_moneystrip", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = moneyStrip05

    local scenePos = GetOffsetFromEntityInWorldCoords(cutter, data.offset)
    local sceneRot = GetEntityRotation(cutter)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene02 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene03 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene04 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "extended_load_tune_cut_billcutter", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(cutter, scene01, animDict, "extended_load_tune_cut_papercutter", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(moneyPage01, scene01, animDict, "extended_load_tune_cut_singlemoneypage", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(moneyPage02, scene01, animDict, "extended_load_tune_cut_singlemoneypage^1", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene02, animDict, "extended_load_tune_cut_billcutter", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(moneyPage03, scene02, animDict, "extended_load_tune_cut_singlemoneypage^2", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(table, scene02, animDict, "extended_load_tune_cut_table", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(moneyStack, scene02, animDict, "extended_load_tune_cut_moneystack", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene03, animDict, "extended_load_tune_cut_billcutter", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(singleStack, scene03, animDict, "extended_load_tune_cut_singlestack", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(moneyStrip01, scene03, animDict, "extended_load_tune_cut_singlemoneystrip", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(moneyStrip02, scene03, animDict, "extended_load_tune_cut_singlemoneystrip^1", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene04, animDict, "extended_load_tune_cut_billcutter", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(moneyStrip03, scene04, animDict, "extended_load_tune_cut_singlemoneystrip^2", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(moneyStrip04, scene04, animDict, "extended_load_tune_cut_singlemoneystrip^3", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(moneyStrip05, scene04, animDict, "extended_load_tune_cut_singlemoneystrip^4", 1.0, -1.0, 1148846080)


    NetworkStartSynchronisedScene(scene01)
    NetworkStartSynchronisedScene(scene02)
    NetworkStartSynchronisedScene(scene03)
    NetworkStartSynchronisedScene(scene04)

    local wait = (GetAnimDuration(animDict, "extended_load_tune_cut_billcutter")*1000)
    progressBar(getPhrase("cutting_money_text"), wait)

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

local playDryingScene = function(data, mainData)
    local playerPed = PlayerPedId()
    local pCoords = GetEntityCoords(playerPed)
    local sceneObjects = {}

    showNotification(getPhrase("wash_money"))

    local animDict = "anim@amb@business@cfm@cfm_drying_notes@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_money_pokerbucket")
    requestObjModel("bkr_prop_money_unsorted_01")

    local bucket = CreateObject("bkr_prop_money_pokerbucket", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = bucket
    SetEntityRotation(bucket, data.rotation)

    local unsortedMoney01 = CreateObject("bkr_prop_money_unsorted_01", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = unsortedMoney01

    local unsortedMoney02 = CreateObject("bkr_prop_money_unsorted_01", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = unsortedMoney02

    local scenePos = GetOffsetFromEntityInWorldCoords(bucket, data.offset)
    local sceneRot = GetEntityRotation(bucket)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "loading_v3_worker", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(bucket, scene01, animDict, "loading_v3_bucket", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(unsortedMoney01, scene01, animDict, "loading_v3_money01", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(unsortedMoney02, scene01, animDict, "loading_v3_money01^1", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)

    local wait = (GetAnimDuration(animDict, "loading_v3_worker")*1000)
    progressBar(getPhrase("wash_money_text"), wait)

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

    showNotification(getPhrase("count_money"))

    local animDict = "anim@amb@business@cfm@cfm_counting_notes@"

    requestAnim(animDict)
    requestObjModel("bkr_prop_coke_tin_01")
    requestObjModel("bkr_prop_tin_cash_01a")
    requestObjModel("bkr_prop_money_unsorted_01")
    requestObjModel("bkr_prop_money_wrapped_01")

    local cokeTin = CreateObject("bkr_prop_coke_tin_01", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = cokeTin
    SetEntityRotation(cokeTin, data.rotation)

    local cash = CreateObject("bkr_prop_tin_cash_01a", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = cash

    local unsortedMoney01 = CreateObject("bkr_prop_money_unsorted_01", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = unsortedMoney01

    local unsortedMoney02 = CreateObject("bkr_prop_money_unsorted_01", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = unsortedMoney02

    local wrappedMoney01 = CreateObject("bkr_prop_money_wrapped_01", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = wrappedMoney01

    local wrappedMoney02 = CreateObject("bkr_prop_money_wrapped_01", data.coords.x, data.coords.y, data.coords.z, true, true, true)
    sceneObjects[#sceneObjects + 1] = wrappedMoney02

    local scenePos = GetOffsetFromEntityInWorldCoords(cokeTin, data.offset)
    local sceneRot = GetEntityRotation(cokeTin)

    local scene01 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)
    local scene02 = NetworkCreateSynchronisedScene(scenePos, sceneRot, 2, true, false, 1065353216, 0, 1065353216)

    NetworkAddPedToSynchronisedScene(playerPed, scene01, animDict, "note_counting_v2_counter", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(cokeTin, scene01, animDict, "note_counting_v2_binmoney", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(cash, scene01, animDict, "note_counting_v2_moneybin", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(unsortedMoney01, scene01, animDict, "note_counting_v2_moneyunsorted", 1.0, -1.0, 1148846080)

    NetworkAddPedToSynchronisedScene(playerPed, scene02, animDict, "note_counting_v2_counter", 4.0, -4.0, 1033, 0, 1000.0, 0)
    NetworkAddEntityToSynchronisedScene(unsortedMoney02, scene02, animDict, "note_counting_v2_moneyunsorted^1", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(wrappedMoney01, scene02, animDict, "note_counting_v2_moneywrap", 1.0, -1.0, 1148846080)
    NetworkAddEntityToSynchronisedScene(wrappedMoney02, scene02, animDict, "note_counting_v2_moneywrap^1", 1.0, -1.0, 1148846080)

    NetworkStartSynchronisedScene(scene01)
    NetworkStartSynchronisedScene(scene02)

    local wait = (GetAnimDuration(animDict, "note_counting_v2_counter")*1000)
    progressBar(getPhrase("count_money_text"), wait)

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
        for k,v in pairs(Config.Laundry.labs) do
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
                    showHelpNotification(getPhrase("enter_laundry_lab"))
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
                    showHelpNotification(getPhrase("exit_laundry_lab"))
                    if IsControlJustPressed(0, 38) and not progress then
                        progress = true
                        teleportPlayer(v.enterance.enterCoords)
                        progress = false
                    end
                end

                for _, data in pairs(v.placePaperScene.coords) do
                    local placeDst = #(pCoords - data.coords)

                    if placeDst <= 10 then
                        sleep = 1
                        DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                    end
                    
                    if placeDst <= 1 then
                        showHelpNotification(getPhrase("start_place_paper"))
                        if IsControlJustPressed(0, 38) and not progress then
    
                            if next(v.placePaperScene.requiredItems) then
                                TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                    if not result.status then
                                        return
                                    end
                                    progress = true
                                    playPlacePaperScene(data, v.placePaperScene)
                                end, {items = v.placePaperScene.requiredItems, remove = v.placePaperScene.removeItem})
                            else
                                progress = true
                                playPlacePaperScene(data, v.placePaperScene)
                            end
                        end
                    end
                end

                local cuttingDst = #(pCoords - v.cuttingScene.coords)

                if cuttingDst <= 10 then
                    sleep = 1
                    DrawMarker(2, v.cuttingScene.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                end
                
                if cuttingDst <= 1 then
                    showHelpNotification(getPhrase("start_cutting_money"))
                    if IsControlJustPressed(0, 38) and not progress then
                        if next(v.cuttingScene.requiredItems) then
                            TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                if not result.status then
                                    return
                                end
                                progress = true
                                playCuttingScene(v.cuttingScene)
                            end, {items = v.cuttingScene.requiredItems, remove = v.cuttingScene.removeItem})
                        else
                            progress = true
                            playCuttingScene(v.cuttingScene)
                        end
                    end
                end

                for _, data in pairs(v.dryingScene.coords) do
                    local placeDst = #(pCoords - data.coords)

                    if placeDst <= 10 then
                        sleep = 1
                        DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                    end
                    
                    if placeDst <= 1 then
                        showHelpNotification(getPhrase("start_wash_money"))
                        if IsControlJustPressed(0, 38) and not progress then
    
                            if next(v.dryingScene.requiredItems) then
                                TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
                                    if not result.status then
                                        return
                                    end
                                    progress = true
                                    playDryingScene(data, v.dryingScene)
                                end, {items = v.dryingScene.requiredItems, remove = v.dryingScene.removeItem})
                            else
                                progress = true
                                playDryingScene(data, v.dryingScene)
                            end
                        end
                    end
                end

                for _, data in pairs(v.packingScene.coords) do
                    local placeDst = #(pCoords - data.coords)

                    if placeDst <= 10 then
                        sleep = 1
                        DrawMarker(2, data.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 44, 194, 33, 255, false, false, false, 1, false, false, false)
                    end
                    
                    if placeDst <= 1 then
                        showHelpNotification(getPhrase("start_count_money"))
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
