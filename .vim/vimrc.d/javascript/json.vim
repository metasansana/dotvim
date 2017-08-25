
"Run js hint each time a js file is saved
autocmd BufWritePost,FileWritePost *.js execute 'JSHint' | cwindow
