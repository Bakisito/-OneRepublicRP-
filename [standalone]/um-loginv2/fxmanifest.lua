shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
game {'gta5'}
author 'Uyuyorum'
description 'Uyuyorum Loading Screen V2'
version '2.1.0'
loadscreen 'ui/loading.html'
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'

files {
		'config.js',
		'lang/*.js',
		'ui/loading.html',
		'ui/assets/img/bg/*.png',
		'ui/assets/img/bg/*.jpg',
		'ui/assets/img/*.png',
		'ui/assets/img/*.jpg',
		'ui/assets/css/*.css',
		'ui/assets/js/*.js',
		'ui/assets/audio/*.mp3',
		'ui/assets/video/*.mp4'
}

client_script 'lua/spawn.lua'
server_script 'lua/steamkey.lua'
escrow_ignore {
	'lua/steamkey.lua',
	'lua/spawn.lua'
}
lua54 'yes'
dependency '/assetpacks'