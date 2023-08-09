-- local pedHandle = nil
-- local cornerHolding = false
-- local areaCoords = nil
-- local needItem = nil
-- local progress = false
-- local npcList = {}

-- local createBuyer = function(data)
--     if DoesEntityExist(pedHandle) then
--         local oldPed = pedHandle
--         TaskWanderStandard(oldPed, 1, 10)
--         Citizen.SetTimeout(10000, function()
--             if DoesEntityExist(oldPed) then
--                 SetEntityAsMissionEntity(oldPed, true, true)
--                 DeleteEntity(oldPed)
--             end
--         end)
--     end
--     local pedModel = data.pedModels[math.random(1, #data.pedModels)]
--     requestObjModel(pedModel)
--     local pX, pY = math.random(50, 100), math.random(50, 100)
--     local playerPed = PlayerPedId()
--     areaCoords = GetEntityCoords(playerPed)
--     pedHandle = CreatePed(4, pedModel, areaCoords.x + pX, areaCoords.y + pY, areaCoords.z, 0.0, true, true)
--     needItem = data.salableItems[math.random(1, #data.salableItems)]
--     SetPedKeepTask(pedHandle, true)
--     TaskGoToCoordAnyMeans(pedHandle, areaCoords, data.pedSpeed, 0, 0, 786603, 0xbf800000)
-- end

-- local findPed = function(data)
--     cornerHolding = true
--     createBuyer(data)
--     showNotification(getPhrase("started_corner_holding"))

--     Citizen.CreateThread(function()
--         while cornerHolding do
--             local sleep = 1000
--             local playerPed = PlayerPedId()
--             local pCoords = GetEntityCoords(playerPed)

--             local areaDst = #(pCoords - areaCoords)

--             if areaDst > 30 then
--                 cornerHolding = false
--                 if DoesEntityExist(pedHandle) then
--                     SetEntityAsMissionEntity(pedHandle, true, true)
--                     DeleteEntity(pedHandle)
--                 end
--                 showNotification(getPhrase("corner_holding_moved_away"))
--                 break
--             end

--             if HasEntityBeenDamagedByAnyPed(pedHandle) or IsEntityDead(pedHandle) or IsPedDeadOrDying(pedHandle) or not DoesEntityExist(pedHandle) then
--                 showNotification(getPhrase("buyer_has_damaged"))
--                 showNotification(getPhrase("looking_new_buyer"))
--                 createBuyer(data)
--             end

--             local pedCoords = GetEntityCoords(pedHandle)
--             local pedDst = #(pCoords - pedCoords)

--             if pedDst <= 5 then
--                 sleep = 1
--                 DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z + 1.0, 0.40, ("~g~[E]~w~ Sell ~b~%sx~w~ ~q~%s~w~ ~g~$~w~%s ~r~[H]~w~ Hire"):format(needItem.salableCount, needItem.name, needItem.price))
--                 if IsControlJustPressed(0, 38) and not progress then
--                     TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
--                         if not result.status then
--                             showNotification(getPhrase("buyer_not_like"))
--                             createBuyer(data)
--                             showNotification(getPhrase("looking_new_buyer"))

--                             if data.failedAlert then
--                                 local chance = math.random(1, 4)
--                                 if chance >= data.alertChance then
--                                     reportPolice(pCoords)
--                                 end
--                             end
                            
--                             return
--                         end
--                         progress = true
                        
--                         requestAnim("mp_common")
--                         TaskPlayAnim(playerPed, "mp_common", "givetake1_a", 8.0, -8.0, -1, 0, 0, 0, 0, 0)

--                         TriggerServerEvent("kaves_drugsv2:server:sellItem", needItem.name, needItem.salableCount, needItem.price)

--                         local chance = math.random(1, 4)
--                         if chance >= data.alertChance then
--                             reportPolice(pCoords)
--                         end

--                         createBuyer(data)
--                         showNotification(getPhrase("looking_new_buyer"))

--                         progress = false
--                     end, {
--                         items = {
--                             [needItem.name] = needItem.salableCount
--                         }, 
--                         remove = true
--                     })
--                 elseif IsControlJustPressed(0, 74) and not progress then
--                     progress = true
--                     createBuyer(data)
--                     showNotification(getPhrase("looking_new_buyer"))
--                     progress = false
--                 end
--             end

--             Citizen.Wait(sleep)
--         end
--     end)
-- end

-- local entityEnumerator = {
-- 	__gc = function(enum)
-- 	if enum.destructor and enum.handle then
-- 		enum.destructor(enum.handle)
-- 	end
-- 	enum.destructor = nil
-- 	enum.handle = nil
-- 	end
-- }

-- local EnumerateEntities = function(initFunc, moveFunc, disposeFunc)
-- 	return coroutine.wrap(function()
-- 	local iter, id = initFunc()
-- 	if not id or id == 0 then
-- 		disposeFunc(iter)
-- 		return
-- 	end
--         local enum = {handle = iter, destructor = disposeFunc}
--         setmetatable(enum, entityEnumerator)

--         local next = true
--         repeat
--             coroutine.yield(id)
--             next, id = moveFunc(iter)
--         until not next

--         enum.destructor, enum.handle = nil, nil
--         disposeFunc(iter)
-- 	end)
-- end

-- local EnumeratePeds = function()
-- 	return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
-- end

-- local findBuyer = function(data)
--     if DoesEntityExist(pedHandle) then
--         local oldPed = pedHandle
--         TaskWanderStandard(oldPed, 1, 10)
--         Citizen.SetTimeout(10000, function()
--             if DoesEntityExist(oldPed) then
--                 SetEntityAsMissionEntity(oldPed, true, true)
--                 DeleteEntity(oldPed)
--             end
--         end)
--     end
--     local playerPed = PlayerPedId()
--     local pCoords = GetEntityCoords(playerPed)
--     local found = false
--     while not found do
--         for npc in EnumeratePeds() do
--             local npcDst = #(pCoords - GetEntityCoords(npc))
--             if npcDst <= 50 and not IsPedAPlayer(npc) and not IsPedInAnyVehicle(npc) and not npcList[npc] then
--                 npcList[npc] = false
--                 found = true
--                 pedHandle = npc
--             end
--         end
--         Citizen.Wait(500)
--     end
--     areaCoords = pCoords
--     needItem = data.salableItems[math.random(1, #data.salableItems)]
--     SetPedKeepTask(pedHandle, true)
--     TaskGoToCoordAnyMeans(pedHandle, areaCoords, data.pedSpeed, 0, 0, 786603, 0xbf800000)
-- end

-- local findNPC = function(data)
--     cornerHolding = true
--     findBuyer(data)
--     showNotification(getPhrase("started_corner_holding"))
--     Citizen.CreateThread(function()
--         while cornerHolding do
--             local sleep = 1000
--             local playerPed = PlayerPedId()
--             local pCoords = GetEntityCoords(playerPed)

--             local areaDst = #(pCoords - areaCoords)

--             if areaDst > 30 then
--                 cornerHolding = false
--                 if DoesEntityExist(pedHandle) then
--                     SetEntityAsMissionEntity(pedHandle, true, true)
--                     DeleteEntity(pedHandle)
--                 end
--                 showNotification(getPhrase("corner_holding_moved_away"))
--                 break
--             end

--             if HasEntityBeenDamagedByAnyPed(pedHandle) or IsEntityDead(pedHandle) or IsPedDeadOrDying(pedHandle) or not DoesEntityExist(pedHandle) then
--                 showNotification(getPhrase("buyer_has_damaged"))
--                 showNotification(getPhrase("looking_new_buyer"))
--                 findBuyer(data)
--             end

--             local pedCoords = GetEntityCoords(pedHandle)
--             local pedDst = #(pCoords - pedCoords)

--             if pedDst <= 5 then
--                 if pedDst <= 1 then
--                     if not IsEntityPositionFrozen(pedHandle) and not npcList[pedHandle] then
--                         FreezeEntityPosition(pedHandle, true)
--                     end
--                     ClearPedTasks(pedHandle)
--                 end

--                 sleep = 1
--                 DrawText3D(pedCoords.x, pedCoords.y, pedCoords.z + 1.0, 0.40, ("~g~[E]~w~ Sell ~b~%sx~w~ ~q~%s~w~ ~g~$~w~%s ~r~[H]~w~ Hire"):format(needItem.salableCount, needItem.name, needItem.price))
--                 if IsControlJustPressed(0, 38) and not progress then
--                     TriggerCallback("kaves_drugsv2:server:checkItem", function(result)
--                         if not result.status then
--                             showNotification(getPhrase("buyer_not_like"))
--                             npcList[pedHandle] = true
--                             findBuyer(data)
--                             showNotification(getPhrase("looking_new_buyer"))
--                             if data.failedAlert then
--                                 local chance = math.random(1, 4)
--                                 if chance >= data.alertChance then
--                                     reportPolice(pCoords)
--                                 end
--                             end
                            
--                             return
--                         end
--                         progress = true
                        
--                         requestAnim("mp_common")
--                         TaskPlayAnim(playerPed, "mp_common", "givetake1_a", 8.0, -8.0, -1, 0, 0, 0, 0, 0)
--                         TriggerServerEvent("kaves_drugsv2:server:sellItem", needItem.name, needItem.salableCount, needItem.price)
--                         npcList[pedHandle] = true
                        
--                         local chance = math.random(1, 4)
--                         if chance >= data.alertChance then
--                             reportPolice(pCoords)
--                         end
--                         FreezeEntityPosition(pedHandle, false)
--                         findBuyer(data)
--                         showNotification(getPhrase("looking_new_buyer"))

--                         progress = false
--                     end, {
--                         items = {
--                             [needItem.name] = needItem.salableCount
--                         }, 
--                         remove = true
--                     })
--                 elseif IsControlJustPressed(0, 74) and not progress then
--                     progress = true
--                     npcList[pedHandle] = true
--                     FreezeEntityPosition(pedHandle, false)
--                     findBuyer(data)
--                     showNotification(getPhrase("looking_new_buyer"))
--                     progress = false
--                 end
--             end

--             Citizen.Wait(sleep)
--         end
--     end)
-- end

-- local startCornerHolding = function()
--     if cornerHolding then
--         return
--     end

--     local playerPed = PlayerPedId()

--     if IsPedInAnyVehicle(playerPed) or IsPedInAnyBoat(playerPed) and IsPedInAnyHeli(playerPed) and IsPedInAnyPlane(playerPed) then
--         return showNotification(getPhrase("cant_corner_in_vehicle"))
--     end

--     if IsEntityDead(playerPed) or IsPedDeadOrDying(playerPed) then
--         return showNotification(getPhrase("cant_corner_while_dead"))
--     end

--     if Config.CornerHolding.certainArea then
--         local canHold = false
--         local pCoords = GetEntityCoords(playerPed)

--         for k,v in pairs(Config.CornerHolding.certainAreas) do
--             local dst = #(pCoords - v.coords)
--             if dst <= v.radius then
--                 canHold = true
--             end
--         end
        
--         if not canHold then
--             return showNotification(getPhrase("cant_corner_this_area"))
--         end
--     end

--     TriggerCallback("kaves_drugsv2:server:checkCopCount", function(result)
--         if not result.status then
--             return
--         end

--         if Config.CornerHolding.useNPC then
--             findNPC(Config.CornerHolding)
--         else
--             findPed(Config.CornerHolding)
--         end
--     end)
-- end

-- RegisterCommand(Config.CornerHolding.commandName, function()
--     if cornerHolding then
--         cornerHolding = false
--         if DoesEntityExist(pedHandle) then
--             SetEntityAsMissionEntity(pedHandle, true, true)
--             DeleteEntity(pedHandle)
--         end
--         return showNotification(getPhrase("cancel_cornerholding"))
--     end
--     startCornerHolding()
-- end)