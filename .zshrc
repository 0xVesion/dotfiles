function configureZsh {
    export LANG=en_US.UTF-8

    # Supress last login message
    printf '\33c\e[3J'

    # Lines configured by zsh-newuser-install
    HISTFILE="$HOME/.zsh_history"
    HISTSIZE=1000
    SAVEHIST=1000
    setopt notify
    unsetopt autocd beep
    bindkey -v
    # End of lines configured by zsh-newuser-install

    # The following lines were added by compinstall
    zstyle :compinstall filename "$HOME/.zshrc"
    autoload -Uz compinit
    compinit
    # End of lines added by compinstall
}

function initOhMyZsh {
    export ZSH="$HOME/.oh-my-zsh"
    ZSH_THEME=""
    HYPHEN_INSENSITIVE="true"
    zstyle ':omz:update' mode reminder
    zstyle ':omz:update' frequency 31
    ENABLE_CORRECTION="true"
    COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
    source $ZSH/oh-my-zsh.sh
    # disable ZSH auto correction
    unsetopt correct_all  
    setopt correct
}

function loadColorLs {
    source $(dirname $(gem which colorls))/tab_complete.sh
    alias ls=colorls
}

function loadPurePrompt {
    fpath+=("$(brew --prefix)/share/zsh/site-functions")
    autoload -U promptinit; promptinit
    zstyle :prompt:pure:path color white
    prompt pure
}

function setupPath {
    eval "$(brew shellenv)"
    PATH=$PATH:~/go/bin
    PATH=$PATH:~/.pub-cache/bin
}

plugins=(git zsh-z dotenv colorize node docker)
configureZsh
initOhMyZsh
setupPath
loadColorLs
loadPurePrompt

# Setup kcat using docker
alias kcat="docker run -it --network=host edenhill/kcat:1.7.1 -b 127.0.0.1:9092"
alias kcat-tail="kcat -t"

# Set up nvim as editor
alias nano=nvim
alias vim=nvim
alias vi=nvim
export VISUAL=nvim
export EDITOR=$VISUAL
alias lg=lazygit
alias ld=lazydocker

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
