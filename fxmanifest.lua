-- fxmanifest.lua

fx_version 'cerulean'
game 'gta5'

author 'Quwenji'
description 'Zeigt das Kennzeichen eines Fahrzeugs über das ox_target System an.'
version '2.1.0'

shared_scripts {
    '@es_extended/imports.lua',
    'config.lua',
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

dependencies {
    'es_extended',
    'ox_target',
    'oxmysql'
}
