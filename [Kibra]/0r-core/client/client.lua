R = {}
R.PlayerData = {}
R.CurrentRequestId = 0
R.ServerCallbacks = {}
R.UI = {}
R.Notify = {}

QBCore = exports['qb-core']:GetCoreObject()


AddEventHandler('0r-core:getSharedObject', function(cb)
	cb(R)
end)

exports("Get0RCore", function()
	return R
end)

exports("GetFramework", function()
	return Config.Framework
end)

function getSharedObject()
	return R
end

function R.UI.Show(button, text)
	SendNUIMessage{
        type = "ShowUI",
        text = text, 
        control = button,
    }
end

function R.UI.Hide()
    SendNUIMessage({
        type = "Hide"
    })
end

RegisterNetEvent('qb-spawn:client:openUI', function()
	TriggerServerEvent('0r-core:onPlayerJoined')
end)

AddEventHandler('onResourceStart', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
	TriggerServerEvent('0r-core:onPlayerJoined')
end)

RegisterNetEvent("0r-core:setPlayerData")
AddEventHandler("0r-core:setPlayerData", function(PlayerData)
    R.PlayerData = PlayerData
end)

RegisterNetEvent(Config.events["playerLoaded"][Config.Framework])
AddEventHandler(Config.events["playerLoaded"][Config.Framework], function()
   TriggerServerEvent('0r-core:onPlayerJoined')
end)

RegisterNetEvent(Config.events["updateJob"][Config.Framework])
AddEventHandler(Config.events["updateJob"][Config.Framework], function(job)
    R.PlayerData.job = job
    TriggerServerEvent("0r-core:setJob", job)
end)

RegisterNetEvent('0r-core:serverCallback')
AddEventHandler('0r-core:serverCallback', function(requestId, ...)
	R.ServerCallbacks[requestId](...)
	R.ServerCallbacks[requestId] = nil
end)

R.GetPlayerData = function()
	return QBCore.Functions.GetPlayerData()
end

function R.Notify(type, text)
    print("r.notify de Rcore", Shared.Notify,"type: ", type)


	if Shared.Notify == "default" then
            if type == "success" then type = "SUCCESS" end 
		    if type == "error" then type = "ERROR" end
            QBCore.Functions.Notify(text, type, 5000)

	elseif Shared.Notify == "okok" then
        type = "success" 
		if type == "success" then type = "SUCCESS" end 
		if type == "error" then type = "ERROR" end
		exports['okokNotify']:Alert(text, type)
	end
end

R.GetPlayerMoney = function(cash)
        if cash == "cash" then
            return QBCore.Functions.GetPlayerData().money["cash"]
        else
            return QBCore.Functions.GetPlayerData().money["bank"]
        end
end




R.DrawText3D = function(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.3, 0.3)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 245)

    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 410
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 133)
end

R.GetIdentifier = function()
     return QBCore.Functions.GetPlayerData().citizenid
end

R.TriggerServerCallback = function(name, cb, ...)
	R.ServerCallbacks[R.CurrentRequestId] = cb

	TriggerServerEvent('0r-core:triggerServerCallback', name, R.CurrentRequestId, ...)

	if R.CurrentRequestId < 65535 then
		R.CurrentRequestId = R.CurrentRequestId + 1
	else
		R.CurrentRequestId = 0
	end
end




R.GetClosestPlayer = function(coords)
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    local closestPlayers = R.GetPlayersFromCoords(coords)
    local closestDistance = -1
    local closestPlayer = -1
    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() and closestPlayers[i] ~= -1 then
            local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end

R.GetPlayersFromCoords = function(coords, distance)
    local players = GetActivePlayers()
    local ped = PlayerPedId()
    if coords then
        coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
    else
        coords = GetEntityCoords(ped)
    end
    distance = distance or 5
    local closePlayers = {}
    for _, player in pairs(players) do
        local target = GetPlayerPed(player)
        local targetCoords = GetEntityCoords(target)
        local targetdistance = #(targetCoords - coords)
        if targetdistance <= distance then
            closePlayers[#closePlayers + 1] = player
        end
    end
    return closePlayers
end
