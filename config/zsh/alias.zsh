#!/bin/zsh

for module in "${ZDOTDIR}"/alias/*
do
    . "${module}"
done

## File searching utilities
alias ls="exa -a"
alias fif="_fif" # "find_in_file"

## Miscellaneous.
alias cheat="_cheat"

## Version control
alias gp="git_push"
alias gc="git commit"

# forgit_log=glo
# forgit_diff=gd
# forgit_add=ga
# forgit_reset_head=grh
# forgit_ignore=gi
# forgit_checkout_file=gcf
# forgit_checkout_branch=gcb
# forgit_checkout_tag=gct
# forgit_checkout_commit=gco
# forgit_revert_commit=grc
# forgit_clean=gclean
# forgit_stash_show=gss
# forgit_cherry_pick=gcp
# forgit_rebase=grb
# forgit_fixup=gfu
