let g:path_to_configs = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:vimrcd = g:path_to_configs . '/' . '.vim/vimrc.d'

execute 'source' s:vimrcd .'/reset'
execute 'source' s:vimrcd .'/preferences'

function! s:SourceRecursive(path)
  if isdirectory(a:path)
    s:SourceRecursive(a:path)
  else
    for f in split(glob(a:path), '\n')
      execute 'source' f
    endfor
  endif
endfunction

call s:SourceRecursive(s:vimrcd.'/*.vim')