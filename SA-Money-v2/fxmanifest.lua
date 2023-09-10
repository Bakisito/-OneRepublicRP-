fx_version 'cerulean'
game 'gta5'

description 'San Andreas - Money as Item'
author "Dragodast"
version "2.6.2"

shared_scripts {
	'config.lua',
  '@qb-core/shared/locale.lua',
  'locale/en.lua', -- Here you can change your language
}

server_scripts {
    "server/cash.lua",
    "server/debug.lua",
    "server/functions.lua",
    "server/versioncheck.lua",
}

client_scripts {
  "client/refresh.lua",
  "client/main.lua",
}

escrow_ignore {
    'config.lua', -- Config
    'locale/*.lua',
    "server/functions.lua"
}

exports{
  'GetCash',
  'AddMoney',
  'RemoveMoney',
}

lua54 'yes'

dependency '/assetpacks'