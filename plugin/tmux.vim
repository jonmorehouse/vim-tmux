"""
"   Public Wrapper Functions (ie: called from command mappings)
"""
fu! Tmux#Runner(command)
  " run in the split section here
  " if we don't have a second window - then go ahead and create one
  if Tmux#GetPanes() <= 1 
    call system("tmux split-window -hd")
  endif
  call Tmux#PaneCommand(Tmux#GetPane(), a:command)
endfunction

" run the previous command again
fu! Tmux#RunAgain()
  if !exists("g:tmuxLastCommand")
    return
  endif
  call Tmux#RunCommand(g:tmuxLastCommand)
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
    let g:tmuxSession=System("tmux display-message -p '#S'")
  endif
  return g:tmuxSession
endfunction

fu! Tmux#GetPanes()
  " get number of commands
  return eval(System("tmux list-panes | wc -l"))
endfunction

fu! Tmux#GetPane()
  if exists("g:tmuxPane")
    return g:tmuxPane
  else
    return "1"
  endif
endfunction

fu! Tmux#RunCommand(command)
  let g:tmuxLastCommand=a:command
  let command="printf \"\033c\" && ". a:command
  call system(command)
endfunction

fu! System(command)
  let output=system(a:command)
  return substitute(output, '\n$', '', '')
endfunction


