if exists("g:vim_tmux_loaded") || &cp
  finish
endif
let g:vim_tmux_loaded = 1

" generic command
command! -nargs=* Tmux :call tmux#Runner(<f-args>)
" delete the window
command TmuxDelete :call tmux#Delete()
" repeat command
command! TmuxRepeat :call tmux#Repeat()

" map rr to the previous command
map <Leader>tt :call tmux#Repeat()<CR>


