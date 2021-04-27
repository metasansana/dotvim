"This virmc file is written to do a few things:
" 1. Recursively source vim files found in the ~/.vim/vimrc.d directory.
" 2. Recursively source vim files found inthe ~/vimrc.d directory.
" 3. Source .vimlocal files found in project folders (The user is prompted first to prevent abuse).

let g:path_to_configs = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let g:path_to_dot_vim = g:path_to_configs . '/.vim'
let g:path_to_vimrcd = g:path_to_dot_vim . '/vimrc.d'

"Apply reset and preferences before anything else.
execute 'source' g:path_to_vimrcd . '/reset'
execute 'source' g:path_to_vimrcd . '/preferences'

command SourceLocal :call s:SourceLocal()

function! s:SourceDir(path)
  if isdirectory(a:path)
    for f in split(glob(a:path.'/*.vim'), '\n')
      if filereadable(f)
        execute 'source' f
      endif
    endfor
  endif
endfunction

function! s:SourceLocal()
  if filereadable('.vimlocal')
    echo "Source .vimlocal file? (y/[n])"
    if(nr2char(getchar()) == 'y')
      source .vimlocal
      echo ".vimlocal file has been sourced!"
      endif
  endif
endfunction

call s:SourceDir(g:path_to_vimrcd)

call s:SourceDir($HOME.'/vimrc.d')

autocmd VimEnter * :SourceLocal
