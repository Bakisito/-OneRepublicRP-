ESX, QBCore = nil, nil

if Config.Framework == "esx" then
	ESX = exports.es_extended:getSharedObject()
elseif Config.Framework == "qbcore" then
	QBCore = exports["qb-core"]:GetCoreObject()
end

RegisterCommand(Config.Cmd, function(source, args, rawCommand) 
	if Config.Framework == "esx" then
		local _source = source
		local xPlayer = ESX.GetPlayerFromId(_source)
		local playerGroup = xPlayer.getGroup()

		for k,v in ipairs(Config.AdminGroups) do
			if playerGroup == v then
				TriggerClientEvent('okokDelVehicles:delete', -1)
				break
			end
		end
	elseif Config.Framework == "qbcore" then
		local _source = source
		if Config.QBUsePermissionsUpdate then
			for k,v in ipairs(Config.AdminGroups) do
				if QBCore.Functions.HasPermission(_source, v) then
					TriggerClientEvent('okokDelVehicles:delete', -1)
					break
				end
			end
		else
			local playerGroup = QBCore.Functions.GetPermission(_source)

			for k,v in ipairs(Config.AdminGroups) do
				if playerGroup == v then
					TriggerClientEvent('okokDelVehicles:delete', -1)
					break
				end
			end
		end
	else
		for i, a in ipairs(Config.AdminList) do
			for x, b in ipairs(GetPlayerIdentifiers(source)) do
				if string.lower(b) == string.lower(a) then
					TriggerClientEvent('okokDelVehicles:delete', -1)
				end
			end
		end
	end
end)

function DeleteVehTaskCoroutine()
	TriggerClientEvent('okokDelVehicles:delete', -1)
end

for i = 1, #Config.DeleteVehiclesAt, 1 do
	TriggerEvent('cron:runAt', Config.DeleteVehiclesAt[i].h, Config.DeleteVehiclesAt[i].m, DeleteVehTaskCoroutine)
end
