ESX = nil

if Config.UseESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('pwasher:pay')
	AddEventHandler('pwasher:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 then
			xPlayer.removeMoney(amount)
		end
	end)

	ESX.RegisterServerCallback('pwasher:getCash', function (source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		cb(xPlayer.getMoney())
	end)
elseif Config.UseQBUS then

	local QBCore = exports['qb-core']:GetCoreObject()

	RegisterNetEvent('pwasher:pay', function(price, source)
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local amount = math.floor(price + 0.5)
		if price > 0 then
			xPlayer.Functions.RemoveMoney('cash', amount)
		end
	end)

end

RegisterServerEvent('PressureWasher:RequestPermissions')
AddEventHandler('PressureWasher:RequestPermissions', function()
    TriggerClientEvent('PressureWasher:RequestPermissions', source, IsJobWhitelisted(source))
end)

function IsJobWhitelisted(source)
	if(not Config.UseWhitelist) then 
		return true
	end
    for _, id in ipairs(GetPlayerIdentifiers(source)) do
        if listcontains(Config.Identifiers, id) then
            return true
        end
    end
    return false
end

function listcontains(list, var)
	for i = 1, #list do
        if list[i] == var then
            return true
        end
    end
	return false
end