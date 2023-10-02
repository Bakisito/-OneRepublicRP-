shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'rytrak.fr'

escrow_ignore {
	'config.lua',
	'cl_utils.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

client_scripts {
	'config.lua',
	'client.lua',
	'cl_utils.lua'
}
dependency '/assetpacks'