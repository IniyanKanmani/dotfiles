#! /bin/zsh

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.cache/.bun/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"
export PATH="$HOME/development/flutter/bin:$PATH"
export PATH="$HOME/development/ghostty/bin:$PATH"
export PATH="$HOME/Documents/learning/boot_dev/worldbanc/private/bin:$PATH"

# Other Variables
export EDITOR=nvim
export SYSTEMD_EDITOR=nvim

export HISTFILE="$HOME/.zsh_history"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export CHROME_EXECUTABLE="/usr/bin/brave"
export ANDROID_HOME="$HOME/development/Android/Sdk"
export GOPATH="$HOME/development/go"
export PYENV_ROOT="$HOME/.pyenv"
export NLTK_DATA="$HOME/.nltk_data"
export NVM_DIR="$HOME/.config/nvm"

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export EZA_CONFIG_DIR="$HOME/.config/eza"
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
    --highlight-line \
    --info=inline-right \
    --ansi \
    --layout=reverse \
    --border=rounded \
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

# Opencode Variables
export OPENCODE_ADVISOR_LEVEL=normal
export OPENCODE_EXPERIMENTAL_BACKGROUND_SUBAGENTS=true

# OpenChamber Variables
export OPENCHAMBER_HOST=0.0.0.0
export OPENCODE_SKIP_START=true
export OPENCODE_HOST=http://localhost:4096

# Secrets and API keys (gitignored)
[ -f "$HOME/.config/zsh/apikeys.zsh" ] && source "$HOME/.config/zsh/apikeys.zsh"
