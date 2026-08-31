#! /bin/zsh

HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
# setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-defer
source /usr/share/zsh/plugins/zsh-defer/zsh-defer.plugin.zsh

# zsh-history-substring-search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# zsh-syntax-highlighting - deferred for faster startup
zsh-defer source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-vi-mode - deferred for faster startup
ZVM_KEYTIMEOUT=0.1
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
ZVM_VI_ESCAPE_BINDKEY=kj
ZVM_VI_INSERT_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
ZVM_VI_VISUAL_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
ZVM_VI_OPPEND_ESCAPE_BINDKEY=$ZVM_VI_ESCAPE_BINDKEY
zsh-defer source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh

# Defer autosuggestions keybindings for faster startup
zsh-defer bindkey "^Y" autosuggest-accept
zsh-defer bindkey "^E" autosuggest-clear

# yazi file manager integration
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

load_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# Wrapper functions that load NVM on first use, then remove themselves
nvm() { unset -f nvm node npm npx yarn pnpm pnpx bun bunx 2>/dev/null; load_nvm; nvm "$@"; }
node() { unset -f nvm node npm npx yarn pnpm pnpx bun bunx 2>/dev/null; load_nvm; node "$@"; }
npm() { unset -f nvm node npm npx yarn pnpm pnpx bun bunx 2>/dev/null; load_nvm; npm "$@"; }
npx() { unset -f nvm node npm npx yarn pnpm pnpx bun bunx 2>/dev/null; load_nvm; npx "$@"; }
yarn() { unset -f nvm node npm npx yarn pnpm pnpx bun bunx 2>/dev/null; load_nvm; yarn "$@"; }
pnpm() { unset -f nvm node npm npx yarn pnpm pnpx bun bunx 2>/dev/null; load_nvm; pnpm "$@"; }
pnpx() { unset -f nvm node npm npx yarn pnpm pnpx bun bunx 2>/dev/null; load_nvm; pnpx "$@"; }
bun() { unset -f nvm node npm npx yarn pnpm pnpx bun bunx 2>/dev/null; load_nvm; bun "$@"; }
bunx() { unset -f nvm node npm npx yarn pnpm pnpx bun bunx 2>/dev/null; load_nvm; bunx "$@"; }

# Cached initialization for faster startup
cache_dir="$HOME/.cache/zsh"
mkdir -p "$cache_dir"

# Function to cache command output
cache_init() {
    local cmd="$1"
    local cache_file="$cache_dir/${cmd}.zsh"
    local max_age=86400  # 1 day in seconds

    if [[ ! -f "$cache_file" ]] || [[ $(($(date +%s) - $(stat -c %Y "$cache_file" 2>/dev/null || stat -f %m "$cache_file" 2>/dev/null))) -gt $max_age ]]; then
        case $cmd in
            starship) starship init zsh > "$cache_file" 2>/dev/null ;;
            zoxide) zoxide init --cmd cd zsh > "$cache_file" 2>/dev/null ;;
        esac
    fi
    [[ -f "$cache_file" ]] && source "$cache_file"
}

# zoxide - fast directory jumper
# eval "$(zoxide init --cmd cd zsh)"
cache_init zoxide

# starship - cross-shell prompt
# eval "$(starship init zsh)"
cache_init starship

# fzf - command-line fuzzy finder
source <(fzf --zsh)

# atuin - command line history db
eval "$(atuin init zsh)"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# eza
alias l="eza --long --all --hyperlink --icons --mounts --git --git-repos --header"
alias lt="eza --tree --all --level=2 --long --hyperlink --icons --mounts --git --git-repos --header"
alias tree="eza --tree --all --level=2 --icons"

# fastfetch
alias fastfetch="fastfetch --kitty-icat ~/.config/fastfetch/pngs/arch.png"

# Gemini-cli
alias gemini-cli="gemini -m \"gemini-2.5-pro\""

# VSCodium
alias codium="vscodium-electron"

# # Wayland scaling fixes for Electron apps
# alias slack='slack --ozone-platform=wayland --enable-features=WaylandWindowDecorations --disable-features=WaylandFractionalScaleV1'
# alias discord='discord --enable-features=UseOzonePlatform --ozone-platform=x11'

# Startup commands
# eval "$(pyenv init -)"
# fastfetch
