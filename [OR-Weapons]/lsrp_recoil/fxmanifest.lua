fx_version 'cerulean'
game 'gta5'
lua54 'yes'


dependencies { 'ox_lib' }

shared_scripts { '@ox_lib/init.lua', 'config.lua' }
client_scripts { 'client/main.lua', 'client/weaponSafety.lua' }

escrow_ignore { 'config.lua' }
dependency '/assetpacks'