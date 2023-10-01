if Shared.Framework == "qbcore" then
	Framework = exports["qb-core"]:GetCoreObject()
elseif Shared.Framework == "esx" then
	if ESX == nil then
		Citizen.CreateThread(function()
			while Framework == nil do
				TriggerEvent("esx:getSharedObject", function(obj)
					Framework = obj
				end)
				Wait(100)
			end
		end)
	else
		Framework = ESX
	end
end

if Shared.Framework == "standalone" then
	RegisterNetEvent("zerio-radio:client:showNotification", function(msg)
		BeginTextCommandThefeedPost("STRING")
		AddTextComponentString(msg)
		DrawNotification(false, true)
	end)
end

Functions = {
	GetPlayerData = function()
		local plrdata = {}
		if Shared.Framework == "qbcore" then
			plrdata = Framework.Functions.GetPlayerData()
		elseif Shared.Framework == "esx" then
			plrdata = Framework.GetPlayerData()
		end
		return plrdata
	end,

	LeaveRadio = function()
		if GetResourceState("pma-voice") == "started" then
			exports["pma-voice"]:setVoiceProperty("radioEnabled", false)
			exports["pma-voice"]:setRadioChannel(0)
		elseif GetResourceState("mumble-voip") == "started" then
			exports["mumble-voip"]:SetRadioChannel(0)
		elseif GetResourceState("tokovoip_script") == "started" then
			exports["tokovoip_script"]:removePlayerFromRadio(CurrentFrequency)
		elseif GetResourceState("saltychat") == "started" then
			exports["saltychat"]:SetRadioChannel(nil, true)
		end
	end,

	UpdateRadioVolume = function(newVolume)
		if GetResourceState("pma-voice") == "started" then
			exports["pma-voice"]:setRadioVolume(newVolume)
		elseif GetResourceState("tokovoip_script") == "started" then
			exports["tokovoip_script"]:setRadioVolume(newVolume)
		elseif GetResourceState("saltychat") == "started" then
			exports["saltychat"]:SetRadioVolume(newVolume / 100)
		end
	end,

	GetStatus = function()
		local ped = PlayerPedId()

		if ped then
			if IsPedInAnyVehicle(ped, false) then
				return _U("inVehicle")
			else
				return _U("onFoot")
			end
		else
			return _U("unknown")
		end
	end,

	GetRadioChannel = function()
		local id = PlayerId()

		if id then
			if GetResourceState("pma-voice") == "started" then
				CurrentFrequency = tonumber(Player(-1).state.radioChannel)
			elseif GetResourceState("mumble-voip") == "started" then
				local freq = exports["mumble-voip"]:GetPlayerRadioChannel(GetPlayerServerId(id))

				if freq then
					CurrentFrequency = tonumber(freq)
				end
			elseif GetResourceState("tokovoip_script") == "started" then
				CurrentFrequency = exports["tokovoip_script"]:getPlayerData(GetPlayerServerId(id), "radio:channel")
			elseif GetResourceState("saltychat") == "started" then
				CurrentFrequency = exports["saltychat"]:GetRadioChannel(true)
			end
		end
	end,

	ChangeRadioChannel = function(freq)
		if GetResourceState("pma-voice") == "started" then
			exports["pma-voice"]:setVoiceProperty("radioEnabled", true)
			exports["pma-voice"]:setRadioChannel(freq)
		elseif GetResourceState("mumble-voip") == "started" then
			exports["mumble-voip"]:SetRadioChannel(freq)
		elseif GetResourceState("tokovoip_script") == "started" then
			exports["tokovoip_script"]:addPlayerToRadio(freq, true)
		elseif GetResourceState("saltychat") == "started" then
			exports["saltychat"]:SetRadioChannel(tostring(freq), true)
		end
	end,

	Notify = function(name, type)
		if Shared.Framework == "qbcore" then
			Framework.Functions.Notify(name, type)
		elseif Shared.Framework == "esx" then
			Framework.ShowNotification(name, type)
		elseif Shared.Framework == "standalone" then
			-- ADD YOUR CUSTOM CODE HERE
		end
	end,

	GetStreetName = function(pos)
		local s1, s2 = Citizen.InvokeNative(
			0x2EB41072B4C1E4C0,
			pos.x,
			pos.y,
			pos.z,
			Citizen.PointerValueInt(),
			Citizen.PointerValueInt()
		)

		local street1 = GetStreetNameFromHashKey(s1)
		local street2 = GetStreetNameFromHashKey(s2)
		local streetLabel = street1
		if street2 ~= nil then
			streetLabel = streetLabel .. " " .. street2
		end

		return streetLabel
	end,

	PanicButton = function()
		local ped = PlayerPedId()
		if ped then
			local coords = GetEntityCoords(ped)

			-- SOUND
			if Shared.PanicButtonSound.Enabled == true then
				if GetResourceState("high_3dsounds") == "started" then
					local sound = exports["high_3dsounds"]:Play3DEntity(NetworkGetNetworkIdFromEntity(ped), 20.0, Shared.PanicButtonSound.Name, 1.0, true)

					CreateThread(function()
						Wait(Shared.PanicButtonSound.Duration * 1000)
						sound.destroy()
					end)
				elseif GetResourceState("sounity") == "started" then
					TriggerServerEvent("zerio-radio:server:playSounitySound")
				end
			end

			-- DISPATCH
			if GetResourceState("zerio-dispatch") == "started" then
				TriggerServerEvent("zerio-dispatch:server:addAlert", -1, {
					blipId = 161,
					position = { coords.x, coords.y, coords.z },
					sound = "adddispatch.mp3",
					description = _U("panic_alert_description"),
					top = {
						text = _U("panic_alert_header"),
						code = "10-22",
					},
					fields = {
						{
							text = Functions.GetStreetName(coords),
							icon = "mdi-earth",
						},
					},
				})
			elseif GetResourceState("ps-dispatch") == "started" then
				TriggerServerEvent("dispatch:server:notify", {
					dispatchcodename = "susactivity",
					dispatchCode = "10-90",
					firstStreet = Functions.GetStreetName(coords),
					gender = "unknown",
					priority = 2,
					origin = {
						x = coords.x,
						y = coords.y,
						z = coords.z,
					},
					dispatchMessage = _U("panic_alert_header"),
					job = { "police" },
				})
			end
		end
	end,

	OpenScanner = function()
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = "openScanner",
		})
		SendNUIMessage({
			action = "updateData",
			data = {
				streetLabel = "",

				radioFrequency = CurrentFrequency,
				radioLabel = "",

				translations = Locales[Shared.Locale].ui,

				status = "",

				voiceScript = Shared.VoiceScript,
			},
		})
	end,

	Open = function()
		local ped = PlayerPedId()

		if ped then
			if Shared.DisconnectInWater ~= true or IsEntityInWater(ped) == false then
				LoadSettings()
				TriggerServerEvent("zerio-radio:server:fetchNewestReceivedMessage")

				if IsOpen == false then
					local plrData = Functions.GetPlayerData()

					if
						plrData
						and (
							GetEntityHealth(ped) > 0
							or (Shared.Framework == "qbcore" and plrData.metadata.isdead ~= true)
						)
					then
						local coords = GetEntityCoords(ped)
						RequestModel(Animation.OpenProp)

						local counter = 0
						while not HasModelLoaded(Animation.OpenProp) do
							counter = counter + 1

							if counter >= 50 then
								warn("Could not load OpenProp in time, is the model invalid?")
								break
							end

							Wait(100)
						end

						if HasModelLoaded(Animation.OpenProp) ~= false then
							Handle = CreateObject(Animation.OpenProp, coords.x, coords.y, coords.z, true, true, false)

							local bone = GetPedBoneIndex(ped, Animation.OpenBone)
							local hashKey = GetHashKey("weapon_unarmed")

							if bone and hashKey then
								SetCurrentPedWeapon(ped, hashKey, true)
								AttachEntityToEntity(
									Handle,
									ped,
									bone,
									Animation.OpenOffset.x,
									Animation.OpenOffset.y,
									Animation.OpenOffset.z,
									Animation.OpenRotation.x,
									Animation.OpenRotation.y,
									Animation.OpenRotation.z,
									true,
									false,
									false,
									false,
									2,
									true
								)

								SetModelAsNoLongerNeeded(Handle)
							end
						end

						IsOpen = true
						StartDataLoop()
						if Settings.value.useMouse == true then
							SetNuiFocus(true, true)
						end
						SendNUIMessage({
							action = "open",
							data = {
								ShowPlayerList = Shared.ShowPlayerList,
								DisableAnonymous = Shared.DisableAnonymous,
								EnablePanicButton = Shared.EnablePanicButton,
								AllowCallSigns = Shared.AllowCallSigns,
								Debug = Shared.Debug
							},
						})
					else
						Functions.Notify(_U("player_dead"))
					end
				end
			else
				Functions.Notify(_U("in_water"))
			end
		end
	end,
}

Animation = {
	OpenProp = GetHashKey("zerio_radio"),
	OpenBone = 28422,
	OpenOffset = vector3(0.0, 0.0, 0.0),
	OpenRotation = vector3(90.0, 90.0, 0.0),

	-- TalkProp = GetHashKey('prop_cs_hand_radio'),
	-- TalkBone = 28422,
	-- TalkOffset = vector3(0.0, 0.0, 0.0),
	-- TalkRotation = vector3(0.0, 0.0, 0.0),

	OpenDictionary = {
		normal = "cellphone@",
		in_car = "cellphone@in_car@ds",
	},

	OpenAnimation = {
		open = "cellphone_text_in",
		closed = "cellphone_text_out",
	},

	TalkDictionary = "random@arrests",
	TalkAnimation = "generic_radio_chatter",
}

if Shared.OpenType.Value == "custom" or Shared.OpenType.Value == "item" then
	RegisterNetEvent("zerio-radio:client:open", Functions.Open)
	exports("Open", Functions.Open)
end

if Shared.Scanner.OpenType == "custom" or Shared.Scanner.OpenType == "item" then
	RegisterNetEvent("zerio-radio:client:openscanner", Functions.OpenScanner)
	exports("OpenScanner", Functions.OpenScanner)
end
