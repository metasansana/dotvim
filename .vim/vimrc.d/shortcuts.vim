
"Quick save with out all the drama
inoremap <C-s> <ESC>:update<CR>
nnoremap <C-S> :update<CR>

"vertical split
nnoremap <silent> vv <C-w>v

"horizontal split
nnoremap <silent> hh <C-w>s

"switch to the next tab
nnoremap <C-m> :tabn<CR> 

"switch to the previous tab
nnoremap <C-n> :tabp<CR>

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
nnoremap <leader>vl :VimuxRunLastCommand<CR>

"cancel editing in insert mode
inoremap <C-x> <ESC> u

"fugitive shortcuts for gitting things done
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>ga :Gwrite<CR>
nnoremap <leader>gc :Gcommit<CR>

"Run vim-autoformat on the current buffer
nnoremap <leader>f :Autoformat<CR>