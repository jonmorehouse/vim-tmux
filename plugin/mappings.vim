"""
"   Public Mappings 
""" 
" generic command
command! -nargs=* Tmux :call tmux#Runner(<f-args>)
" delete the window
command TmuxDelete :call tmux#Delete()
" repeat command
command! TmuxRepeat :call tmux#Repeat()

" map rr to the previous command
map <Leader>tt :call tmux#Repeat()<CR>

" generate lower case mappings



