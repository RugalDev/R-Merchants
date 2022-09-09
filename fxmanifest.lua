fx_version "bodacious"
games {"rdr3"}
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
author 'Rugal#1337'
description 'T-Merchants'
version '1.0.0'
lua54 'yes'

client_scripts {
	'config.lua',
	'c/c.lua',
}

server_scripts {
	'config.lua',
	's/s.lua',
}

escrow_ignore {
    'config.lua'
}