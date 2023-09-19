shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

description 'QB-Skillbar'
version '1.2.0'

ui_page 'html/index.html'

client_script 'client/main.lua'

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
}

dependency 'qb-core'

lua54 'yes'