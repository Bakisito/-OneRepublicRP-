fx_version 'cerulean'
games {'gta5'}
description 'Markomods.com nsr9'

files{
	'**/markomods-nsr9-components.meta',
	'**/markomods-nsr9-archetypes.meta',
	'**/markomods-nsr9-animations.meta',
	'**/markomods-nsr9-pedpersonality.meta',
	'**/markomods-nsr9.meta',
}

data_file 'WEAPONCOMPONENTSINFO_FILE' '**/markomods-nsr9-components.meta'
data_file 'WEAPON_METADATA_FILE' '**/markomods-nsr9-archetypes.meta'
data_file 'WEAPON_ANIMATIONS_FILE' '**/markomods-nsr9-animations.meta'
data_file 'PED_PERSONALITY_FILE' '**/markomods-nsr9-pedpersonality.meta'
data_file 'WEAPONINFO_FILE' '**/markomods-nsr9.meta'

client_script 'cl_weaponNames.lua'