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

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# eza
alias l="eza --long --all --hyperlink --icons --mounts --git --git-repos --header"
alias lt="eza --tree --all --level=2 --long --hyperlink --icons --mounts --git --git-repos --header"
alias tree="eza --tree --all --level=2 --icons"

export EZA_CONFIG_DIR="$HOME/.config/eza"

# yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# starship
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init zsh)"

# zsh-vi-mode
source $ZVM_PLUGIN_PATH
ZVM_KEYTIMEOUT=0.1
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
ZVM_VI_ESCAPE_BINDKEY=kj
ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY

# zsh-autosuggestions
source $AUTOSUGGEST_PLUGIN_PATH

# delaying key bind so the plugin gets loaded before
zmodload zsh/sched
sched +1 bindkey '^Y' autosuggest-accept
sched +1 bindkey '^E' autosuggest-clear

# zsh-syntax-highlighting
source $SYNTAX_HIGHLIGHT_PLUGIN_PATH

# zsh-history-substring-search
source $HISTORY_SEARCH_PLUGIN_PATH

# Environment variables
export CHROME_EXECUTABLE=/Applications/Arc.app/Contents/MacOS/Arc
