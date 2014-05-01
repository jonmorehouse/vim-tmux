"""
"   Public Mappings 
""" 
" generic command
command! -nargs=* Tmux :call Tmux#Runner(<q-args>)
" delete the window
command TmuxDelete :call Tmux#Delete()
" repeat command
command! TmuxRepeat :call Tmux#Repeat()

" map rr to the previous command
map <Leader>tt :call Tmux#Repeat()<CR>

" generate lower case mappings



