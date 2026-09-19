# dotfiles

Split by platform; `install.sh` detects the OS and symlinks what applies.

```
common/   shared everywhere
  nvim/       neovim config (lazy.nvim, LSP, nvim-cmp, telescope, treesitter)
  tmux/       tmux.conf  — backtick prefix, 1-indexed windows, transparent bar
  vim/        vimrc      — plain vim fallback, no plugins
macos/
  kitty/      kitty.conf + current-theme.conf
  zsh/        zshrc
  Brewfile    brew bundle --file=macos/Brewfile
ubuntu/
  bash/       bashrc, bash_profile
  x/          Xresources, xinitrc, xmobarrc
  xmonad/     xmonad.hs
  htop/       htoprc
```

## Install

```sh
git clone https://github.com/possiblymartin/dotfiles ~/dotfiles
cd ~/dotfiles && ./install.sh
```

Idempotent. Anything it would overwrite is moved to `~/.dotfiles-backup/<timestamp>/` first.

## Notes

- **nvim** needs `ripgrep` and `fd` (telescope) and a C compiler (treesitter).
  Plugins install on first launch; `:Mason` manages language servers.
- **vim and nvim are independent** — `vim` uses `common/vim/vimrc`, `nvim` uses `common/nvim/`.
- **kitty** maps macOS word/line editing keys to readline control bytes,
  so cmd/opt+backspace and cmd/opt+arrows behave natively inside TUIs.
