if status is-interactive
    fish_add_path ~/bin
    fish_add_path /opt/homebrew/bin

    atuin init fish | source
    zoxide init fish | source
    starship init fish | source
end
