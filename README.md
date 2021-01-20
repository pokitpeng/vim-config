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
yum install -y epel-release gcc

# ctags
yum install -y ctags

# golang
curl -sLf https://gitee.com/banbaolatiao/shell_scripts/raw/master/install_golang/install_golang.sh | bash

# nodejs
curl -sL install-node.now.sh/lts | bash
npm config set registry https://registry.npm.taobao.org/
npm install -g neovim

# yarn
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash

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
```bash
git clone https://github.com/pokitpeng/vim-config.git ~/.config/nvim
```
