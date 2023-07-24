fx_version 'cerulean'
game 'gta5'
description 'SkeletonNetworks'
version '1.0.0'
lua54 'yes'

shared_script 'config.lua'

client_script 'client.lua'

files {
	"ui/index.html",
	"ui/script.js"
}

ui_page {
	'ui/index.html',
}

escrow_ignore {
    'config.lua',
}
dependency '/assetpacks'