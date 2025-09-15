# Have to explicitly set emacs mode since editor mode is vi
bindkey -e

export EDITOR="nvim"
export PATH="$HOME/bin:/opt/homebrew/bin:$PATH"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

# For 1Password ssh integration
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock
export OP_BIOMETRIC_UNLOCK_ENABLED=true

# https://github.com/junegunn/fzf
eval "$(fzf --zsh)"

# Stores command history
eval "$(atuin init zsh)"

# Smarter cd: z, autojump
eval "$(zoxide init zsh)"

# prompt https://starship.rs
eval "$(starship init zsh)"

alias kp='kubectl -n production --context gke_sf-2021-production-common_us-west1_production'

# source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
# source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

# aliases
alias ev="nvim ~/.config/nvim/init.lua"
alias ez="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias dotfiles="cd ~/.dotfiles"

# bit
case ":$PATH:" in
  *":/Users/tmalloy/bin:"*) ;;
  *) export PATH="$PATH:/Users/tmalloy/bin" ;;
esac
# bit end

# pnpm
export PNPM_HOME="/Users/tmalloy/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


. "$HOME/.local/share/../bin/env"
