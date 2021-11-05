" 基础使用习惯配置
if filereadable(expand("$HOME/.vimrc"))
    source $HOME/.vimrc
endif
" 按键映射
if filereadable(expand("$HOME/.config/nvim/keymaps.vim"))
    source $HOME/.config/nvim/keymaps.vim
endif
" 插件
if filereadable(expand("$HOME/.config/nvim/plugins.vim"))
    source $HOME/.config/nvim/plugins.vim
endif