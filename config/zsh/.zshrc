#!/bin/zsh

export ZSHDOT="${home}"/.config/zsh

# History
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
# Completion
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' # Case insensitive, UNLESS usage of upper case
zstyle ':completion:*' menu select

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Temporary https://github.com/zdharma-continuum/zinit/wiki/%F0%9F%A7%8A-Recommended-ices#fx
# Because of some bug
case "$OSTYPE" in
  linux*) bpick='*((#s)|/)*(linux|musl)*((#e)|/)*' ;;
  darwin*) bpick='*(macos|darwin)*' ;;
  *) echo 'WARN: unsupported system -- some cli programs might not work' ;;
esac
#

# Prompt
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

    # pack"bgn" fzy \ # fuzzy seach with advanced scoring algorithm

### Programs
zinit wait for \
    pack"no-dir-color-swap" ls_colors \
    pack"bgn" fzf \
    pack doctoc # Markdown TOC maker

zinit wait lucid from"gh-r" as"null" for \
    sbin"**/fd"        @sharkdp/fd \
    sbin"**/bat"       @sharkdp/bat \
    sbin"dust*/dust"   @bootandy/dust \
    sbin"delta*/delta" @dandavison/delta

## exa is a modern replacement for ls.
zinit wait lucid for \
    atclone'cp -vf completions/exa.zsh _exa'  \
    from'gh-r' \
    sbin'**/exa' \
  ogham/exa

## Modern ps replacement
zi for \
    from'gh-r' \
    sbin'**/procs -> procs' \
  dalance/procs

### Plugins
zinit wait lucid for \
    wfxr/forgit \
    joshskidmore/zsh-fzf-history-search \
    hlissner/zsh-autopair

## https://zdharma-continuum.github.io/zinit/wiki/Example-Minimal-Setup/
zinit wait lucid for \
    atinit"zicompinit; zicdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    atload"_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    blockf atpull'zinit creinstall -q .' \
        zsh-users/zsh-completions

# Rust
if [ -d "$HOME/.cargo" ]; then
    source $HOME/.cargo/env
fi

# Vulkan
if [ -d "$HOME/vulkan" ]; then
    VULKAN_SDK="${HOME}/vulkan/1.3.211.0/x86_64"
    export VULKAN_SDK
    PATH="$VULKAN_SDK/bin:$PATH"
    export PATH
    LD_LIBRARY_PATH="$VULKAN_SDK/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
    export LD_LIBRARY_PATH
    VK_ADD_LAYER_PATH="$VULKAN_SDK/etc/vulkan/explicit_layer.d${VK_ADD_LAYER_PATH:+:$VK_ADD_LAYER_PATH}"
    export VK_ADD_LAYER_PATH
    if [ -n "$VK_LAYER_PATH" ]; then
        echo "Unsetting VK_LAYER_PATH environment variable for SDK usage"
        unset VK_LAYER_PATH
    fi
fi

## Load extra modules / functions etc
for module in "${HOME}"/.config/zsh/*
do
    if [ -f "${module}" ]; then
        . "${module}"
    fi
done
