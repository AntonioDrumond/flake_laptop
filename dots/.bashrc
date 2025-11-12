# FZF Utils
alias fzf='fzf --preview="bat --color=always {}"'
alias ff='cd $(find * -type d | fzf)'
alias vzf='vi $(fzf)'

# OS Utils
# alias nixconf='sudo -E vim /etc/nixos/configuration.nix'
alias rebSwitch='sudo nixos-rebuild switch --flake ~/repos/flake_laptop/'
alias rebBoot='sudo nixos-rebuild boot --flake ~/repos/flake_laptop/'
alias rebTest='sudo nixos-rebuild test --flake ~/repos/flake_laptop/'

# Other
alias la='ls -a'
alias obp='obipull'

# Ricing
# alias obsidian="obsidian --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias imgcat='wezterm imgcat'
alias icat='kitty +kitten icat'
alias ls='exa --icons --group-directories-first'
alias clear="printf '\033[2J\033[3J\033[1;1H'"

# alias nvim="nix run 'github:antoniodrumond/nixvim'"

export EDITOR="vim"

# nerd
# neofetch
