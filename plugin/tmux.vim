"""
"   Public Wrapper Functions (ie: called from command mappings)
"""
fu! Tmux#TmuxRunner(command)

endfunction

"""
"   Public functions 
"""
fu! Tmux#PaneCommand(pane, command)
  " generate tmux command to send keys
  let tmuxCommand="tmux send-keys -t .". a:pane ." ". a:command . " ENTER"
  call Tmux#RunCommand(tmuxCommand)
endfunction

"""
"   Private Functions
"""
fu! Tmux#GetSession()
  if !exists("g:tmuxSession")
    let result=system("tmux display-message -p '#S'")
    let g:tmuxSession=substitute(result, '\n$', '', '')
  endif
  return g:tmuxSession
endfunction

fu! Tmux#GetPane()
  return "1"
endfunction

fu! Tmux#RunCommand(command)
  let command="printf \"\033c\" && ". a:command
  call system(a:command)
endfunction

fu! System(command)

endfunction



