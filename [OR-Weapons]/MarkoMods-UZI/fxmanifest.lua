shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'cerulean'
games {'gta5'}
description 'Markomods.com Mini Uzi'

files{
	'**/markomods-miniuzi-components.meta',
	'**/markomods-miniuzi-archetypes.meta',
	'**/markomods-miniuzi-animations.meta',
	'**/markomods-miniuzi-pedpersonality.meta',
	'**/markomods-miniuzi.meta',
}

data_file 'WEAPONCOMPONENTSINFO_FILE' '**/markomods-miniuzi-components.meta'
data_file 'WEAPON_METADATA_FILE' '**/markomods-miniuzi-archetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' '**/markomods-miniuzi-animations.meta'
data_file 'PED_PERSONALITY_FILE' '**/markomods-miniuzi-pedpersonality.meta'
data_file 'WEAPONINFO_FILE' '**/markomods-miniuzi.meta'

client_script 'cl_weaponNames.lua'