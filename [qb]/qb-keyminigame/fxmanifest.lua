shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

description 'QB-KeyMiniGame'
version '1.0.0'

ui_page 'html/index.html'

client_script 'client/main.lua'

files {
    'html/index.html',
    'html/app.js',
    'html/style.css',
}

lua54 'yes'