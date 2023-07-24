-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------

Config = {}

Config.checkForUpdates = true -- Check for Updates?

Config.TargetSystem = 'qb-target' -- Choices confirmed working are currently 'qtarget' and 'qb-target'

Config.allowedWeapons = {
    `WEAPON_KNIFE`,
    `WEAPON_BOTTLE`,
    `WEAPON_DAGGER`,
    `WEAPON_HATCHET`,
    `WEAPON_MACHETE`,
    `WEAPON_SWITCHBLADE`
}

RegisterNetEvent('wasabi_tireslash:notify')
AddEventHandler('wasabi_tireslash:notify', function(message)	
    -- Place notification system info here, ex: exports['mythic_notify']:SendAlert('inform', message)
    ShowNotification(message)
end)

Language = {
    ['no_weapon'] = 'Necesitas sostener algo afilado para hacer esto!',
    ['car_slashed'] = '¡Alguien pinchó tu rueda!',
    ['already_slashed'] = '¡Este neumático ya ha sido pinchado!'
}