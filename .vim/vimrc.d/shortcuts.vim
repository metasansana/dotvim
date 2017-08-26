
"Quick save with out all the drama
inoremap <C-s> <ESC>:update<CR>
nnoremap <C-S> :update<CR>

"vertical split
nnoremap <silent> vv <C-w>v

"horizontal split
nnoremap <silent> hh <C-w>s

"switch to the next tab
nnoremap <C-n> :tabn<CR> 

"switch to the previous tab
nnoremap <C-p> :tabp<CR>

"Toggle the file explorer (NerdTree)
nnoremap <C-a> :NERDTreeTabsToggle<return>

"Toggle the file explorer (netrw)
"nnoremap <C-a> :Vexplore<return>

"get to the command prompt easier
nnoremap ; :

"Quit shortcuts
nnoremap <leader>q :q<CR>
nnoremap <leader>x :qa<CR>
nnoremap <leader>s :wqa<CR>
nnoremap <leader>c :close<CR>

"Remap recording so it does not get in the way
nnoremap Q q
nnoremap q <Nop>

"vimux shortcuts
nnoremap <leader>vz :VimuxZoomRunner<CR>
nnoremap <leader>vr :VimuxPromptCommand<CR>
