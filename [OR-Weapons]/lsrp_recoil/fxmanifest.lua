fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'
author 'mikigoalie'
version '1.8.3'

dependencies { 'ox_lib'}

-- Scripts
shared_scripts { '@ox_lib/init.lua', 'shared/*.lua' }
client_scripts { 'client/*.lua' }
server_scripts { 'server/*.lua' }

-- Translations
files { 'locales/*.json' }

escrow_ignore { 'shared/*.lua', 'locale/*.json' }
dependency '/assetpacks'