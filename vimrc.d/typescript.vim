"From https://github.com/Microsoft/TypeScript/wiki/TypeScript-Editor-Support#vim
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

"This allows for the typescript vim exe to be changed
"autocmd FileType typescript :set makeprg=tsc