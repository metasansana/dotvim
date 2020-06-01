
" Run jsbeautify (if the command exists) each time the user saves a js file.

" autocmd bufwritepost,filewritepost *.js call JsBeautify()

autocmd bufwritepost,filewritepost *.json call JsonBeautify()

"autocmd BufWritePost,FileWritePost *html call HtmlBeautify()
