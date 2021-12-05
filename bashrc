#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# source /home/halli/.config/broot/launcher/bash/br
export MOZ_DBUS_REMOTE = !
. "$HOME/.cargo.env"
. "$HOME/.cargo/env"
