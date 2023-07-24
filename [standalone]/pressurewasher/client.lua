ESX = nil
QBCore = nil

local isBusy = false
local isJobWhitelisted = true

if Config.UseESX then
	Citizen.CreateThread(function()
		while not ESX do
			TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

			Citizen.Wait(500)
		end
	end)

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(xPlayer)
        ESX.PlayerData = xPlayer
        if ESX.PlayerData.job and listcontains(Config.JobNames, ESX.PlayerData.job.name) then
            isJobWhitelisted = true
        else 
            isJobWhitelisted = false
        end
    end)

    RegisterNetEvent('esx:setJob')
    AddEventHandler('esx:setJob', function(job)
        ESX.PlayerData.job = job
        if ESX.PlayerData.job and listcontains(Config.JobNames, ESX.PlayerData.job.name) then
            isJobWhitelisted = true
        else
            isJobWhitelisted = false
        end
    end)

elseif Config.UseQBUS then
    QBCore = exports['qb-core']:GetCoreObject()
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
        local PlayerJob = QBCore.Functions.GetPlayerData().job
        if listcontains(Config.JobNames, PlayerJob.name) then
            isJobWhitelisted = true
        else
            isJobWhitelisted = false
        end
    end)

    RegisterNetEvent('QBCore:Client:OnJobUpdate')
    AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
        local PlayerJob = job
        if listcontains(Config.JobNames, PlayerJob.name) then
            isJobWhitelisted = true
        else
            isJobWhitelisted = false
        end
    end)
else
    --Gives The Player Spike Perms
    if Config.UseWhitelist then
        TriggerServerEvent('PressureWasher:RequestPermissions')
    else
        isJobWhitelisted = true
    end
end

AddEventHandler('pwasher:onPumpBreak', function()
    if Config.UseESX then
        ShowNotification("~r~You Broke The Pressure Pump, A Fee Of ~g~$" .. Config.PumpBreakFee .. "~r~ Have Been Deducted!")
        TriggerServerEvent('pwasher:pay', Config.PumpBreakFee)
    elseif Config.UseQBUS then
        ShowNotification("~r~You Broke The Pressure Pump, A Fee Of ~g~$" .. Config.PumpBreakFee .. "~r~ Have Been Deducted!")
        TriggerServerEvent('pwasher:pay', Config.PumpBreakFee)
	else
        --Do nothing (No Fee)
        ShowNotification("~r~You broke the pressure pump!")
    end
end)

AddEventHandler('pwasher:requestEquipPump', function()
    if isJobWhitelisted then
        if Config.UseESX then
            if not isBusy then
                isBusy = true
                ESX.TriggerServerCallback('pwasher:getCash', function(cash)
                    isBusy = false
                    if cash >= Config.PumpUsePrice then
                        TriggerEvent("pwasher:equipPump")
                        TriggerServerEvent('pwasher:pay', Config.PumpUsePrice)
                    else
                        ShowNotification("~r~You don't have enough money to use the pressure pump!")
                    end
                end)
            end
        elseif Config.UseQBUS then
            local currentCash = QBCore.Functions.GetPlayerData().money['cash']
            if currentCash >= Config.PumpUsePrice then
                TriggerEvent("pwasher:equipPump")
                TriggerServerEvent('pwasher:pay', Config.PumpUsePrice)
            else
                ShowNotification("~r~You don't have enough money to use the pressure pump!")
            end
        else 
            TriggerEvent("pwasher:equipPump")
        end
    else 
        ShowNotification("~r~You don't have permissions to use the pressure pump!")
    end
end)

RegisterNetEvent('PressureWasher:RequestPermissions')
AddEventHandler('PressureWasher:RequestPermissions', function(allowed)
    isJobWhitelisted = allowed
end)

AddEventHandler('pwasher:playSplashParticle', function(pname, posx, posy, posz, heading)
	Citizen.CreateThread(function()
        UseParticleFxAssetNextCall("core")
        local pfx = StartParticleFxLoopedAtCoord(pname, posx, posy, posz, 0.0, 0.0, heading, 1.0, false, false, false, false)
        Citizen.Wait(100)
        StopParticleFxLooped(pfx, 0)
    end)
end)

AddEventHandler('pwasher:playWaterParticle', function(pname, entity, density)
	Citizen.CreateThread(function()
        for i = 0, density, 1 do
            UseParticleFxAssetNextCall("core")
            StartParticleFxNonLoopedOnEntity(pname, objID, 0.5, 0.0, 0.0, 90.0, 0.0, -90.0, 1.0, true, true, true)
        end
    end)
end)

--You can use to do what ever you want, this is triggered when the vehicle is clean
--If you want to change the vehicle cleaned message set the locale for it inside settings.ini 
--and add your custom event here
AddEventHandler('pwasher:vehicleCleaned', function(vehicle)
    
end)

Citizen.CreateThread(function()
    RequestNamedPtfxAsset("core")
    while not HasNamedPtfxAssetLoaded("core") do
         Citizen.Wait(1)
    end
end)

function ShowNotification(msg)
	-- SetNotificationTextEntry('STRING')
	-- AddTextComponentString(msg)
	-- DrawNotification(0,1)
    QBCore.Functions.Notify(msg, "info")

end

function listcontains(list, var)
	for i = 1, #list do
        if list[i] == var then
            return true
        end
    end
	return false
end

--Custom font for 3d text? Use this event if you want to add a custom font for the 3d message
--If you use the default game fonts you can change the 3d text font inside the settings.ini otherwise uncomment this next line and
--put in your custom font id
--TriggerEvent("pwasher:setFont", fontid)