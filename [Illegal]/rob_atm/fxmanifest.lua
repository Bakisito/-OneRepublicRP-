-- For support join my discord: https://discord.gg/Z9Mxu72zZ6

author "Andyyy#7666"
description "Pull ATM's from the wall and rob them"
version "1.4.0"

fx_version "cerulean"
game "gta5"
lua54 "yes"

escrow_ignore {
    "config.lua",
    "bridge/**/*.lua",
    "INSTALLATION/**"
}

data_file "DLC_ITYP_REQUEST" "stream/frame_02.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/frame_03.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/frame_fleeca.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/part_02.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/part_03.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/part_fleeca.ytyp"

files {
    "bridge/**/client.lua"
}

shared_script "config.lua"
server_scripts {
    "source/server.lua"
}
client_scripts {
    "source/client.lua"
}
exports {
    "useRope",
    "useDrill"
}
dependency '/assetpacks'