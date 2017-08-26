
" Close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Clean up the ui a bit
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1