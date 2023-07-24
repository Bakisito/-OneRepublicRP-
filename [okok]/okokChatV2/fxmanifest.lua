fx_version 'cerulean'

game 'gta5'

author 'OR-Devs'
description 'https://github.com/OR-Devs'
version '1.0.1'

files {
    'web/*.*',
    "okok_chatv2_html.html",
	"okok_chatv2_js.js"
}

ui_page {
	'okok_chatv2_html.html',
}

shared_script 'config.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

chat_theme 'gtao' {
    styleSheet = 'web/styles.css',
    msgTemplates = {
        default = '<b>{0}</b><span>{1}</span>'
    }
}

lua54 'yes'

escrow_ignore {
    'config.lua',
    'client.lua',
    'server.lua'
}
dependency '/assetpacks'