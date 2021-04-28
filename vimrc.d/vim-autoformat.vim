
"typescript
"au BufWrite *.ts :Autoformat
autocmd bufwritepost,filewritepost *.ts :Autoformat typescript

" Debug hang errors
"let g:autoformat_verbosemode=1
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0
