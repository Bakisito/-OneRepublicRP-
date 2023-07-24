fx_version 'cerulean'
game { 'gta5' }
lua54 'yes'

author 'KuzQuality | Kuzkay'
description 'Working car lift'
version '1.2.2'

files {
    'stream/imp_prop_kq_lift.ytyp'
}

--- UNCOMMENT IF YOU'RE USING OLD QB CORE EXPORT
-- shared_script '@qb-core/import.lua'

--
-- Server
--

server_scripts {
    'locale/locale.lua',
    'config.lua',
    'server/server.lua',
}

--
-- Client
--

client_scripts {
    'locale/locale.lua',
    'config.lua',
    'client/client.lua',
    'client/editable/editable.lua',
    'client/editable/esx.lua',
    'client/editable/qb.lua',
    'client/editable/target.lua',
}

escrow_ignore {
    'config.lua',
    'locale/locale.lua',
    'client/editable/editable.lua',
    'client/editable/esx.lua',
    'client/editable/qb.lua',
    'client/editable/target.lua',
    'stream/imp_prop_kq_lift.ytyp',
    'stream/imp_prop_kq_lift_empty.ydr',
    'stream/imp_prop_kq_lift_arms.ydr',
}

data_file 'DLC_ITYP_REQUEST' 'stream/imp_prop_kq_lift.ytyp'

dependency '/assetpacks'