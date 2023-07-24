local FlashlightEnabled = false
local lastWeapon = nil

local ActiveFlashlights = {}
local FlashlightsHashes = {
	COMPONENT_AT_AR_FLSH = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_M45A1_FLSH_01 = {
		vector3(0.28, 0.04, 0.0),
		vector3(1.0, -0.12, 0.03)
	},
	COMPONENT_G17_FLASH_01 = {
		vector3(0.28, 0.04, 0.0),
		vector3(1.0, -0.12, 0.03)
	},
	COMPONENT_G17_FLASH_02 = {
		vector3(0.28, 0.04, 0.0),
		vector3(1.0, -0.12, 0.03)
	},
	COMPONENT_G17_FLASH_03 = {
		vector3(0.28, 0.04, 0.0),
		vector3(1.0, -0.12, 0.03)
	},
	COMPONENT_G17_FLASH_04 = {
		vector3(0.28, 0.04, 0.0),
		vector3(1.0, -0.12, 0.03)
	},
	COMPONENT_AT_PI_FLSH = {
		vector3(0.28, 0.04, 0.0),
		vector3(1.0, -0.12, 0.03)
	},
	COMPONENT_AT_PI_FLSH_02 = {
		vector3(0.28, 0.04, 0.0),
		vector3(1.0, -0.135, 0.03)
	},
	COMPONENT_AT_PI_FLSH_03 = {
		vector3(0.28, 0.04, 0.0),
		vector3(1.0, -0.135, 0.03)
	},
	COMPONENT_AT_fbiarb_FLSH = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_AT_mk18b_FLSH = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_PP19_LASER_01 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_PP19_LASER_02 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_PP19_LASER_03 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_PP19_LASER_04 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_PP19_LASER_05 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_PP19_LASER_06 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_PP19_LASER_07 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},

	COMPONENT_MARKOMODS_NSR9_ACCS_01 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_MARKOMODS_NSR9_ACCS_02 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_MARKOMODS_NSR9_ACCS_03 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_MARKOMODS_NSR9_ACCS_04 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},
	COMPONENT_MARKOMODS_NSR9_ACCS_05 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
		},

	COMPONENT_MPX_FLSH_01 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},

	COMPONENT_MPX_FLSH_02 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MPX_FLSH_03 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MPX_FLSH_04 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MPX_FLSH_05 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MPX_FLSH_06 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MPX_FLSH_07 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MPX_FLSH_08 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},

	COMPONENT_MARKOMODSM4_FLASH_01 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MARKOMODSM4_FLASH_02 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MARKOMODSM4_FLASH_03 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MARKOMODSM4_FLASH_04 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MARKOMODSM4_FLASH_05 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MARKOMODSM4_FLASH_06 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MARKOMODSM4_FLASH_07 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MARKOMODSM4_FLASH_08 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},

	COMPONENT_MK18_FLASH_01 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MK18_FLASH_02 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MK18_FLASH_03 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MK18_FLASH_04 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MK18_FLASH_05 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MK18_FLASH_06 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	},
	COMPONENT_MK18_FLASH_07 = {
		vector3(0.5, 0.03, 0.05),
		vector3(1.0, -0.16, 0.145)
	}

	






		

		


}

AddEventHandler('playerSpawned', function ()
	TriggerServerEvent('pf:ToggleFlashLight', false)
	FlashlightEnabled = false
	lastWeapon = nil
end)

RegisterNetEvent('pf:UpdateFlashLights')
AddEventHandler('pf:UpdateFlashLights', function(FlashLights)
	ActiveFlashlights = FlashLights
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local PlayerPed = PlayerPedId()
		if IsPedArmed(PlayerPed, 4) and not IsPedInAnyVehicle(PlayerPed, true) then
			local PedWeapon = GetSelectedPedWeapon(PlayerPed)
			if lastWeapon ~= PedWeapon then
				lastWeapon = PedWeapon
				FlashlightEnabled = false
				TriggerServerEvent('pf:ToggleFlashLight', false)
			end
			local currentFlashLight = nil
			for Flashlight, _ in pairs(FlashlightsHashes) do
				if HasPedGotWeaponComponent(PlayerPed, PedWeapon, GetHashKey(Flashlight)) then
					currentFlashLight = Flashlight
				end
			end
			if currentFlashLight then
				DisableControlAction(0, 54, true)
				if IsDisabledControlJustPressed(0, 54) then
					FlashlightEnabled = not FlashlightEnabled
					TriggerServerEvent('pf:ToggleFlashLight', FlashlightEnabled, currentFlashLight, PedWeapon)
					PlaySoundFrontend(-1, 'COMPUTERS_MOUSE_CLICK', 0, 1)
				end
			else
				if FlashlightEnabled then
					FlashlightEnabled = false
					TriggerServerEvent('pf:ToggleFlashLight', false)
				end
			end
		else
			if FlashlightEnabled then
				FlashlightEnabled = false
				TriggerServerEvent('pf:ToggleFlashLight', false)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		for source, flashLightData in pairs(ActiveFlashlights) do
			local FlashlightHash = flashLightData[1]
			local WeaponHash = flashLightData[2]

			if source then
				local sourceP = GetPlayerFromServerId(source)
				if sourceP then
					local playerPed = GetPlayerPed(sourceP)
					if playerPed then
						if GetSelectedPedWeapon(playerPed) == WeaponHash then
							local FlashlightVectors = FlashlightsHashes[FlashlightHash]
							local FlashlightPosition = GetPedBoneCoords(playerPed, 0xDEAD, FlashlightVectors[1])
							local FlashlightDirection = GetPedBoneCoords(playerPed, 0xDEAD, FlashlightVectors[2])
							local DirectionVector = FlashlightDirection - FlashlightPosition
							local VectorMagnitude = Vmag2(DirectionVector)
							local FlashlightEndPosition = vector3(
								DirectionVector.x / VectorMagnitude,
								DirectionVector.y / VectorMagnitude,
								DirectionVector.z / VectorMagnitude
							)

							DrawSpotLight(FlashlightPosition, FlashlightEndPosition, 255, 255, 255, 40.0, 2.0, 2.0, 10.0, 15.0)
						end
					end
				end
			end
		end
	end
end)