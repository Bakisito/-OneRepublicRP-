shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'

fx_version 'adamant'

game 'gta5'


lua54 'yes'


ui_page 'html/form.html'

files {
	'html/form.html',
	'html/css.css',
	'html/water.png',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
	'html/img/*.png',
}

client_scripts{
    'config.lua',
    'client/main.lua',
}

server_scripts{
    '@oxmysql/lib/MySQL.lua',
    'config.lua',
    'server/main.lua',
}