


local shot = false
local check = false
local check2 = false
local count = 0

Citizen.CreateThread(function()
	while true do
		
		Citizen.Wait( 1 )
		if IsPlayerFreeAiming(PlayerId()) then
		    if GetFollowPedCamViewMode() == 4 and check == false then
			    check = false
			else
			    SetCamViewModeForContext(0, 4)
				--SetCamViewModeForContext(1, 4)
				SetCamViewModeForContext(2, 4)
				SetCamViewModeForContext(3, 4)
				SetCamViewModeForContext(6, 4)
			    check = true
			end
		else
		    if check == true then
		        SetCamViewModeForContext(0, 1)
				--SetCamViewModeForContext(1, 1)
				SetCamViewModeForContext(2, 1)
				SetCamViewModeForContext(3, 1)
				SetCamViewModeForContext(6, 1)
				check = false
			end
		end
	end
end )



Citizen.CreateThread(function()
	while true do
		
		Citizen.Wait( 1 )
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == false and GetFollowPedCamViewMode() ~= 4 then
			check2 = true
			shot = true
			SetCamViewModeForContext(0, 4)
				--SetCamViewModeForContext(1, 4)
				SetCamViewModeForContext(2, 4)
				SetCamViewModeForContext(3, 4)
				SetCamViewModeForContext(6, 4)
		end
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == true and GetFollowPedCamViewMode() == 4 then
			count = 0
		end

		if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
		    count = count + 1
		end

        if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
			if not IsPedShooting(GetPlayerPed(-1)) and shot == true and count > 20 then
		        if check2 == true then
				    check2 = false
					shot = false
					SetCamViewModeForContext(0, 1)
				--SetCamViewModeForContext(1, 1)
				SetCamViewModeForContext(2, 1)
				SetCamViewModeForContext(3, 1)
				SetCamViewModeForContext(6, 1)
				end
			end
		end	    
	end
end )
