if exists("g:vim_tmux_loaded") || &cp
  finish
endif
let g:vim_tmux_loaded = 1

" generic command
command! -nargs=* Tmux :call Tmux#Runner(<f-args>)
" delete the window
command TmuxDelete :call Tmux#Delete()
" repeat command
command! TmuxRepeat :call Tmux#Repeat()

" map rr to the previous command
map <Leader>tt :call Tmux#Repeat()<CR>


