#!/bin/zsh

## Find-in-file - usage: fif <SEARCH_TERM>
_fif() {
    if [ ! "$#" -gt 0 ]; then
        echo "Need a string to search for!:\n usage: fif <SEARCH TERM>";
        return 1;
    fi

    rg --files-with-matches --no-messages "$1" | \
        fzf $FZF_PREVIEW_WINDOW --preview "rg --ignore-case --pretty --context 10 '$1' {}"
}
