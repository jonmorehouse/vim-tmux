# Vim Tmux Mapping

> Run commands in a tmux window pane

## Use Cases

This plugin is useful for reducing development-test-run cycles. Run your project's command in a split pane, or a session.worker of your choice.

By default `:Tmux ls` will split the current window (if single pane) or use pane 1

For normal use, you will run a single command `:Tmux make test` and then as you develop and need to test you can run the same command by `:TmuxRunAgain` or simply `<Leader> tt`

## Configuration Options

### Custom Tmux Session
> Run command in a different session

  ` let g:tmuxSession="some_other_session_name"`

### Custom Tmux Pane (instead of #1)
> Specify a specific pane to run commands in

  ```
    let g:tmuxPane="some_other_pane"
  ```

## Not working / new ideas?
Feel free to make pull requests or open up new issues

## License
> MIT
