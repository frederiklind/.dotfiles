# TMUX - Terminal multiplexer

To start tmux session, simply run the `tmux` command.

```bash
# start tmux session
$ tmux
```

## Keybindings
Prefix: `<C-b>`, replaced by `<C-a>` in the tmux configuration file.

- Vertical split: `<prefix>%`
- Horizontal split: `<prefix>"`
- Pane navigation: `<prefix>arrow-key`
- Resize panes: `<prefix>`


## Color support

For supporting colors in application like neovim etc, the following can be added to the alacritty configuration in `alacritty.toml`

```toml
[env]
TERM = "xterm-256color"
```

