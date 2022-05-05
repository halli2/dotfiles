# Hooks

## Load all needed modules
autoload -U add-zsh-hook

list_current_directory() {
    ## After every cd list the current working directory
    ls
}

## Add list_current_directory to the chpwd hook 
##(zsh automatically calls chpwd() when cd is called)
add-zsh-hook -Uz chpwd list_current_directory
