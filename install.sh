#!/usr/bin/env bash
# Symlink dotfiles for this machine. Idempotent; backs up anything it replaces.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

case "$(uname -s)" in
  Darwin) OS=macos ;;
  Linux)  OS=ubuntu ;;
  *) echo "unsupported OS: $(uname -s)" >&2; exit 1 ;;
esac
echo "==> detected $OS"

link() {                       # link <source> <target>
  local src="$1" dst="$2"
  [ -e "$src" ] || { echo "    skip (missing): $src"; return; }
  mkdir -p "$(dirname "$dst")"
  if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
    echo "    ok: ${dst/#$HOME/~}"; return
  fi
  if [ -e "$dst" ] || [ -L "$dst" ]; then
    mkdir -p "$BACKUP/$(dirname "${dst/#$HOME/}")"
    mv "$dst" "$BACKUP/${dst/#$HOME/}"
    echo "    backed up: ${dst/#$HOME/~}"
  fi
  ln -s "$src" "$dst"
  echo "    linked: ${dst/#$HOME/~}"
}

echo "==> common"
link "$DOTFILES/common/tmux/tmux.conf" "$HOME/.tmux.conf"
link "$DOTFILES/common/vim/vimrc"      "$HOME/.vimrc"
link "$DOTFILES/common/nvim"           "$HOME/.config/nvim"

if [ "$OS" = macos ]; then
  echo "==> macos"
  link "$DOTFILES/macos/zsh/zshrc"                 "$HOME/.zshrc"
  link "$DOTFILES/macos/kitty/kitty.conf"          "$HOME/.config/kitty/kitty.conf"
  link "$DOTFILES/macos/kitty/current-theme.conf"  "$HOME/.config/kitty/current-theme.conf"
  echo "    (brew bundle --file=$DOTFILES/macos/Brewfile  to install packages)"
else
  echo "==> ubuntu"
  link "$DOTFILES/ubuntu/bash/bashrc"       "$HOME/.bashrc"
  link "$DOTFILES/ubuntu/bash/bash_profile" "$HOME/.bash_profile"
  link "$DOTFILES/ubuntu/x/Xresources"      "$HOME/.Xresources"
  link "$DOTFILES/ubuntu/x/xinitrc"         "$HOME/.xinitrc"
  link "$DOTFILES/ubuntu/x/xmobarrc"        "$HOME/.xmobarrc"
  link "$DOTFILES/ubuntu/xmonad/xmonad.hs"  "$HOME/.xmonad/xmonad.hs"
  link "$DOTFILES/ubuntu/htop/htoprc"       "$HOME/.config/htop/htoprc"
fi

mkdir -p "$HOME/.vim/undodir" "$HOME/.cache/vim/undo"
echo "==> done${BACKUP:+ (replaced files in ${BACKUP/#$HOME/~})}"
