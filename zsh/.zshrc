# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# eza
alias l="eza --long --all --hyperlink --icons --mounts --git --git-repos --total-size --header"
alias lt="eza --tree --level=2 --long --hyperlink --icons --mounts --git --git-repos --total-size --header"

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

