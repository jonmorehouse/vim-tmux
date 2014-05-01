"""
"   Public Mappings 
""" 
" generic command
command! -nargs=* Tmux :call Tmux#Runner(<q-args>)
command! TmuxRunAgain :call Tmux#RunAgain()

" map rr to the previous command
map <Leader>tt :call Tmux#RunAgain()<CR>


