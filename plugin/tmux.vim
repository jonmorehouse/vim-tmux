"""
"   Public Wrapper Functions (ie: called from command mappings)
"""
fu! Tmux#Runner(...)
  " run in the split section here
  " if we don't have a second window - then go ahead and create one
  if Tmux#GetPanes() <= 1 
    call system("tmux split-window -hd")
  endif

  call Tmux#PaneCommand(Tmux#GetPane(), join(a:000, " "))
endfunction

" run the previous command again
fu! Tmux#Repeat()
  if !exists("g:tmuxLastCommand")
    return
  endif
  call Tmux#RunCommand(g:tmuxLastCommand)
endfunction

" delete the tmux worker pane
fu! Tmux#Delete()
  if !exists("g:tmuxLastCommand")
    return
  endif
  call Tmux#DeletePane(Tmux#GetPane())
endfunction

"""
"   Public functions 
"""
fu! Tmux#PaneCommand(pane, command)
  " generate tmux command to send keys
  let command="tmux send-keys -t .". a:pane ." \"". a:command . "\" ENTER"
  echo command
  call Tmux#RunCommand(command)
endfunction

fu! Tmux#DeletePane(pane)
  let command="tmux kill-pane -t ". a:pane
  call Tmux#RunCommand(command)
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



