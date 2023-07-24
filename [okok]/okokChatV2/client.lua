local players = {}

exports('Message', function(background, color, icon, title, playername, message, target, image)
	TriggerServerEvent('okokChat:ServerMessage', background, color, icon, title, playername, message, target, image)
end)

AddEventHandler('playerSpawned', function()
    TriggerServerEvent('okokChat:onPlayerSpawn')
end)

RegisterNetEvent("okokChat:getAllPlayers")
AddEventHandler("okokChat:getAllPlayers", function()
	local coords = GetEntityCoords(PlayerPedId())
	local closePlayers = {}
	local allPlayers = GetActivePlayers()
	local playerCount = 1
	local pedID = PlayerPedId()

	for i = 1, #allPlayers do
		local playerId = allPlayers[i]
		local playerPed = GetPlayerPed(playerId)
		local playerCoords = GetEntityCoords(playerPed)

		table.insert(closePlayers, GetPlayerServerId(playerId))
		playerCount += 1
	end

	TriggerServerEvent("okokChat:SetClosePlayers", closePlayers)
end)

RegisterNetEvent("okokChat:checkDeathStatus")
AddEventHandler("okokChat:checkDeathStatus", function()
	local ped = GetPlayerPed(-1)
	TriggerServerEvent('okokChat:deathStatus', IsEntityDead(ped))
end)

RegisterNetEvent("okokChat:Notification")
AddEventHandler("okokChat:Notification", function(info, text)
	exports['okokNotify']:Alert(info.title, text, info.time, info.type)
end)

liczba = 0

RegisterNetEvent("okokChat:me2")
AddEventHandler("okokChat:me2", function(text, source, icon)

    local playerId = GetPlayerFromServerId(source)
    if playerId ~= -1 or source == GetPlayerServerId(PlayerId()) then
        local isDisplaying = true
        liczba = liczba + 1
        --if icon == nil then icon = 'icons' end
        icon = 'comment-dots'
        Citizen.CreateThread(function()
            while isDisplaying do
                Citizen.Wait(0)
                local htmlString = ""
                local sourceCoords = GetEntityCoords(GetPlayerPed(playerId))
                local nearCoords = GetEntityCoords(PlayerPedId())
                local distance = Vdist2(sourceCoords, nearCoords)

                if distance < 25.0 then
                    local onScreen, xxx, yyy =
                        GetHudScreenPositionFromWorldPosition(
                            sourceCoords.x + Config.CoordsX,
                            sourceCoords.y + Config.CoordsY,
                            sourceCoords.z + Config.CoordsZ)
                    htmlString =
                        htmlString ..
                        '<span style="position: absolute; left: ' ..
                            xxx * 80 ..
                            "%;top: " .. yyy * 100 .. '%;"><div class="me-container"><div class="icon-container"><span style="color:#cb73e6;"><i class="fas fa-'..icon..' fa-lg  "></i></span></div><div class="text-container"><b>ME: </b>' .. text .. "</div></div></span>"
                end
                if lasthtmlString ~= htmlString then
                            SendNUIMessage({
                                toggle = true,
                                typ ="me",
                                html = htmlString
                            })
                            lasthtmlString = htmlString
                end
            end
            if isDisplaying == false then
                SendNUIMessage({toggle = false,typ ="me"})
            end
        end)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Duration)
            liczba = liczba -1
            isDisplaying = false
            SendNUIMessage({toggle = false,typ ="me"})
        end)
    end
end)

RegisterNetEvent("okokChat:do2")
    AddEventHandler("okokChat:do2", function(text, source, icon)
        local playerId = GetPlayerFromServerId(source)
        if playerId ~= -1 or source == GetPlayerServerId(PlayerId()) then
            local isDisplaying = true
            liczba = liczba + 1
            --if icon == nil then icon = 'icons' end
            icon = 'user'
            Citizen.CreateThread(function()
                while isDisplaying do
                    Citizen.Wait(0)
                    local htmlString = ""
                    local sourceCoords = GetEntityCoords(GetPlayerPed(playerId))
                    local nearCoords = GetEntityCoords(PlayerPedId())
                    local distance = Vdist2(sourceCoords, nearCoords)
                    if distance < 25.0 then
                        local onScreen, xxx, yyy =
                            GetHudScreenPositionFromWorldPosition(
                                sourceCoords.x + Config.DoCoordsX,
                                sourceCoords.y + Config.DoCoordsY,
                                sourceCoords.z + Config.DoCoordsZ)
                        htmlString =
                            htmlString ..
                            '<span style="position: absolute; left: ' ..
                            xxx * 100 ..
                            "%;top: " .. yyy * 100 .. '%;"><div class="do-container"><div class="icon-container"><span style="color: #4d66f1;"><i class="fas fa-'..icon..' fa-lg  "></i></span></div><div class="text-container"><b>DO: </b>' .. text .. "</div></div></span>"
                    end
                    if lasthtmlString ~= htmlString then

                                SendNUIMessage({
                                    toggle = true,
                                    typ ="do",
                                    html = htmlString
                                })
                                lasthtmlString = htmlString
                    end
                end
                if isDisplaying == false then
                    SendNUIMessage({toggle = false, typ ="do"})
                end
            end)
            Citizen.CreateThread(function()
                Citizen.Wait(Config.Duration)
                liczba = liczba -1
                isDisplaying = false
                SendNUIMessage({toggle = false, typ ="do"})
            end)
        end
end)



local doActive = false
local pedDisplaying2 = {}


Citizen.CreateThread(function()

	if Config.JobChat then
		TriggerEvent('chat:addSuggestion', '/'..Config.JobCommand, 'JOB message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableOOC then
		TriggerEvent('chat:addSuggestion', '/'..Config.OOCCommand, 'OOC message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.AllowPlayersToClearTheirChat then
		TriggerEvent('chat:addSuggestion', '/'..Config.ClearChatCommand, 'Clear chat', {})
	end

	if Config.EnableHideChat then
		TriggerEvent('chat:addSuggestion', '/'..Config.HideChatCommand, 'Hide chat', {})
	end

	if Config.EnableStaffCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.StaffCommand, 'Send a message as staff', {
			{ name="message", help="message to send" },
		})
	end

	if Config.AllowStaffsToClearEveryonesChat then
		TriggerEvent('chat:addSuggestion', '/'..Config.ClearEveryonesChatCommand, "Clear everyone's chat", {})
	end

	if Config.EnableStaffOnlyCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.StaffOnlyCommand, 'Staff only chat', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableAdvertisementCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.AdvertisementCommand, 'Make an advertisement', {
			{ name="ad", help="advertisement message" },
		})
	end

	if Config.EnableAnonymousCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.AnonymousCommand, 'Send an anonymous message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableTwitchCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.TwitchCommand, 'Twitch message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableYoutubeCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.YoutubeCommand, 'YouTube message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableTwitterCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.TwitterCommand, 'Twitter message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnablePoliceCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.PoliceCommand, 'Police message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.EnableAmbulanceCommand then
		TriggerEvent('chat:addSuggestion', '/'..Config.AmbulanceCommand, 'Ambulance message', {
			{ name="message", help="message to send" },
		})
	end

	if Config.TimeOutPlayers then
		TriggerEvent('chat:addSuggestion', '/'..Config.TimeOutCommand, 'Mute player', {
			{ name="id", help="id of the player to mute" },
			{ name="time", help="time in minutes" }
		})

		TriggerEvent('chat:addSuggestion', '/'..Config.RemoveTimeOutCommand, 'Unmute player', {
			{ name="id", help="id of the player to unmute" }
		})
	end

		local strin = ""

		while true do
			local currentTime, html = GetGameTimer(), ""
			for k, v in pairs(pedDisplaying2) do
				local player = GetPlayerFromServerId(k)
				if NetworkIsPlayerActive(player) then
					local sourcePed, targetPed = GetPlayerPed(player), PlayerPedId()
					local sourceCoords, targetCoords = GetEntityCoords(sourcePed), GetEntityCoords(targetPed)
					local pedCoords = GetPedBoneCoords(sourcePed, 0x2e28, 0.0, 0.0, 0.0)

					if player == source or #(sourceCoords - targetCoords) < 25 then
						if v.type == "dofijo" then
							local onScreen, xxx, yyy = GetHudScreenPositionFromWorldPosition(pedCoords.x, pedCoords.y, pedCoords.z + 1.1)
							if not onScreen then
							   html = html ..
							   '<span style="position: fixed; left: ' ..
							xxx * 100 ..
							"%;top: " .. yyy * 80 .. '%;"><div class="dofijo-container"><span style="color: #4d66f1;"></span><div class="text-container"><b>DO-FIJO: </b>' .. v.msg .. "</div></div></span>"
							end
						end
					end
				end
				if v.time <= currentTime then
					pedDisplaying2[k] = nil
				end
			end

			if strin ~= html then
				SendNUIMessage({
					type = "txt",
					typ ="dofijo",
					html = html
				})
				strin = html
        end
		Wait(0)
    end
end)



RegisterNetEvent("okokChat:triggerDisplay")
AddEventHandler("okokChat:triggerDisplay", function(playerId, message, typ)

	if typ == "dofijo" then
       -- if not doActive then
            doActive = true
            pedDisplaying2[tonumber(playerId)] = {type = typ, msg = message, time = math.huge}
        --end
    end
end)

RegisterNetEvent("okokChat:triggerDoOff")
AddEventHandler("okokChat:triggerDoOff", function(playerId, message, typ)
    doActive = false
	pedDisplaying2[tonumber(playerId)] = {type = typ, msg = message, time = 0}
end)