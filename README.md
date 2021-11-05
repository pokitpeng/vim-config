# vim-config

## 安装插件前提
- golang环境
- nodejs环境
- yarn
- neovim
- python3环境
- pynvim
- fzf工具
- gcc环境
- ctags

```bash
# gcc
yum install -y fuse-libs fuse fuse-devel

# ctags
yum install -y ctags

# golang
curl -sLf https://gitee.com/banbaolatiao/shell_scripts/raw/master/install_golang/install_golang.sh | bash

# nodejs
npm install n -g
n 14.15.2
npx nrm use taobao
npm install -g yarn
npm install -g yrm
yrm use taobao

# python3
yum install -y python3

# pynvim
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pynvim

# fzf
yum install -y git
git clone --depth 1 https://gitee.com/mirrors/fzf.git ~/.fzf
~/.fzf/install
```

## 使用
- vim-plug命令：https://github.com/junegunn/vim-plug#commands
- coc.nvim插件使用：https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions#install-extensions
