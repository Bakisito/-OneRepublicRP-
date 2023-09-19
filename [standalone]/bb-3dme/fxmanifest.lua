shared_script '@Five/ai_module_fg-obfuscated.lua'
shared_script '@Five/shared_fg-obfuscated.lua'
fx_version 'adamant'
game 'gta5'

client_script 'bb_c.lua'
server_script 'bb_s.lua'

files {
	"bb_index.html",
	"bb_js.js"
}

ui_page {
	'bb_index.html',
}