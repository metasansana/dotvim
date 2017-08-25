
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