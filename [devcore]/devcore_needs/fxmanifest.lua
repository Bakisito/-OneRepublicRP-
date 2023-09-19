shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
--[[ FX Information ]]--
fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'realistic-needs'
author       'devcore'
version      '3.3'
repository   'https://store.devcore.cz/'
description  'https://discord.gg/zcG9KQj3sa'

shared_scripts {
	'configs/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
}

escrow_ignore {
	'client/functions.lua',
	'client/client.lua',
	'server/server.lua',
	'configs/*.lua',
	'upload/inventory/*.txt',
	'upload/sql/*.sql',
	'upload/icons/*.png',
	'fxmanifest.lua',
	'README.txt'
}

client_scripts {
	'client/*.lua',
}

dependency '/assetpacks'