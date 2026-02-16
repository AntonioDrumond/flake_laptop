if status is-interactive
    set -g fish_greeting ""

    ## Aliases
    # FZF Utils
    alias fzf='fzf --preview="bat --color=always {}"'
    alias ff='cd $(find * -type d | fzf)'
    alias vzf='vi $(fzf)'

    # OS Utils
    # alias nixconf='sudo -E vim /etc/nixos/configuration.nix'
    alias rebSwitch='sudo nixos-rebuild switch --flake ~/repos/flake_laptop/#nixos'
    alias rebBoot='sudo nixos-rebuild boot --flake ~/repos/flake_laptop/#nixos'
    alias rebTest='sudo nixos-rebuild test --flake ~/repos/flake_laptop/#nixos'

    # Other
    alias la='ls -a'
    alias obp='obipull'
    alias nix-shell="nix-shell --run fish"

    # Ricing
    # alias obsidian="obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland"
    alias imgcat='wezterm imgcat'
    alias icat='kitty +kitten icat'
    alias ls='exa --icons --group-directories-first'
    alias clear="printf '\033[2J\033[3J\033[1;1H'"

    export EDITOR="vim"

    ## Completions
    complete -c mkboiler -a "default.nix shell.nix nix_module mod.nix module.nix c cc cplusplus c++ cpp python13 rustshell rustShell rust_shell icedshell iced_shell icedShell" -f
end
