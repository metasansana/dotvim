" Source: http://vim.wikia.com/wiki/Learn_to_use_help
" Simplify help navigationEdit
" The following mappings simplify navigation when viewing help:

" Press Enter to jump to the subject (topic) under the cursor.
" Press Backspace to return from the last jump.
" Press s to find the next subject, or S to find the previous subject.
" Press o to find the next option, or O to find the previous option.
"nnoremap <buffer> <CR> <C-]>
"nnoremap <buffer> <BS> <C-T>
"nnoremap <buffer> o /'\l\{2,\}'<CR>
"nnoremap <buffer> O ?'\l\{2,\}'<CR>
"nnoremap <buffer> s /\|\zs\S\+\ze\|<CR>
"nnoremap <buffer> S ?\|\zs\S\+\ze\|<CR>gg

"13-11-19 : Disabled because this was the source of the errors I got when 
"           pressing "o" in normal mode. I don't really use this anyway
"           ^ Lasana