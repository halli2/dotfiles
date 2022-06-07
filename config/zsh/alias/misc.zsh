### Misc functions used by aliases


command_exists() {
  command -v "$1" >/dev/null 2>&1
}


_cheat() {
    if [ -z "${1}" ]; then
        curl -fLm 7 "https://cheat.sh" | bat
    else
        curl -fLm 7 "https://cheat.sh/${@}" | bat
    fi
}

## Cd up dirs
## Usage: cd.. 10 or cd.. dir_name
cd_up() {
    case $1 in
        *[!(0-9)]*) # If not a number, find folder matching string
            cd $( pwd | sed -r "s|(.*/$1[^/]*/).*|\1|" ) # cd
            ;; # if folder not found, don't cd
        *)
            cd $(printf "%0.0s../" $(seq 1 $1)); # If a number, cd x folders  upwards
            ;;
    esac
}

_update() {
    if command_exists dnf; then
        echo "Update fedora packages"
        sudo dnf update
    fi

    if command_exists flatpak; then
        echo "Update flatpaks"
        flatpak update
    fi

    if command_exists pipx; then
        echo "Update PIPX"
        pipx upgrade-all
    fi

    if command_exists zinit; then
        echo "Update zinit"
        zinit update
        zinit self-update
    fi

    if command_exists rustup; then
        echo "Update Rustup"
        rustup update
    fi

    if command_exists cargo; then
    echo "Update Cargo Binaries"
        cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ' | grep -v 'cargo-edit' )
        cargo install cargo-edit --features vendored-openssl
    fi
}
