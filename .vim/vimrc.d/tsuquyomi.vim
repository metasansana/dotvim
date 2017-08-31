"See https://github.com/Quramy/tsuquyomi/issues/103
let g:tsuquyomi_disable_default_mappings = 1

"Refresh when tsconfig.json changes.
autocmd BufWritePost,FileWritePost tsconfig.json :TsuquyomiReloadProject