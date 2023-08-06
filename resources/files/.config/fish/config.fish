if status is-interactive
    fish_add_path ~/bin
    fish_add_path /opt/homebrew/bin

    atuin init fish | source
    zoxide init fish | source
    starship init fish | source

    alias lz="lazygit"
    alias dotfiles="bb -f ~/.dotfiles/bb.edn main"
    alias sb=". ~/.config/fish/config.fish"
end
