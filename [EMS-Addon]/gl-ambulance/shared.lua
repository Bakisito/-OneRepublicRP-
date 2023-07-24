Config = {}
Config.AllowedStretcherVehicles = {"ambulan","ambulance1","airambulance"}
Config.MinimalDoctor = 1
Config.UseBeds = true
Config.NancyPos = vector3(308.854, -594.262, 42.300)
Config.NancyCost = 3000
--vector3(308.854, -594.262, 42.300)
Config.BedLocs = {-- Add more Beds here to be Tp'd into when using Nancy
    vector4(324.26, -582.77, 43.2, 158.15),
    vector4(322.59, -587.32, 43.2, 336.72),
    vector4(319.33, -581.15, 43.2, 158.61),
    vector4(317.67, -585.24, 43.2, 338.29),
    vector4(314.47, -584.23, 43.2, 339.52), 
    vector4(313.81, -579.04, 43.2, 156.64),
    vector4(311.12, -582.9, 43.2, 338.82),  
    vector4(309.33, -577.3, 43.2, 158.98), 
    vector4(307.63, -581.9, 43.2, 336.67)
}
Config.Guns = {
    -- Handguns
    `weapon_pistol`,  
    `weapon_pistol_mk2`, 
    `weapon_combatpistol`, 
    `weapon_appistol`, 
    `weapon_stungun`,  
    `weapon_pistol50`,  
    `weapon_snspistol`,  
    `weapon_snspistol_mk2`,  
    `weapon_heavypistol`,  
    `weapon_vintagepistol`,  
    `weapon_flaregun`,  
    `weapon_marksmanpistol`,  
    `weapon_revolver`, 
    `weapon_revolver_mk2`, 
    `weapon_doubleaction`,  
    `weapon_raypistol`, 
    `weapon_ceramicpistol`, 
    `weapon_navyrevolver`, 
    `weapon_gadgetpistol`,  
    --`weapon_stungun_mp`,
    'WEAPON_GLOCK17',
    'WEAPON_M9',
    'WEAPON_M1911',
    'WEAPON_FNX45',
    'WEAPON_G17',
    'WEAPON_M45A1',

    -- Submachine Guns
    `weapon_microsmg`,
    `weapon_smg`, 
    `weapon_smg_mk2`,
    `weapon_assaultsmg`, 
    `weapon_combatpdw`,  
    `weapon_machinepistol`,
    `weapon_minismg`, 
    `weapon_raycarbine`,
    'WEAPON_MAC10',
    'WEAPON_MINIUZI',
	'WEAPON_MP9',
    'WEAPON_FBIARB',
	'WEAPON_MK18B',
	'WEAPON_PP19',
	'WEAPON_G17',
	'WEAPON_NSR9',
	'WEAPON_MK18',
	'WEAPON_MP5',
	'WEAPON_MPX',


    -- Shotguns
    `weapon_pumpshotgun`, 
    `weapon_pumpshotgun_mk2`, 
    `weapon_sawnoffshotgun`, 
    `weapon_assaultshotgun`,  
    `weapon_bullpupshotgun`,  
    `weapon_musket`,  
    `weapon_heavyshotgun`,  
    `weapon_dbshotgun`,  
    `weapon_autoshotgun`,
    `weapon_combatshotgun`,

    -- Assault Rifles
    `weapon_assaultrifle`, 
    `weapon_assaultrifle_mk2`, 
    `weapon_carbinerifle`,  
    `weapon_carbinerifle_mk2`,  
    `weapon_advancedrifle`,  
    `weapon_specialcarbine`,  
    `weapon_specialcarbine_mk2`, 
    `weapon_bullpuprifle`,  
    `weapon_bullpuprifle_mk2`, 
    `weapon_compactrifle`,  
    `weapon_militaryrifle`, 
    `weapon_heavyrifle`,
    'WEAPON_AK47',
	'WEAPON_M4',
	'WEAPON_HK416',
    'WEAPON_SCARH',



    -- Light Machine Guns
    `weapon_mg`, 
    `weapon_combatmg`,  
    `weapon_combatmg_mk2`,  
    `weapon_gusenberg`,

    -- Sniper Rifles
    `weapon_sniperrifle`, 
    `weapon_heavysniper`,
    `weapon_heavysniper_mk2`,
    `weapon_marksmanrifle`,
    `weapon_marksmanrifle_mk2`,
    `weapon_remotesniper`,
    'WEAPON_HUNTINGRIFLE',
    'WEAPON_M110',



    -- Heavy Weapons
     `weapon_rpg`,
    -- `weapon_grenadelauncher`,
     `weapon_grenadelauncher_smoke`,
    -- `weapon_minigun`, 
    -- `weapon_firework`, 
    -- `weapon_railgun`, 
    -- `weapon_hominglauncher`,
    -- `weapon_compactlauncher`,
    -- `weapon_rayminigun`,
    -- `weapon_emplauncher`,
}

Config.Melee = {
    `weapon_unarmed`,
    `weapon_dagger`,
    `weapon_bat`,
    `weapon_bottle`,
    `weapon_crowbar`,
    `weapon_flashlight`,
    `weapon_golfclub`,
    `weapon_hammer`,
    `weapon_hatchet`,
    `weapon_knuckle`,
    `weapon_knife`,
    `weapon_machete`,
    `weapon_switchblade`,
    `weapon_nightstick`,
    `weapon_wrench`,
    `weapon_battleaxe`,
    `weapon_poolcue`,
    `weapon_briefcase`,
    `weapon_briefcase_02`,
    `weapon_garbagebag`,
    `weapon_handcuffs`,
    `weapon_bread`,
    `weapon_stone_hatchet`,
    'WEAPON_SHIV',
	'WEAPON_KATANA',
	'WEAPON_SLEDGEHAMMER',

}

Config.Explosions = {
    `weapon_grenade`,
    `weapon_stickybomb`,
    `weapon_proxmine`,
    `weapon_bzgas`,
    `weapon_molotov`,
    `weapon_fireextinguisher`,
    `weapon_petrolcan`,
    `weapon_flare`,
    `weapon_smokegrenade`,
    `weapon_pipebomb`,
    `weapon_fire`,
    `weapon_explosion`,
}

Config.Grandmas = true -- A Blackmarket place for crims to revive
Config.GrandmasCost = 0
Config.GrandmaCoords = vector3(742.37, 4169.76, 40.09)
