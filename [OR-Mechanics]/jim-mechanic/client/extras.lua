local cleaning = false
local effectTimer = 0
local DistAdd, DistCount, maxSpeed, ShowingOdo, ShowOdo, owned, veh, databasecalc, odocalc, nosUpdate = 0, 0, 0, false, Config.Odometer.ShowOdo, false, 0, false, false, false

--Vehicle Ejection Variables
local isBike, harnessBreakSpeed, newVehBody, curVehBody, frameBodyChange, lastSpeed, lastSpeed2, thisFrameSpeed, tick, damagedone, lastVehicle, modifierDensity = false, 200, 0, 0, 0, 0, 0, 0, 0, false, nil, true

RegisterNetEvent("jim-mechanic:client:CarWax", function(data) local Ped = PlayerPedId()
	if not cleaning then cleaning = true else return end
	triggerNotify(nil, Loc[Config.Lan]["police"].cleaning)
	local vehicle
	if not IsPedInAnyVehicle(Ped, false) then vehicle = getClosest(GetEntityCoords(Ped)) end
	TriggerEvent('animations:client:EmoteCommandStart', {"clean2"})
	while cleaning do
		local dirtLevel = GetVehicleDirtLevel(vehicle)
		if dirtLevel >= 1.0 then
			SetVehicleDirtLevel(vehicle, (dirtLevel) - 0.3)
		elseif dirtLevel <= 1.0 then
			SetVehicleDirtLevel(vehicle, 0.0)
			WashDecalsFromVehicle(vehicle, 1.0)
			cleaning = false
			triggerNotify(nil, Loc[Config.Lan]["extras"].clean, "success")
		end
		Wait(300)
	end
	Wait(1000)
	emptyHands(Ped)
	if not cleaning and data.time ~= 0 then
		TriggerServerEvent("jim-mechanic:server:WaxActivator", VehToNet(vehicle), data.time)
	end
	if Config.Overrides.CosmeticItemRemoval and not data.skip then toggleItem(false, "cleaningkit") end
end)

RegisterNetEvent("jim-mechanic:client:CarWax:WaxTick", function(vehicle)
	if not NetworkDoesEntityExistWithNetworkId(vehicle) then return end
	if DoesEntityExist(NetToVeh(vehicle)) then
		if #(GetEntityCoords(Ped) - GetEntityCoords(NetToVeh(vehicle))) <= 100.0 then
			SetVehicleDirtLevel(NetToVeh(vehicle), 0.0)
		end
	end
end)

--== Car Cleaning ==--
RegisterNetEvent('jim-mechanic:client:cleanVehicle', function(skip) local Ped = PlayerPedId()
	local coords = GetEntityCoords(Ped)
	if not inCar() then return end
	if not nearPoint(coords) then return end
	local vehicle = getClosest(coords) pushVehicle(vehicle) lookVeh(vehicle)
	if DoesEntityExist(vehicle) then
		local Menu = {}
		if Config.System.Menu == "qb" then
			Menu[#Menu+1] = { icon = "cleaningkit", isMenuHeader = true, header = searchCar(vehicle), txt = "Class: "..getClass(vehicle) or "N/A".."<br>"..Loc[Config.Lan]["check"].plate..trim(GetVehicleNumberPlateText(vehicle))..Loc[Config.Lan]["check"].value..searchPrice(vehicle).."<br>"..searchDist(vehicle), }
			Menu[#Menu+1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan]["common"].close, params = { event = "jim-mechanic:client:Menu:Close" } }
		end
			Menu[#Menu+1] = {
				header = Loc[Config.Lan]["carwax"].head1, params = { event = "jim-mechanic:client:CarWax", args = { time = 0, skip = skip }},
				title = Loc[Config.Lan]["carwax"].head1, event = "jim-mechanic:client:CarWax", args = { time = 0, skip = skip }
			}
		if Config.Overrides.WaxFeatures then
			Menu[#Menu+1] = {
				header = Loc[Config.Lan]["carwax"].head2, params = { event = "jim-mechanic:client:CarWax", args = { time = 1800, skip = skip }},
				title = Loc[Config.Lan]["carwax"].head2, event = "jim-mechanic:client:CarWax", args = { time = 1800, skip = skip }
			}
			Menu[#Menu+1] = {
				header = Loc[Config.Lan]["carwax"].head3, params = { event = "jim-mechanic:client:CarWax", args = { time = 3600, skip = skip }},
				title = Loc[Config.Lan]["carwax"].head3, event = "jim-mechanic:client:CarWax", args = { time = 3600, skip = skip }
			}
			Menu[#Menu+1] = {
				header = Loc[Config.Lan]["carwax"].head4, params = { event = "jim-mechanic:client:CarWax", args = { time = 5400, skip = skip }},
				title = Loc[Config.Lan]["carwax"].head4, event = "jim-mechanic:client:CarWax", args = { time = 5400, skip = skip }
			}
		end
		if Config.System.Menu == "ox" then	exports.ox_lib:registerContext({id = 'Menu', title = searchCar(vehicle), position = 'top-right', options = Menu }) exports.ox_lib:showContext("Menu")
		elseif Config.System.Menu == "qb" then	exports['qb-menu']:openMenu(Menu) end
	end
end)

--Duct Tape Repair
RegisterNetEvent('jim-mechanic:quickrepair', function() local Ped = PlayerPedId()
	local coords = GetEntityCoords(Ped)
	local repaireng = true
	local repairbody = true
	if not IsPedInAnyVehicle(Ped, false) then	vehicle = getClosest(coords) pushVehicle(vehicle) end
	if DoesEntityExist(vehicle) then
		local damageTable = getDamages(vehicle)
		if damageTable["engine"] >= Config.DuctTape.MaxDuctEngine then repaireng = false else repaireng = true end
		if Config.DuctTape.DuctTapeBody and damageTable["body"] >= Config.DuctTape.MaxDuctBody then repairbody = false else repairbody = true end
		if repaireng or repairbody then
			lookVeh(vehicle)
			Wait(1000)
			SetVehicleDoorOpen(vehicle, 4, false, false)
			QBCore.Functions.Progressbar("drink_something", Loc[Config.Lan]["repair"].applyduct, 10000, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
			{ animDict = "mini@repair",	anim = "fixing_a_ped", flags = 16, }, {}, {}, function() SetVehicleModKit(vehicle, 0)
				Wait(1000)
				emptyHands(Ped)
				if Config.DuctTape.DuctSimpleMode then
					SetVehicleEngineHealth(vehicle, Config.DuctTape.MaxDuctEngine)
					SetVehicleBodyHealth(vehicle, Config.DuctTape.MaxDuctBody)
				elseif not Config.DuctTape.DuctSimpleMode then
					if damageTable["engine"] <= 50.0 and damageTable["engine"] <= 200 then SetVehicleEngineHealth(vehicle, 300.0)
					else
						SetVehicleEngineHealth(vehicle, damageTable["engine"] + Config.DuctAmountEngine)
						if GetVehicleEngineHealth(vehicle) > Config.DuctTape.MaxDuctEngine then SetVehicleEngineHealth(vehicle, Config.DuctTape.MaxDuctEngine) end
					end
					if Config.DuctTape.DuctTapeBody then
						if damageTable["body"] <= 50.0 and damageTable["body"] <= 200 then SetVehicleBodyHealth(vehicle, 300.0)
						else SetVehicleBodyHealth(vehicle, damageTable["body"] + Config.DuctAmountBody)
							if GetVehicleBodyHealth(vehicle) > Config.DuctTape.MaxDuctBody then SetVehicleBodyHealth(vehicle, Config.DuctTape.MaxDuctBody) end
						end
					end
					SetVehicleDoorShut(vehicle, 4, false, false)
				end
				if Config.RemoveDuctTape then toggleItem(false, "ducttape") end
			end, function()
				SetVehicleDoorShut(vehicle, 4, false, false)
				emptyHands(Ped)
			end, "ducttape")

		else triggerNotify(nil, Loc[Config.Lan]["repair"].ductfull, "error") end
	else triggerNotify(nil, Loc[Config.Lan]["repair"].nocar, "error") end
end)

--Multipurpose Door command
RegisterNetEvent('jim-mechanic:client:openDoor', function(door) local Ped = PlayerPedId()
	local doornum = tonumber(door)
	if doornum < 0 or doornum > 5 then
		triggerNotify(nil, Loc[Config.Lan]["extras"].doorerr, "error")
		return
	end
	local coords = GetEntityCoords(Ped)
	if not nearPoint(coords) then return end
	local vehicle = nil
	if IsPedSittingInAnyVehicle(Ped) then	vehicle = GetVehiclePedIsIn(Ped, false)
	else vehicle = getClosest(coords) pushVehicle(vehicle) end
	if DoesEntityExist(vehicle) then
		if GetVehicleDoorLockStatus(vehicle) == 2 then
			triggerNotify(nil, Loc[Config.Lan]["extras"].locked, "error")
			return
		else
			if GetVehicleDoorAngleRatio(vehicle, doornum) > 0.0 then SetVehicleDoorShut(vehicle, doornum, false)
			else SetVehicleDoorOpen(vehicle, doornum, false, false) end
		end
	end
end)

RegisterNetEvent("jim-mechanic:flipvehicle", function() local Ped = PlayerPedId()
	local coords = GetEntityCoords(Ped)
	if not inCar() then	return end
	if not nearPoint(coords) then return end
	local vehicle = getClosest(coords) pushVehicle(vehicle)
	if DoesEntityExist(vehicle) then
		emptyHands(Ped)
		if progressBar({label = Loc[Config.Lan]["extras"].flipping, time = 12000, cancel = true, dict = "missfinale_c2ig_11", anim = "pushcar_offcliff_f", flag = 15 }) then
			qblog("used `/flipvehicle`")
			local vehiclecoords = GetEntityCoords(vehicle)
			SetEntityCoords(vehicle, vehiclecoords.x+0.5, vehiclecoords.y+0.5, vehiclecoords.z+1)
			Wait(200)
			SetEntityRotation(vehicle, GetEntityRotation(Ped, 2), 2)
			Wait(500)
			SetVehicleOnGroundProperly(vehicle)
			triggerNotify(nil, Loc[Config.Lan]["extras"].flipped, "success")
		else
			triggerNotify(nil, Loc[Config.Lan]["extras"].failed, "error")
		end
	end
end)

RegisterNetEvent("jim-mechanic:seat", function(seat) local Ped = PlayerPedId()
	if not seat then triggerNotify(nil, Loc[Config.Lan]["extras"].noseat, "error") return end
	local vehicle = GetVehiclePedIsIn(Ped)
	local IsSeatFree = IsVehicleSeatFree(vehicle, tonumber(seat))
	local speed = GetEntitySpeed(vehicle)
	if not HasHarness() then
		local kmh = (speed * 3.6);
		if IsSeatFree then
			if kmh <= 100.0 then
				SetPedIntoVehicle(Ped, vehicle, tonumber(seat))
				triggerNotify(nil, Loc[Config.Lan]["extras"].moveseat..seat.."!")
			else
				triggerNotify(nil, Loc[Config.Lan]["extras"].fastseat)
			end
		else
			triggerNotify(nil, Loc[Config.Lan]["extras"].notseat)
		end
	else
		triggerNotify(nil, Loc[Config.Lan]["extras"].harness, 'error')
	end
end)

local soundTog = false
RegisterNetEvent("jim-mechanic:togglesound", function()
	local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)
	local Ped
	if not soundTog then soundTog = true
		currentEngine = GetVehicleMod(vehicle, 11)
		local soundTable = {
			[0] = "zorrusso", [1] = "zentorno", [2] = "krieger", [3] = "monster", [4] = "monster",
		}
		ForceVehicleEngineAudio(vehicle, soundTable[currentEngine])
	elseif soundTog then soundTog = false
		ForceVehicleEngineAudio(vehicle, string.lower(GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))))
	end
end)


local function hideOdo()
	TriggerEvent("jim-mechanic:client:HideText") odoCalc = false
end

local function updateOdo(dist, veh, plate)
	if plate == nil then return end
	local odotext, lights = "", ""
	if dist ~= "" then
		if Config.System.distkph then odotext = string.format("%05d", math.floor((dist+math.round(DistAdd)) * 0.001)).." <b>Km</b>"
		else odotext = string.format("%05d", math.floor((dist+math.round(DistAdd)) * 0.000621371)).." <b>Mi</b>" end
	end
	if Config.System.Debug then
		odotext =
		"<br><b>Vehicle Debug Info</b>:"..
		"<br>"..searchCar(veh)..
		"<br>Class: "..(getClass(veh) or "N/A")..
		"<br>"..Loc[Config.Lan]["check"].plate.." "..plate..
		"<br>Dist: "..tostring(odotext or "")..
		"<br>Fuel: "..GetVehicleFuelLevel(veh).."%"
		if VehicleNitrous[plate] then
			odotext = odotext.."<br>NOS: "..nosBar((VehicleNitrous[plate].level)).." "..tostring((VehicleNitrous[plate].level)).."%"
		end

		local vehcoord = GetEntityCoords(veh)
		local streetname, crossingname = GetStreetNameAtCoord(vehcoord.x, vehcoord.y, vehcoord.z, veh)
		odotext = odotext.."<br><br>Street Name: "..GetStreetNameFromHashKey(streetname)..
							"<br>onRoad: "..tostring(IsPointOnRoad(GetEntityCoords(veh), veh))
		odotext = odotext..
		"<br><br><b>Vehicle Health</b>:"..
		"<br>Engine: "..math.floor(GetVehicleEngineHealth(veh) / 10).."%"..
		"<br>Body: "..math.floor(GetVehicleBodyHealth(veh) / 10).."%"
		if Config.Repairs.ExtraDamages == true then
			odotext = odotext..
			"<br>"..Loc[Config.Lan]["repair"].oil..": "..math.floor(VehicleStatus[plate]["oil"]).."%"..
			"<br>"..Loc[Config.Lan]["repair"].driveshaft..": "..math.floor(VehicleStatus[plate]["axle"]).."%"..
			"<br>"..Loc[Config.Lan]["repair"].spark..": "..math.floor(VehicleStatus[plate]["spark"]).."%"..
			"<br>"..Loc[Config.Lan]["repair"].battery..": "..math.floor(VehicleStatus[plate]["battery"]).."%"..
			"<br>"..Loc[Config.Lan]["repair"].tank..": "..math.floor(VehicleStatus[plate]["fuel"]).."%"
		end
		odotext = odotext..
		"<br><br><b>Upgrade Levels</b>:"..
		"<br>"..Loc[Config.Lan]["check"].label1.." Lvl "..(GetVehicleMod(veh, 11)+1).."/"..GetNumVehicleMods(veh, 11)..
		"<br>"..Loc[Config.Lan]["check"].label2.." Lvl "..(GetVehicleMod(veh, 12)+1).."/"..GetNumVehicleMods(veh, 12)..
		"<br>"..Loc[Config.Lan]["check"].label3.." Lvl "..(GetVehicleMod(veh, 15)+1).."/"..GetNumVehicleMods(veh, 15)..
		"<br>"..Loc[Config.Lan]["check"].label4.." Lvl "..(GetVehicleMod(veh, 13)+1).."/"..GetNumVehicleMods(veh, 13)..
		"<br>"..Loc[Config.Lan]["check"].label5.." Lvl "..(GetVehicleMod(veh, 16)+1).."/"..GetNumVehicleMods(veh, 16)..
		"<br>"..Loc[Config.Lan]["check"].label6.." "..tostring(IsToggleModOn(veh, 18))..
		"<br>"..Loc[Config.Lan]["check"].label7.." "..tostring(IsToggleModOn(veh, 22))..
		"<br>"..Loc[Config.Lan]["check"].label8.." "..tostring(GetDriftTyresEnabled(veh))..
		"<br>"..Loc[Config.Lan]["check"].label9.." "..tostring(not GetVehicleTyresCanBurst(veh))..
		"<br><br>Oil Tank: Lvl "..VehicleStatus[plate].oillevel.."/3"..
		"<br>Drive Shaft: Lvl "..VehicleStatus[plate].shaftlevel.."/3"..
		"<br>Cylinder Head: Lvl "..VehicleStatus[plate].cylinderlevel.."/3"..
		"<br>Battery Cables: Lvl "..VehicleStatus[plate].cablelevel.."/3"..
		"<br>Fuel Tank: Lvl "..VehicleStatus[plate].fuellevel.."/3"..
		"<br>Damage Effect Timer: "..effectTimer..

		"<br><br>Harness: "..VehicleStatus[plate].harness..

		"<br><br>DamageTimer "..damageTimer..
		"<br><br>purgeCool "..purgeCool
	end
	if Config.Odometer.OdoShowIcons or Config.System.Debug then
		local br = "&nbsp;&nbsp;"
		if Config.Odometer.OdoLocation == "right" or Config.Odometer.OdoLocation == "left" then br = "<br>" vert = "horizontal" end
		if Config.Odometer.OdoIconsToShow["engine"] then local engHealth = GetVehicleEngineHealth(veh)
			if engHealth > 700 then
				if Config.Odometer.OdoAlwaysShowIcons then lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height:3.0vh' src='img/engine.png'>"..br
				else lights = lights.."" end
			elseif engHealth < 700 and engHealth > 350 then
				lights = lights.. "<img style='vertical-align:middle; filter: invert(106%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height:3.0vh' src='img/engine.png'>"..br
			elseif engHealth < 350 then
				lights = lights.."<img style='vertical-align:middle; filter: invert(16%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height:3.0vh' src='img/engine.png'>"..br
			end
		end
		if Config.Odometer.OdoIconsToShow["engine"] then local bodHealth = GetVehicleBodyHealth(veh)
			if bodHealth > 700 then
				if Config.Odometer.OdoAlwaysShowIcons then lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height:3.0vh' src='img/body.png'>"..br
				else lights = lights.."" end
			elseif bodHealth < 700 and bodHealth > 450 then
				lights = lights.. "<img style='vertical-align:middle; filter: invert(106%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height:3.0vh' src='img/body.png'>"..br
			elseif bodHealth < 350 then
				lights = lights.."<img style='vertical-align:middle; filter: invert(16%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height:3.0vh' src='img/body.png'>"..br
			end
		end
		if Config.Repairs.ExtraDamages == true then
			for k, v in pairs({"oil", "spark", "axle", "battery"}) do
				if Config.Odometer.OdoIconsToShow[v] then
					if math.floor(VehicleStatus[plate][v]) then
						if math.floor(VehicleStatus[plate][v]) > 70 then
							if Config.Odometer.OdoAlwaysShowIcons then lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height:3.0vh' src='img/"..v..".png'>"..br
							else lights = lights.."" end
						elseif math.floor(VehicleStatus[plate][v]) < 70 and math.floor(VehicleStatus[plate][v]) > 45 then
							lights = lights.."<img style='vertical-align:middle; filter: invert(106%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height:3.0vh' src='img/"..v..".png'>"..br
						elseif math.floor(VehicleStatus[plate][v]) < 45 then
							lights = lights.."<img style='vertical-align:middle; filter: invert(16%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height:3.0vh' src='img/"..v..".png'>"..br
						end
					end
				end
			end
		end
		if Config.Odometer.OdoIconsToShow["headlight"] then
			local headlights = {}
			headlights[1], headlights[2], headlights[3] = GetVehicleLightsState(veh)
			if headlights[2] == 1 then
				if headlights[3] == 0 then
					lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height:3.0vh' src='img/headlight1.png'>"..br
				elseif headlights[3] == 1 then
					lights = lights.."<img style='vertical-align:middle; filter: invert(106%); height:3.0vh' src='img/headlight2.png'>"..br
				end
			end
		end
		if Config.Odometer.OdoIconsToShow["wheel"] then
			for _, v in pairs({0, 1, 2, 3, 4, 5, 45, 47}) do
				if IsVehicleTyreBurst(vehicle, v, 0) == 1 or IsVehicleTyreBurst(vehicle, v, 1) == 1 then
					lights = lights.."<img style='vertical-align:middle; filter: invert(16%)  sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); height:3.0vh' src='img/wheel.png'>"..br
					break
				end
			end
		end
		if VehicleNitrous[plate] then
			local style
			if purgemode then
				style = "vertical-align:middle; filter: invert("..(purgeSize*100).."%); opacity: "..VehicleNitrous[plate].level/100 .."; height:3.0vh"
				lights = lights.."<img style='"..style.."' src='img/purge.png'>"..br
			else
				if purgeCool > 0 then
					local brightness = 100 - (100 / (purgeCool+1))
					lights = lights..purgeCool.."<img style='vertical-align:middle; filter: invert("..brightness.."%); ; height:3.0vh' src='img/nos.png'>"..br
				else
					style = "vertical-align:middle; filter: invert(100%); height:3.0vh"
					if boostLevel == 2 then style = "vertical-align:middle; filter: invert(106%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); opacity: "..VehicleNitrous[plate].level/100 .."; height:3.0vh" end
					if boostLevel == 3 then style = "vertical-align:middle; filter: invert(16%) sepia(99%) saturate(7404%) hue-rotate(4deg) brightness(95%) contrast(118%); opacity: "..VehicleNitrous[plate].level/100 .."; height:3.0vh" end
					lights = lights.."<img style='"..style.."' src='img/nos.png'>"..br
				end
			end
		end
		TriggerEvent("jim-mechanic:client:DrawText", "<center>"..lights.."<span style=''>"..odotext.."</span>", tostring(Config.Odometer.OdoLocation))
	end
end

local function inCarCheck(Ped, veh, plate)
	while GetPedInVehicleSeat(veh, -1) == PlayerPedId() do inVehicle = true Wait(3000) end
	inVehicle = false
	if nosCheck and VehicleNitrous[plate] then
		TriggerServerEvent('jim-mechanic:database:UpdateNitroLevel', plate, VehicleNitrous[plate].level) -- Update the nos when you are no longer in that vehicle
	end
	effectTimer = 0
	maxspeed = 0
	nosCheck = false
	damageTimer = 0
	purgeCool = 0
	hideOdo()
	DistAdd = 0
end

RegisterNetEvent("QBCore:Client:EnteredVehicle", function()
	local Ped = PlayerPedId()
	veh = GetVehiclePedIsIn(Ped)
	local plate = trim(GetVehicleNumberPlateText(veh))
	if Config.System.Debug then print("^5Debug^7: ^3EnteredVehicle^7: ^2Player has entered vehicle") end
	if not VehicleStatus[plate] then
		if Config.System.Debug then print("^5Debug^7: ^3EnteredVehicle^7: ^4VehicleStatus^7[^6"..plate.."^7]^2 not found^7,^2 loading^7...") end
		TriggerServerEvent("jim-mechanic:server:setupVehicleStatus", plate, GetVehicleEngineHealth(veh), GetVehicleBodyHealth(veh))
		while not VehicleStatus[plate] do Wait(10) end
	end
	inVehicle = (GetPedInVehicleSeat(veh, -1) == Ped)
	CreateThread(function() inCarCheck(Ped, veh, plate) end)
	if inVehicle then
		--TriggerServerEvent('jim-mechanic:server:LoadNitrous', plate)
		local prevLoc = GetEntityCoords(veh)
		nosCheck = true
		local dist = ""
		local owned = IsVehicleOwned(plate)
		local nos = {}
		damageTimer = 0
		if VehicleNitrous[plate] then nos = { VehicleNitrous[plate].hasnitro, VehicleNitrous[plate].level } end
		TriggerEvent('hud:client:UpdateNitrous', nos[1] or false, nos[2] or 0, false)
		if owned then
			local p = promise.new()
			QBCore.Functions.TriggerCallback('jim-mechanic:distGrab', function(cb) p:resolve(cb) end, plate)
			dist = Citizen.Await(p)
		end
		-- LOOP TO UPDATE DATABASE WHILE DRIVING
		CreateThread(function()
			while owned and inVehicle do
				if not IsVehicleStopped(GetVehiclePedIsIn(Ped)) then
					DistAdd = DistAdd + #(prevLoc - GetEntityCoords(veh))
					if DistAdd >= 3000 then
						if Config.Repairs.ExtraDamages == true then
							local MechStatus = {
								["oil"] = (math.floor(VehicleStatus[plate]["oil"])+0.0 or 100),
								["axle"] = (math.floor(VehicleStatus[plate]["axle"])+0.0 or 100),
								["spark"] = (math.floor(VehicleStatus[plate]["spark"])+0.0 or 100),
								["battery"] = (math.floor(VehicleStatus[plate]["battery"])+0.0 or 100),
								["fuel"] = (math.floor(VehicleStatus[plate]["fuel"])+0.0 or 100),
								["oillevel"] = VehicleStatus[plate].oillevel,
								["shaftlevel"] = VehicleStatus[plate].shaftlevel,
								["cylinderlevel"] = VehicleStatus[plate].cylinderlevel,
								["cablelevel"] = VehicleStatus[plate].cablelevel,
								["fuellevel"] = VehicleStatus[plate].fuellevel,
								["harness"] = VehicleStatus[plate].harness or false,
								["antiLag"] = VehicleStatus[plate].antiLag or false,
							}
							TriggerServerEvent('jim-mechanic:server:saveStatus', MechStatus, plate)
						end
						TriggerServerEvent('jim-mechanic:server:UpdateDrivingDistance', plate, math.round(DistAdd))
						dist = tonumber(dist) + tonumber(DistAdd)
						DistAdd = 0 prevLoc = GetEntityCoords(veh)
					end
				else Wait(5000) end
				Wait(5000)
			end
		end)
		-- LOOP TO UPDATE ODOMETER WHILE DRIVING
		CreateThread(function()
			while inVehicle do
				if not IsVehicleStopped(veh) then
					-- Slip in damageEffects in odometer update loop
					if Config.Repairs.ExtraDamages == true then
						effectTimer += 1
						if effectTimer >= math.random(10, 15) then ApplyEffects(veh) effectTimer = 0 end
					end
				else
					damageTimer = 0
				end
				if ShowOdo and inVehicle then
					updateOdo(dist, veh, plate)
				else
					hideOdo()
					Wait(1000)
				end
				local wait = Config.System.Debug == true and 600 or 2000
				Wait((wait))
			end
		end)
		-- LOOP TO CHECK FOR CRASHES AND WETHER TO EJECT
		CreateThread(function()
			while inVehicle do
				isBike = IsThisModelABike(veh)
				SetPedHelmet(Ped, false)
				thisFrameSpeed = GetEntitySpeed(veh) * 3.6
				curVehBody = GetVehicleBodyHealth(veh)
				if curVehBody == 1000 and frameBodyChange ~= 0 then frameBodyChange = 0 end
				-- Work out wether should eject based on speed how much damage is done to the body at time of impact
				if frameBodyChange ~= 0 then
					if lastSpeed > 110 and thisFrameSpeed < (lastSpeed * 0.75) and not damagedone and not isBike and not HasHarness() then
						if frameBodyChange > 18.0 then
							if not seatBeltOn() then if math.random(math.ceil(lastSpeed)) > 60 then EjectFromVehicle(GetEntityVelocity(veh)) end
							else if lastSpeed > 150 then EjectFromVehicle(GetEntityVelocity(veh)) end end
						else
							if not seatBeltOn() then if math.random(math.ceil(lastSpeed)) > 60 then EjectFromVehicle(GetEntityVelocity(veh)) end
							else if lastSpeed > 120 then if math.random(math.ceil(lastSpeed)) > 200 then EjectFromVehicle(GetEntityVelocity(veh)) end end end
						end
							damagedone = true
							SetVehicleEngineOn(veh, false, true, true)
					end
					if curVehBody < 350.0 and not damagedone then damagedone = true SetVehicleEngineOn(veh, false, true, true) Wait(1000) end
				end
				if lastSpeed < 100 then Wait(100) tick = 0 end
				frameBodyChange = newVehBody - curVehBody
				if tick > 0 then tick -= 1
					if tick == 1 then lastSpeed = GetEntitySpeed(veh) * 3.6 end
				else
					if damagedone then damagedone = false frameBodyChange = 0 lastSpeed = GetEntitySpeed(veh) * 3.6 end
					lastSpeed2 = GetEntitySpeed(veh) * 3.6
					if lastSpeed2 > lastSpeed then lastSpeed = GetEntitySpeed(veh) * 3.6 end
					if lastSpeed2 < lastSpeed then tick = 25 end
				end
				if tick < 0 then tick = 0 end
				newVehBody = GetVehicleBodyHealth(veh)
				if not modifierDensity then modifierDensity = true end
				Wait(2)
			end
			SetPedHelmet(Ped, true)
			lastSpeed2, lastSpeed, newVehBody, curVehBody, frameBodyChange = 0, 0, 0, 0, 0
		end)
		-- Anitlag feature loop
		CreateThread(function()
			while inVehicle and VehicleStatus[plate].antiLag == 1 do
				if GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
					if GetVehicleCurrentGear(veh) ~= 0 then
						if not IsControlPressed(1, 71) and not IsControlPressed(1, 72) and not IsEntityInAir(veh) and not NitrousActivated and GetIsVehicleEngineRunning(veh) then
							if GetVehicleCurrentRpm(veh, Ped) > 0.75 then
								CreateThread(function()
									for sound = 1, math.random(1,3) do
										local vehPos = GetEntityCoords(veh)
										AddExplosion(vehPos.x, vehPos.y, vehPos.z, 61, 0.0, true, true, 0.0, true)
										Wait(100)
									end
								end)
								TriggerServerEvent('jim-mechanic:server:SyncFlame', VehToNet(veh), true, true)
								SetVehicleTurboPressure(veh, 25.0)
								Wait(math.random(100, 800))
								TriggerServerEvent('jim-mechanic:server:SyncFlame', VehToNet(veh), false, true)
								SetVehicleTurboPressure(veh, 0.0)
							end
						end
					end
				end
				Wait(10)
			end
		end)
	end
end)

RegisterNetEvent("jim-mechanic:ShowOdo", function() print("^3ShowOdo^7: ^2Odometer toggled^7") ShowOdo = not ShowOdo end)

local seatbeltOn, harnessOn, veloc, harnessProp = false, false, 0, nil
function destroyHarness() if DoesEntityExist(harnessProp) then DeleteEntity(harnessProp) harnessProp = nil end end -- function so this can be called in extras.lua

if Config.Overrides.HarnessControl == true then

	-- Functions
	function EjectFromVehicle(veloc) local Ped = PlayerPedId()
		local veh = GetVehiclePedIsIn(Ped, false)
		local coords = GetOffsetFromEntityInWorldCoords(veh, 1.0, 0.0, 1.0)
		SetEntityCoords(Ped, coords.x, coords.y, coords.z)
		SmashVehicleWindow(veh, 6)
		Wait(1)
		SetPedToRagdoll(Ped, 5511, 5511, 0, 0, 0, 0)
		SetEntityVelocity(Ped, (veloc.x * 2), (veloc.y * 2), (veloc.z * 2))
		--local ejectspeed = math.ceil(GetEntitySpeed(Ped) * 8)
		--if GetEntityHealth(Ped) - ejectspeed > 0 then SetEntityHealth(Ped, GetEntityHealth(Ped) - ejectspeed)
		--elseif GetEntityHealth(Ped) ~= 0 then SetEntityHealth(Ped, 0) end
	end

	local function SeatBeltLoop()
		CreateThread(function() local Ped = PlayerPedId()
			while IsPedInVehicle(Ped, GetVehiclePedIsIn(Ped, false)) and (seatbeltOn or harnessOn) do
				if IsControlJustPressed(0, 75) then
					seatbeltOn = false harnessOn = false destroyHarness()
				end
				Wait(4)
			end
			seatbeltOn = false
			harnessOn = false
			emptyHands(Ped)
			TriggerEvent("seatbelt:client:ToggleSeatbelt")
		end)
	end

	local function ToggleSeatbelt()
		seatbeltOn = not seatbeltOn
		SeatBeltLoop()
		TriggerEvent("seatbelt:client:ToggleSeatbelt")
		TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5.0, seatbeltOn and "carbuckle" or "carunbuckle", 0.25)
	end

	local inProgress = false
	local function ToggleHarness() local Ped = PlayerPedId()
		if inProgress == true then return end
			harnessProp = makeProp({prop = "idrp_racing_harness", coords = vec4(0,0,0,0)}, 1, 1)
		if not harnessOn then inProgress = true
			if progressBar({label = Loc[Config.Lan]["common"].harness, time = math.random(4000,7000), cancel = true, anim = "fixing_a_ped", dict = "mini@repair", flag = 16, icon = "harness",}) then
				if IsPedInAnyVehicle(Ped) then
					AttachEntityToEntity(harnessProp, Ped, GetPedBoneIndex(Ped, 24818), 0.02, -0.04, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
					harnessOn = true
					inProgress = false
					ToggleSeatbelt()
				else
					inProgress = false
					harnessOn = false
					emptyHands(Ped)
				end
			else
				inProgress = false
				harnessOn = false
				emptyHands(Ped)
			end
		else
			inProgress = false
			harnessOn = false
			emptyHands(Ped)
			ToggleSeatbelt()
		end
	end

	-- Exports
	function HasHarness() return harnessOn end
	function seatBeltOn() return seatbeltOn end
	exports("HasHarness", HasHarness)
	exports("seatBeltOn", seatBeltOn)

	-- Register Key
	RegisterCommand('toggleseatbelt', function() local plate local Ped = PlayerPedId()
		if IsPedInVehicle(Ped, GetVehiclePedIsIn(Ped, false)) then
			plate = trim(GetVehicleNumberPlateText(GetVehiclePedIsIn(Ped, false)))
			if not VehicleStatus[plate] then
				if Config.System.Debug then print("^5Debug^7: ^3EnteredVehicle^7: ^4VehicleStatus^7[^6"..plate.."^7]^2 not found^7,^2 loading^7...") end
				TriggerServerEvent("jim-mechanic:server:setupVehicleStatus", plate, GetVehicleEngineHealth(veh), GetVehicleBodyHealth(veh))
				Wait(3000)
			end
			if VehicleStatus[plate].harness == 1 then ToggleHarness() else ToggleSeatbelt() end
		end
	end, false)

	RegisterKeyMapping('toggleseatbelt', 'Toggle Seatbelt', 'keyboard', 'B')

end