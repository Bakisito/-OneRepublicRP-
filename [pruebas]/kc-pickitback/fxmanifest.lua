fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'Clementinise'
name 'KC Pick It Back'
description 'Never lose your hat or glasses again, always stay in style'
github 'https://github.com/clementinise/kc-pickitback'
version '1.2'

shared_scripts {
	'locales/*.lua',
	'config.lua',
}

client_script 'client/client.lua'

server_script 'server/server.lua'

escrow_ignore {
  'config.lua',
  'locales/*.lua'
}

fivem_checker 'yes'

dependency '/assetpacks'