#!/usr/bin/env bash

function log() {
    if [ "$1"x = "red"x ]; then
        echo -e "\033[1;31m"$2"\033[0m"
    elif [ "$1" = "green" ]; then
        echo -e "\033[1;32m"$2"\033[0m"
    elif [ "$1" = "yellow" ]; then
        echo -e "\033[1;33m"$2"\033[0m"
    elif [ "$1" = "blue" ]; then
        echo -e "\033[1;34m"$2"\033[0m"
    else
        # -e 开启转义
        echo -e $*
    fi
}

# check os
function checkOS() {
    if [ -f /etc/redhat-release ]; then
        # Older Red Hat, CentOS, etc.
        OS=$(cat /etc/redhat-release | awk '{print $2}')
        NAME=$(cat /etc/redhat-release | awk '{print $1}')
        VERSION=$(cat /etc/redhat-release | awk '{print $4}')
        if [[ $OS == "Linux" ]] && [[ $NAME == "CentOS" ]]; then
            echo "Support OS!"
        else
            log red "Not Centos OS!"
            exit 1
        fi
    else
        log red "Not Centos OS!"
        exit 1
    fi
}

function init() {
    # checkOS
    log blue "init base env ..."
    # rpm -qa | grep fuse || yum install -y fuse-libs fuse fuse-devel
    # rpm -qa | grep nodejs || yum install -y nodejs
    # rpm -qa | grep python3 || yum install -y python3

    wget https://ghproxy.com/https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod u+x ./nvim.appimage

    ./nvim.appimage --appimage-extract
    mv squashfs-root / && ln -s /squashfs-root/AppRun /usr/bin/nvim

    # pip3 install neovim --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple
    # npm install n -g
    # n 14.15.2
    # npx nrm use taobao
    # npm install -g yarn
    # npm install -g yrm
    # yrm use taobao
}

function remove() {
    log blue "remove nvim config ..."
    rm -rf ~/.config/nvim
    rm -rf ~/.config/coc
    rm -rf ~/.config/configstore
    rm -rf ~/.config/plugged
    rm -rf ~/.local/share/nvim
    log green "remove neovim config success"
}

# 基础配置, 可多次执行实现reload的效果
function base() {
    /bin/cp -rf ./.vimrc ~/.vimrc
    mkdir -p ~/.config/nvim
    /bin/cp -rf ./keymaps.vim ~/.config/nvim/keymaps.vim
    /bin/cp -rf ./init.vim ~/.config/nvim/init.vim
}

# 进阶配置
function pro() {
    base
    # install vim-plug
    curl --retry 3 -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://codechina.csdn.net/mirrors/junegunn/vim-plug/-/raw/master/plug.vim
    # 更换vim-plug下载源
    # hub.fastgit.org
    # github.com.cnpmjs.org
    grep cnpm ~/.local/share/nvim/site/autoload/plug.vim >/dev/null && echo "already exist" || sed -i "s|github.com|github.com.cnpmjs.org|g" ~/.local/share/nvim/site/autoload/plug.vim
    /bin/cp -rf ./plugins.vim ~/.config/nvim/plugins.vim
}

# 用于更新配置后重新生效配置, 进阶使用
function reload() {
    /bin/cp -rf ./plugins.vim ~/.config/nvim/plugins.vim
}

# The command line help
function display_help() {
    echo "Usage: $0 [option...]" >&2
    echo
    printf "\033[36m%-20s\033[0m %-20s\n" "init" "初始化环境，会安装基础依赖"
    printf "\033[36m%-20s\033[0m %-20s\n" "base" "应用基础配置，包括vimrc和按键映射"
    printf "\033[36m%-20s\033[0m %-20s\n" "pro" "进阶配置，这里都是插件相关"
    printf "\033[36m%-20s\033[0m %-20s\n" "reload" "插件相关的reload"
    printf "\033[36m%-20s\033[0m %-20s\n" "remove" "移除所有配置包括插件"
    echo
}

# Check if parameters options are given on the commandline
case "$1" in
init)
    init
    ;;
base)
    base
    ;;
pro)
    pro
    ;;
reload)
    reload
    ;;
remove)
    remove
    ;;
-h | --help | help)
    display_help
    ;;
*) # No more options
    display_help
    exit 1
    ;;
esac