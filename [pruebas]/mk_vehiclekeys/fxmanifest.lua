fx_version 'cerulean'
games {'gta5'}

author 'ManKind - [https://discord.gg/39fNFepADG]'
description 'Vehicle Keys System'
version '1.2.6'

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua',
}

client_scripts {
    'config/config.lua',
	'config/framework_cl.lua',
	'config/inventory.lua',
	'client/cl_*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'config/config.lua',
	'config/framework_sv.lua',
	'config/inventory.lua',
	'server/sv_*.lua',
	'server/version.lua',
}

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/sounds/*.ogg'
}

dependencies {
    'ox_lib',
}

escrow_ignore {
	'config/config.lua',
	'config/framework_cl.lua',
	'config/framework_sv.lua',
	'config/inventory.lua',
	'html/sounds/*.*',
	'itemimage/*.png',
	'Keyfobs.sql',
	'README.md'
}
dependency '/assetpacks'