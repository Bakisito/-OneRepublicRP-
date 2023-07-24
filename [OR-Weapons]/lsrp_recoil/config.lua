Config = {}
Config.debug 					= false	-- Turns on debugging prints
Config.tpModifier 				= 3.0	-- A modifier that multiplies the recoil when not using first person. EG. If a player is shooting from third person, recoil gets significantly greater so its approx equal to FP
Config.recoilThread				= 300	-- How often should the thread update to set the recoil values? 500 is sometimes slow if view is changed too quickly
Config.vehicleRecoil = {
	moduleEnabled		= true,			-- Do you want anything related to vehicleRecoil enabled?
	forceFirstPerson 	= false,			-- Enables forced first person when aiming in vehicle
	shakeValue 			= 0.15,			-- Vehicle TP Recoil, I recommend keeping it at this value
	driverOnly 			= false,		-- Enables forced first person when aiming in vehicle for driver only
}

Config.groupRecoils = {					-- Weaoup groups
	[joaat('GROUP_UNARMED')] 	= 0.0,
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

Config.weaponRecoil = {					-- Specific weapon recoil. This overrides groups!
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

Config.safetyWeapons = {				-- Weapons that will have safety enabled
	['weapon_glock17']
}