fx_version 'cerulean'
game 'gta5'

author 'auradevelopment5m'
description 'Liquid Glass TextUI'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/styles.css',
    'html/script.js',
}

client_scripts {
    'client/nui.lua'
}

exports {
    'ShowTextUI',
    'HideTextUI',
    'UpdateTextUI',
    'HideAllTextUI'
}
