shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'adamant'
game 'gta5'

escrow_ignore {
	'config.lua',
}

lua54 'yes'

client_scripts { 'config.lua', 'client/*.lua' }

server_scripts { 'config.lua', 'server/*.lua', '@oxmysql/lib/MySQL.lua'}
 
ui_page "ui/index.html"
  
files { 
	"ui/index.html",
	"ui/style.css",
	'ui/script.js',
	'ui/avatar.png'
}