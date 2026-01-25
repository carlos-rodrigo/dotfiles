#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info() { echo -e "${GREEN}[INFO]${NC} $1"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $1"; }
error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Configs to symlink to ~/.config/
CONFIGS=(
  "nvim"
  "opencode"
  "starship"
  "tmux"
  "yarn"
  "atuin"
  "amp"
  "agents"
)

backup_and_link() {
  local src="$1"
  local dest="$2"
  
  if [ -L "$dest" ]; then
    info "Removing existing symlink: $dest"
    rm "$dest"
  elif [ -e "$dest" ]; then
    warn "Backing up existing: $dest -> ${dest}.backup"
    mv "$dest" "${dest}.backup"
  fi
  
  info "Linking: $src -> $dest"
  ln -s "$src" "$dest"
}

main() {
  echo "========================================="
  echo "  Dotfiles Installation"
  echo "========================================="
  echo ""
  
  # Ensure ~/.config exists
  mkdir -p "$CONFIG_DIR"
  
  # Link each config
  for config in "${CONFIGS[@]}"; do
    src="$DOTFILES_DIR/$config"
    dest="$CONFIG_DIR/$config"
    
    if [ -d "$src" ]; then
      backup_and_link "$src" "$dest"
    else
      warn "Config not found: $src"
    fi
  done
  
  # Special case: starship.toml should also be linked directly to ~/.config/
  # (some setups expect it at ~/.config/starship.toml instead of ~/.config/starship/)
  if [ -f "$DOTFILES_DIR/starship/starship.toml" ]; then
    backup_and_link "$DOTFILES_DIR/starship/starship.toml" "$CONFIG_DIR/starship.toml"
  fi
  
  echo ""
  echo "========================================="
  info "Installation complete!"
  echo ""
  echo "Post-install steps:"
  echo "  - tmux: run 'prefix + I' to install plugins via TPM"
  echo "  - nvim: run 'nvim' to let lazy.nvim install plugins"
  echo "  - opencode: run 'cd ~/.config/opencode && bun install'"
  echo "========================================="
}

main "$@"
