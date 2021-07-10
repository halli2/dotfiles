# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/halli/.zshrc'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh


autoload -Uz compinit
compinit
# End of lines added by compinstall


# Zplug, plugin manager. https://github.com/zplug/zplug
source /usr/share/zsh/scripts/zplug/init.zsh

#fzf
zplug 'junegunn/fzf'
# Jump to direcories you frequent 'z --help'
zplug 'agkozak/zsh-z'

zplug 'zsh-users/zsh-autosuggestions'
# Keep at end?
zplug 'zsh-users/zsh-syntax-highlighting', defer:2

# Git plugin from oh-my-zsh
zplug 'plugins/git', from:oh-my-zsh

# Load theme
zplug 'romkatv/powerlevel10k', as:theme, depth:1

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commants to $PATH
zplug load #--verbose


#Aliases
alias ls='ls --color'
alias ll='ls -al --color'
alias -g L='| less'
alias yeet='yay -Rsc'
alias gsa='grimshot save area'
alias swayl='swaylock -c 000000'
alias yays='yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S'
alias yeets='yay -Qq | fzf --multi --preview "yay -Qi {1}" | xargs -rp yay -Rns'
#alias yayss='yay -Slq | fzf --multi --preview \'cat <(yay -Si {1}= <(yay -Fl {1} | awk "{print \$2}")\' | xargs -ro sudo yay -S'

# param alias
search_man() {
    man $1 | grep -- $2
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
