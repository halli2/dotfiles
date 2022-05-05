### Misc functions used by aliases

_cheat() {
    if [ -z "${1}" ]; then
        curl -fLm 7 "https://cheat.sh" | bat
    else
        curl -fLm 7 "https://cheat.sh/${@}" | bat
    fi
}

