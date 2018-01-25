" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos

" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowb
set noswapfile

" Linebreak on 500 characters
set lbr
set tw=500

" Idents
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Automatically save the file being edited, disabled by default
" because it's a double edge sword. 
" autocmd FocusLost * :wa <CR>

"Stolen from here http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
"highlights text that is over the 80 column marker.
highlight OverLength ctermbg=darkgrey guibg=#555555
match OverLength /\%81v.\+/

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
      \|    if empty(bufname('%'))
        \|        confirm write
        \|    endif
        \|endif

" Stop netrw from creating history files
let g:netrw_dirhistmax=0

"I have no idea why I have to do this
filetype plugin indent on

" Use 'set list' to display whitespace, useful for debugging Makefiles.
listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
