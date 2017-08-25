" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"------------------------------------------------------------
"By developer

let g:golang_goroot = "/usr/bin/go"

"source /home/developer/.vim/a.vim
"source /home/developer/.vim/apachestyle.vim
"source $HOME/.vim/syntax/go.vim
"source /home/developer/.vim/compiler/golang.vim

"autocmd FileType go compiler golang
" Set to auto read when a file is changed from the outside
set autoread

colorscheme jellybeans
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc anyway...
set nobackup
set nowb
set noswapfile

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l:%c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction

function! VisualSelection(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  elseif a:direction == 'gv'
    call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  elseif a:direction == 'f'
    execute "normal /" . l:pattern . "^M"
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  en
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction


nmap <F8> :TagbarToggle<CR>

au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &
"au FocusLost * :wa <CR>

nmap <C-n> :tabp<CR>
nmap <C-m> :tabn<CR>
nmap <C-p> :wqa<CR>

filetype off
filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
let g:vim_markdown_folding_disabled=1
let NERDTreeShowHidden=1
execute pathogen#infect()

"<Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"ragtag
let g:ragtag_global_maps = 1

set novisualbell

"256 colors?
set t_Co=256
"set t_ut=

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"80 cols
"set columns=80

"Stolen from here http://stackoverflow.com/questions/235439/vim-80-column-layout-concerns
highlight OverLength ctermbg=darkgrey guibg=#555555
match OverLength /\%81v.\+/

"Save
" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
      \|    if empty(bufname('%'))
        \|        confirm write
        \|    endif
        \|endif
nnoremap <C-T> :<C-u>Update<CR>
""""""""""""""
" tmux fixes "
""""""""""""""
" Handle tmux $TERM quirks in vim
if $TERM =~ '^screen'
  map <Esc>OH <Home>
  map! <Esc>OH <Home>
  map <Esc>OF <End>
  map! <Esc>OF <End>
endif

"Stop quickfix poping replacing my buffers
"set switchbuf+=usetab,newtab
au BufNewFile,BufRead *.ejs set filetype=html
autocmd bufwritepost,filewritepost *.js call JsBeautify()
autocmd bufwritepost,filewritepost *.json call JsonBeautify()
au BufRead,BufNewFile *.json setf json

autocmd BufWritePost,FileWritePost *html call HtmlBeautify()

"Autoformat plugin
au BufWrite * :Autoformat
"Don't try to format any and everything
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

nmap <silent> <leader>htm :call HtmlBeautify()
nmap <silent> <leader>js :autocmd BufWritePost,FileWritePost *.js call JsBeautify()
nmap <silent> <leader>jsboff :autocmd! BufWritePost,FileWritePost *.js

"gofmt on save
"au FileType go au BufWritePre <buffer> Fmt
"autocmd FileType go let b:vimpipe_command="Fmt"

"go lint
"set rtp+=/usr/lib/go/src/pkg/github.com/golang/lint/misc/vim
"autocmd BufWritePost,FileWritePost *.go execute 'Lint'

"JSHint
autocmd BufWritePost,FileWritePost *.js execute 'JSHint' | cwindow

"PHP Lint
autocmd BufWritePost,FileWritePost *.php execute 'Phplint' | cwindow

"CSSLint
let g:CSSLint_FileTypeList = ['css', 'less', 'sess']

"Attempt to make quickfix less of a pain in the ass
"function! GetBufferList()
"  redir =>buflist
"  silent! ls
"  redir END
"  return buflist
"endfunction
"
"function! ToggleList(bufname, pfx)
"  let buflist = GetBufferList()
"  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
"    if bufwinnr(bufnum) != -1
"      exec(a:pfx.'close')
"      return
"    endif
"  endfor
"  if a:pfx == 'l' && len(getloclist(0)) == 0
"    echohl ErrorMsg
"    echo "Location List is Empty."
"    return
"  endif
"  let winnr = winnr()
"  exec(a:pfx.'open')
"  if winnr() != winnr
"    wincmd p
"  endif
"endfunction

nnoremap <silent><C-l>l :lclose<return>
"nmap <silent> <C-l>l :call ToggleList("Location List", 'l')<return>
"nmap <silent> <C-l>e :call ToggleList("Quickfix List", 'c')<return>
let g:NERDTreeWinPos = "right"
let g:NERDTreeChDirMode=2
"stop quickfix evils
set switchbuf+=usetab,newtab

"less compile the current file.
nnoremap <Leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>

nnoremap ; :

"VIM jsx
let g:jsx_ext_required = 0

"vertical split
nnoremap <silent> vv <C-w>v

"horizontal split
nnoremap <silent> hh <C-w>s
nnoremap <silent> q <C-w>q

"Toggle NERDTree
nnoremap <silent><C-a> :NERDTreeTabsToggle<return>
nnoremap <silent><C-v>l :ls<return>

"Remap pane switching pain
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h

"Remove weird painting of whitespace
:set t_ut=

"Quick save with out all the drama
inoremap <C-s> <ESC>:update<CR>

"Emmet
let g:user_emmet_leader_key=','

vnoremap // y/<C-R>"<CR>

"Indent wml files
au BufNewFile,BufRead *.wml set ft=jinja

"highlight mql as javascript for now
au BufNewFile,BufRead *.mql set ft=javascript

"vim-javascript
let g:javascript_plugin_jsdoc = 1

"disable p quit
unmap <C-p>

"vim-syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1

"tsuquyomi
"let g:tsuquyomi_disable_quickfix = 1
"let g:syntastic_typescript_checkers = ['tsuquyomi']
"let g:typescript_indent_disable = 1
let g:tsuquyomi_disable_default_mappings = 1

autocmd FileType typescript map <buffer> <C-J> :TsuDefinition<CR><C-L>
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow

" NERDTree
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

