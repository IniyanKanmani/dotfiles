# editor
export EDITOR=nvim

# fzf
source <(fzf --zsh)

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
    --highlight-line \
    --info=inline-right \
    --ansi \
    --layout=reverse \
    --border=none
    --color=bg+:#283457 \
        --color=bg:-1 \
        --color=border:#27a1b9 \
        --color=fg:#c0caf5 \
        --color=gutter:-1 \
        --color=header:#ff9e64 \
        --color=hl+:#2ac3de \
        --color=hl:#2ac3de \
        --color=info:#545c7e \
        --color=marker:#ff007c \
        --color=pointer:#ff007c \
        --color=prompt:#2ac3de \
        --color=query:#c0caf5:regular \
        --color=scrollbar:#27a1b9 \
        --color=separator:#ff9e64 \
        --color=spinner:#ff007c \
        "

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# eza
alias l="eza --long --all --hyperlink --icons --mounts --git --git-repos --total-size --header"
alias lt="eza --tree --level=2 --long --hyperlink --icons --mounts --git --git-repos --total-size --header"

export EZA_CONFIG_DIR="$HOME/.config/eza"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# starship
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Environment variables
export CHROME_EXECUTABLE=/Applications/Arc.app/Contents/MacOS/Arc

