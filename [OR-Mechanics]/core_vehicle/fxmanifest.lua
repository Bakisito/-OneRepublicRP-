
fx_version 'adamant'
game 'gta5'

author 'c8re'
description 'Original realistic vehicle experiance for FiveM'
version '1.4.0'

ui_page 'html/form.html'


files {
	'html/form.html',
	'html/css.css',
	'html/img/*.png',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
}

shared_scripts { 
	'config.lua'
}

client_scripts{
    'client/main.lua',
    'client/manual.lua',
}

server_scripts{
    'server/main.lua',
}

lua54 'yes'


escrow_ignore {
  'client/main.lua',
  'server/main.lua',
  'config.lua'
}
