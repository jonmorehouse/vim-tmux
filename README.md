# Vim Tmux

> Run commands in a tmux window pane.

## Use Cases

This plugin is useful for reducing development-test-run cycles. Run your project's command in a split pane, or a session.worker of your choice.

By default `:Tmux will split the current window (if single pane) or use pane 1

For normal use, you will run a single command `:Tmux some_command` and then as you develop and need to test you can run the same command by `:TmuxRepeat` or simply `<Leader> tt`

## Commands

### Run Command
> Pass a shell command to a new,current or specified pane
 ```
  :Tmux ls -alh && echo "HELLO WORLD" 
 ```

### Repeat Last Command
> Run the previous command again
  ```
    :TmuxRepeat
  ```

### Delete Pane
> Delete pane that is running commands
  ```
    :TmuxDelete
  ```

## Configuration Options

### Custom Tmux Session
> Run command in a different session

  ``` 
    let g:tmuxSession="some_other_session_name"
  ```

### Custom Tmux Pane (instead of #1)
> Specify a specific pane to run commands in

  ```
    let g:tmuxPane="some_other_pane"
  ```

## Not working / new ideas?
Feel free to make pull requests or open up new issues

## License
> MIT
