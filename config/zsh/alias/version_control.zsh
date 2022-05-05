git_add() {
    if [ -z "${1}" ]; then
        git add . --verbose
    else
        git add "${@}" --verbose
    fi
}

git_push() {
    git push --verbose
}
