# FZF Utils
alias fzf='fzf --preview="bat --color=always {}"'
alias ff='cd $(find * -type d | fzf)'
alias vzf='vi $(fzf)'

# OS Utils
alias nixconf='sudo -E vim /etc/nixos/configuration.nix'

# Other
alias la='ls -a'

# Ricing
alias imgcat='wezterm imgcat'
alias ls='exa --icons --group-directories-first'


# nerd
neofetch
