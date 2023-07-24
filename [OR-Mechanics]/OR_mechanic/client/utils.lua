
QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

Citizen.CreateThread(function()
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = QBCore.Functions.GetPlayerData()
	if Config.Debug then
		Citizen.Wait(3000)
		TriggerServerEvent('t1ger_mechanicjob:debugSV')
	end
end)

AddStateBagChangeHandler('isLoggedIn', nil, function(bagName, key, value)
	if value then
		PlayerData = QBCore.Functions.GetPlayerData()
		TriggerServerEvent('t1ger_mechanicjob:setupMechanicShops')
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
	PlayerData.job = JobInfo
	for i = 1, #Config.MechanicShops do
		local mechanicJob = Config.Society[Config.MechanicShops[i].society].name
		if PlayerData.job.name == mechanicJob then
			TriggerEvent('t1ger_mechanicjob:setMechanicID', i)
			break
		else
			if i == #Config.MechanicShops then
				TriggerEvent('t1ger_mechanicjob:setMechanicID', 0)
				break
			end
		end
	end
end)

-- Notification
RegisterNetEvent('t1ger_mechanicjob:notify')
AddEventHandler('t1ger_mechanicjob:notify', function(msg)
	QBCore.Functions.Notify(msg)
end)

-- Advanced Notification
RegisterNetEvent('t1ger_mechanicjob:notifyAdvanced')
AddEventHandler('t1ger_mechanicjob:notifyAdvanced', function(sender, subject, msg, textureDict, iconType)
	AddTextEntry('t1ger_mechanicjobnotifyAdvanced', msg)
	BeginTextCommandThefeedPost('t1ger_mechanicjobnotifyAdvanced')
	EndTextCommandThefeedPostMessagetext(textureDict, textureDict, false, iconType, sender, subject)
	EndTextCommandThefeedPostTicker(false, false)
end)

-- Draw 3D Text:
function T1GER_DrawTxt(x, y, z, text)
	local boolean, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    SetTextScale(0.32, 0.32); SetTextFont(4); SetTextProportional(1)
    SetTextColour(255, 255, 255, 255)
    SetTextEntry("STRING"); SetTextCentre(1); AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text) / 500)
    DrawRect(_x, (_y + 0.0125), (0.015 + factor), 0.03, 0, 0, 0, 80)
end

-- Draw 3D Text 2:
function T1GER_DrawTxt2(x,y,z, text)
	local boolean, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local scale = (1/dist)*2
	local fov = (1/GetGameplayCamFov())*100
	local scale = scale*fov
	if boolean then
		SetTextScale(0.1*scale, 0.30*scale)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextDropshadow(0, 0, 0, 0, 255)
		SetTextEdge(2, 0, 0, 0, 150)
		SetTextDropShadow()
		SetTextOutline()
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
		DrawText(_x,_y)
	end
end

function T1GER_GetControlOfEntity(entity)
	local netTime = 25
	NetworkRequestControlOfEntity(entity)
	while not NetworkHasControlOfEntity(entity) and netTime > 0 do
		NetworkRequestControlOfEntity(entity)
		Citizen.Wait(100)
		netTime = (netTime - 1)
	end
end

function T1GER_RequestModel(modelHash, cb)
	modelHash = (type(modelHash) == 'number' and modelHash or GetHashKey(modelHash))

	if not HasModelLoaded(modelHash) and IsModelInCdimage(modelHash) then
		RequestModel(modelHash)

		while not HasModelLoaded(modelHash) do
			Wait(0)
		end
	end

	if cb ~= nil then
		cb()
	end
end

function T1GER_SpawnObject(object, coords, cb, networked)
	local model = type(object) == 'number' and object or GetHashKey(object)
	local vector = type(coords) == "vector3" and coords or vec(coords.x, coords.y, coords.z)
	networked = networked == nil and true or networked

	CreateThread(function()
		T1GER_RequestModel(model)

		local obj = CreateObject(model, vector.xyz, networked, false, true)
		if cb then
			cb(obj)
		end
	end)
end

function T1GER_ProgressBar()

end

-- Load Anim
function T1GER_LoadAnim(animDict)
	RequestAnimDict(animDict); while not HasAnimDictLoaded(animDict) do Citizen.Wait(1) end
end

-- Load Model
function T1GER_LoadModel(model)
	RequestModel(model); while not HasModelLoaded(model) do Citizen.Wait(1) end
end

-- Load Ptfx
function T1GER_LoadPtfxAsset(dict)
	RequestNamedPtfxAsset(dict); while not HasNamedPtfxAssetLoaded(dict) do Citizen.Wait(1) end
end

function T1GER_isJob(name)
	if not PlayerData then return false end
	if not PlayerData.job then return false end
	if PlayerData.job.name == name then
		return true
	end
	return false
end

function T1GER_GetJob(table)
	if not PlayerData then return false end
	if not PlayerData.job then return false end
	for k,v in pairs(table) do
		if PlayerData.job.name == v then
			return true
		end
	end
	return false
end

-- Function for Mission text:
function DrawMissionText(text)
    SetTextScale(0.5, 0.5)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(0.5,0.955)
end

-- Round function
function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

-- Comma function
function comma_value(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

-- Draw Rect:
function drawRct(x, y, width, height, r, g, b, a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

