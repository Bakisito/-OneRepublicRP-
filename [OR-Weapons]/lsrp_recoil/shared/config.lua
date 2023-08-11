Config = {}
Config.debug = false



Config.server = {}  -- It's safe even if it's in shared, they can't do shit with it anyway
Config.server.invalidSource = function(playerid)
    -- print(playerid)
    -- You do not need to return, it does in the script already
end
Config.server.invalidSlot = function(playerid, slot)
    -- print(('Player %s request weapon meta for slot %s'):format(playerid, slot))
    -- You do not need to return, it does in the script already
end



Config.client = {}
Config.client.safetyModule = {
    enabled = false,
    startEnabled = false,
    safety = {
        -- Pistol
        ['WEAPON_PISTOL'] = true,
        ['WEAPON_COMBATPISTOL'] = true,
        ['WEAPON_PISTOLXM3'] = true,
        -- SMG
        ['WEAPON_SMG'] = true,
        ['WEAPON_COMBATPDW'] = true,
        -- ARs
        ['WEAPON_HEAVYRIFLE'] = true,
        ['WEAPON_MILITARYRIFLE'] = true,
        ['WEAPON_ASSAULTRIFLE'] = true,
        ['WEAPON_CARBINERIFLE'] = true,
        ['WEAPON_TACTICALRIFLE'] = true,
    },
    firemodes = {
        ['WEAPON_COMBATPDW'] = true,
        ['WEAPON_MILITARYRIFLE'] = true,
        ['WEAPON_ASSAULTRIFLE'] = true,
        ['WEAPON_CARBINERIFLE'] = true,
        ['WEAPON_TACTICALRIFLE'] = true,
    }
    
}

Config.client.persistentFlashlight = true
Config.client.recoils = {}
Config.client.recoils.thirdpersonmodifier = 5.0 -- Multip. for 3RD person recoil
Config.client.recoils.weaponGroups = {
	[joaat('GROUP_PISTOL')] 	= 2.75,
	[joaat('GROUP_SMG')] 		= 1.75,
	[joaat('GROUP_SHOTGUN')] 	= 5.0,
	[joaat('GROUP_RIFLE')] 		= 1.3,
	[joaat('GROUP_MG')] 		= 3.0,
	[joaat('GROUP_SNIPER')] 	= 10.0,	-- It does not seem to affect sniper rifles.
	[joaat('GROUP_HEAVY')] 		= 10.0,
	[joaat('GROUP_THROWN')] 	= 0.0,
	[joaat('GROUP_PETROLCAN')] 	= 0.0,
}

Config.client.recoils.weapons = {
	[joaat('WEAPON_PISTOL')] = 2.0,
	[joaat('WEAPON_PISTOL50')] = 5.5,
	[joaat('weapon_mpx')] = 2.5,
	[joaat('weapon_ak47')] = 1.5,
	[joaat('weapon_assaultrifle')] = 1.5,
	[joaat('weapon_appistol')] = 2.0,
	[joaat('weapon_fbiarb')] = 1.5,
	[joaat('weapon_m9')] = 3.5,
	[joaat('weapon_mp9')] = 2.8,
	[joaat('weapon_combatpdw')] = 3.0,
	[joaat('weapon_compactrifle')] = 2.5,
	[joaat('weapon_fnx45')] = 2.6,
	[joaat('weapon_assaultsmg')] = 4.0,
	[joaat('weapon_g17')] = 2.5,
	[joaat('weapon_hk416')] = 2.8,
	[joaat('weapon_mp5')] = 4.6,
	[joaat('weapon_m110')] = 999.0,
	[joaat('weapon_m1911')] = 5.0,
	[joaat('weapon_m4')] = 2.4,
	[joaat('weapon_mac10')] = 3.5,
	[joaat('weapon_microsmg')] = 4.8,
	[joaat('weapon_minismg')] = 4.5,
	[joaat('weapon_nsr9')] = 3.6,
	[joaat('weapon_glock17')] = 2.6,
	[joaat('weapon_scarh')] = 2.6,
	[joaat('weapon_pp19')] = 3.5,
	[joaat('weapon_combatpistol')] = 2.5,
	[joaat('weapon_doubleaction')] = 8.0,
	[joaat('weapon_carbinerifle')] = 3.2,
	[joaat('weapon_smg')] = 4.3,
	[joaat('weapon_mk18b')] = 2.6,
	[joaat('weapon_mk18')] = 2.6,
	[joaat('weapon_machinepistol')] = 3.4,
	[joaat('weapon_gusenberg')] = 3.8,
	[joaat('weapon_miniuzi')] = 3.6,
	[joaat('weapon_vintagepistol')] = 5.2, -- HABLANDOME MUERTO?
}