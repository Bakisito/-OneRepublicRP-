--[[ FX Information ]]--
fx_version   'cerulean'
lua54        'yes'
game         'gta5'

--[[ Resource Information ]]--
name         'rcore_prison'
author       'NewEdit'
version      '1.84'
description  'Standalone unique Prison system.'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/const.lua',
	'configs/config.lua',
	'shared/init.lua',
	'data/presets/*.lua',
	'configs/permissions.lua',
	'configs/outfits.lua',
	'modules/**/shared-internal.lua',
	'modules/**/init-prison.lua'
}

escrow_ignore {
	'assets/includedLibrary',
	'assets/includedMaps',
	'assets/inventoryImages',
	'modules/**/database/*.lua',
	'modules/base/server/sv_bridge.lua',
	'modules/base/client/cl-menu-api.lua',
	'modules/**/booth/**/*.lua',
	'modules/**/imports/*.lua',
	'modules/**/inventory/*.lua',
	'modules/**/framework/**/server.lua',
	'modules/**/framework/**/client.lua',
	'modules/**/target/**/client.lua',
	'modules/**/init-prison.lua',
	'data/locales/*.lua',
	'data/presets/*.lua',
	'web/build/config.js',
	'configs/config.lua',
	'configs/permissions.lua',
	'configs/interiors.lua',
	'configs/outfits.lua',
	'configs/webhook.lua',
}

client_scripts {
	'modules/**/framework/**/client.lua',
	'modules/**/target/**/client.lua',
	'modules/base/client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'configs/webhook.lua',
	'modules/base/server/*.lua',
	'modules/**/booth/**/*.lua',
	'modules/**/booth/*.lua',
	'modules/**/imports/*.lua',
	'modules/**/database/*.lua',
	'modules/**/inventory/*.lua',
	'modules/**/framework/**/server.lua',
}

ui_page 'web/build/index.html'

files {
	'zones.json',
	'web/build/index.html',
	'web/build/app.js',
	'web/build/config.js',
	'web/build/style.css',
    'web/build/fonts/*.ttf',
    'web/build/images/*.png',
    'web/build/**/*',
	'data/*.lua',
	'data/**/*.lua',
}

dependencies {
	'/server:5104',
	'/onesync',
}
dependency '/assetpacks'