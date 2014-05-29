"""
"   Public Wrapper Functions (ie: called from command mappings)
"""
fu! tmux#Runner(...)
  " run in the split section here
  " if we don't have a second window - then go ahead and create one
  if tmux#GetPanes() <= 1 
    call system("tmux split-window -hd")
  endif

  call tmux#PaneCommand(tmux#GetPane(), join(a:000, " "))
endfunction

" run the previous command again
fu! tmux#Repeat()
  if !exists("g:tmuxLastCommand")
    return
  endif
  call tmux#RunCommand(g:tmuxLastCommand)
endfunction

" delete the tmux worker pane
fu! tmux#Delete()
  if !exists("g:tmuxLastCommand")
    return
  endif
  call tmux#DeletePane(tmux#GetPane())
endfunction

"""
"   Public functions 
"""
fu! tmux#PaneCommand(pane, command)
  " generate tmux command to send keys
  let command="tmux send-keys -t .". a:pane ." \"". a:command . "\" ENTER"
  echo command
  call tmux#RunCommand(command)
endfunction

fu! tmux#DeletePane(pane)
  let command="tmux kill-pane -t ". a:pane
  call tmux#RunCommand(command)
endfunction

"""
"   Private Functions
"""
fu! tmux#GetSession()
  if !exists("g:tmuxSession")
    let g:tmuxSession=System("tmux display-message -p '#S'")
  endif
  return g:tmuxSession
endfunction

fu! tmux#GetPanes()
  " get number of commands
  return eval(System("tmux list-panes | wc -l"))
endfunction

fu! tmux#GetPane()
  if exists("g:tmuxPane")
    return g:tmuxPane
  else
    return "1"
  endif
endfunction

fu! tmux#RunCommand(command)
  let g:tmuxLastCommand=a:command
  let command="printf \"\033c\" && ". a:command
  call system(command)
endfunction

fu! System(command)
  let output=system(a:command)
  return substitute(output, '\n$', '', '')
endfunction



