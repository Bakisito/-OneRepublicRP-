local currentPaperProp = nil

RegisterNetEvent('paper:client:OpenBook')
AddEventHandler('paper:client:OpenBook', function(book)
	OpenBook(book)
end)

function OpenBook(name)
	if Config.UseAnimations then
		if not currentPaperProp then
			currentPaperProp = CreateObject(GetHashKey("prop_cs_newspaper"), 0, 0, 0, true, true, true)
			local playerPed = PlayerPedId()
			RequestAnimDict("missfam4")
			while not HasAnimDictLoaded("missfam4") do 
				Citizen.Wait(5) 
			end
			--Animation similar to clip board
			TaskPlayAnim(playerPed, "missfam4", "base", 4.0, 4.0, -1, 49, 0.0, false, false, false)
			Citizen.Wait(200)
			AttachEntityToEntity(currentPaperProp, playerPed, GetPedBoneIndex(playerPed, 36029), 0.173, -0.03, 0.41, -20.0, -70.0, 0.0, true, true, false, true, 1, true)
		end
	end
    SendNUIMessage({
        action = "open",
		book = name
    })
    SetNuiFocus(true, true)
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
	if Config.UseAnimations then
		if currentPaperProp then
			ClearPedTasks(PlayerPedId())
			DeleteObject(currentPaperProp)
			currentPaperProp = nil
		end
	end
end)
