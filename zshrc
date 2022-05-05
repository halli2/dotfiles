# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec sway
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
#bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/halli/.zshrc'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
# Completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' # Case insensitive, UNLESS usage of upper case
zstyle ':completion:*' menu select

# Rustup/cargo(?) tab completions
fpath+=~/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall

# PATH

export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$(gem environment gempath)/bin
export PATH=$PATH:~/.local/share/gem/ruby/3.0.0/bin
export PATH=$PATH:~/scripts
export PATH=$PATH:~/ichibot
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/bin
export VULKAN_SDK=~/vulkan/1.2.198.1/x86_64
export PATH=$VULKAN_SDK/bin:$PATH
export LD_LIBRARY_PATH=$VULKAN_SDK/lib:$LD_LIBRARY_PATH
export VK_LAYER_PATH=$VULKAN_SDK/etc/vulkan/explicit_layer.d
# Zplug, plugin manager. https://github.com/zplug/zplug
# source /usr/share/zsh/scripts/zplug/init.zsh
source ~/.zplug/init.zsh

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

# Vim mode
# zplug 'softmoth/zsh-vim-mode'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commants to $PATH
zplug load #--verbose

# Visuals
ZSH_HIGHLIGHT_STYLES[comment]=fg=125 # $foo did not show at all
setopt interactivecomments

# Defaults
export VISUAL=nvim
export EDITOR=nvim
# export BROWSER=firefox-nightly
export TERMINAL='kitty'
export MOZ_ENABLE_WAYLAND=1
export MOZ_WEBRENDER=1

# Matlab
export _JAVA_AWT_WM_NONREPARENTING=1

#Aliases
alias ls='ls --color'
alias ll='ls -al --color'
alias -g L='| less'
alias yeet='yay -Rsc'
alias gsa='grimshot save area'
alias swayl='swaylock -c 000000'
alias yays='yay -Slq | fzf --multi --preview "yay -Si {1}" | xargs -ro yay -S'
alias yeets='yay -Qq | fzf --multi --preview "yay -Qi {1}" | xargs -rp yay -Rns'
alias pineapple="curl -s https://raw.githubusercontent.com/pineappleEA/Pineapple-Linux/master/pineapple.sh | sh -s --"
#alias yayss='yay -Slq | fzf --multi --preview \'cat <(yay -Si {1}= <(yay -Fl {1} | awk "{print \$2}")\' | xargs -ro sudo yay -S'

# param alias
search_man() {
    man $1 | grep -- $2
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias luamake=/home/halli/ManuallyInstalled/lua-language-server/3rd/luamake/luamake
