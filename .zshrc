# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Have to explicitly set emacs mode since editor mode is vi
bindkey -e

export EDITOR="nvim"
export PATH="$HOME/bin:/opt/homebrew/bin:$PATH"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"

# For 1Password ssh integration
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# https://github.com/junegunn/fzf
eval "$(fzf --zsh)"

# Stores command history
eval "$(atuin init zsh)"

# Smarter cd: z, autojump
eval "$(zoxide init zsh)"


source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# aliases
alias ev="nvim ~/.config/nvim/init.lua"
alias ez="nvim ~/.zshrc"
alias sz="source ~/.zshrc"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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
