#!/usr/bin/env bash

set -e

VERSION="v1.0"
GITCOMMIT=$(git rev-parse --short HEAD)
BASE_DIR=$(cd $(dirname $0); pwd -P)



function displayVersion() {
    echo "$VERSION.$GITCOMMIT"
}

function log() {
    if [ "$1"x = "red"x ]; then
        echo -e "\033[1;31m"$*"\033[0m"
    elif [ "$1" = "green" ]; then
        echo -e "\033[1;32m"$*"\033[0m"
    elif [ "$1" = "yellow" ]; then
        echo -e "\033[1;33m"$*"\033[0m"
    elif [ "$1" = "blue" ]; then
        echo -e "\033[1;34m"$*"\033[0m"
    else
        # -e 开启转义
        echo -e $*
    fi
}

function perpare(){
    log blue "perpare base env ..."
    yum install -y wget python3-neovim
    curl -sL install-node.now.sh/lts | bash
    curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
}

# check os
function checkOS() {
    if [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentOS, etc.
        OS=$(cat /etc/redhat-release | awk '{print $2}')
        NAME=$(cat /etc/redhat-release | awk '{print $1}')
        VERSION=$(cat /etc/redhat-release | awk '{print $4}')
        if [[ $OS == "Linux" ]] && [[ $NAME == "CentOS" ]] && [[ $VERSION =~ "7.4" ]]; then
            echo "Support OS!"
        else
            log red "Not Centos 7 OS!"
            exit 1
        fi
    else
        log red "Not Centos 7 OS!"
        exit 1
    fi
}

function CheckCommand(){
    # $1: command  , eg: git
    if ! type $1 >/dev/null 2>&1; then
        log red "-bash: $1: command not found"
        exit 1
    fi
}

function install(){
    # install neovim
    log blue "start install neovim ..."
    wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage -P /usr/local/
    cd /usr/local/
    chmod +x nvim.appimage
    ./nvim.appimage --appimage-extract
    ln -s /usr/local/squashfs-root/usr/bin/nvim /usr/local/bin/nvim
    ln -s /usr/local/squashfs-root/usr/bin/nvim /usr/local/bin/nv
    rm -rf nvim.appimage
    log green "install neovim success"

    # install vim-plug
    log blue "start install vim-plug ..."
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    log green "install vim-plug success"
}

function config(){
    if ! type nvim >/dev/null 2>&1; then
        log yellow "nvim not install, start install ..."
        install
    fi
    cd $BASE_DIR
    mkdir -p ~/.config/nvim/
    cp ./init.vim ~/.config/nvim/
    cp ./coc-settings.json ~/.config/nvim/

    log blue "open nvim, use :PlugInstall :GoInstallBinaries  :call coc#util#install() install and config."
}

function remove(){
    rm -rf /usr/local/squashfs-root
    rm -rf /usr/local/bin/nvim
    rm -rf /usr/local/bin/nv
    log green "remove neovim success"
    removec
}

function removec(){
    rm -rf ~/.config
    rm -rf ~/.local
    log green "remove neovim config success"
}

# The command line help
function display_help() {
    echo "Usage: $0 [option...]" >&2
    echo
    echo "   install            install nvim"
    echo "   config             config nvim, if not install nvim, it will be auto install"
    echo "   remove             remove nvim, it will be remove config"
    echo "   removec            remove nvim config"
    echo "   version            display version"
    echo "   help               display help"
    echo
}

# Check if parameters options are given on the commandline
case "$1" in
install)
    checkOS
    install
    ;;
config)
    config
    ;;
remove)
    checkOS
    remove
    ;;
removec)
    removec
    ;;
-v | --version | version)
    displayVersion
    ;;
-h | --help | help)
    display_help
    ;;
*) # No more options
    display_help
    exit 1
    ;;
esac
