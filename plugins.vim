call plug#begin('~/.config/nvim/plugged')

" 目录树
Plug 'scrooloose/nerdtree'
" 状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 开屏美化
Plug 'mhinz/vim-startify'
" go插件
" Plug 'fatih/vim-go'
" 补全插件
" Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"自动补全括号
"Plug 'Raimondi/delimitMate'
"括号匹配的作用是提示，并不是少打一个括号
Plug 'jiangmiao/auto-pairs'
" 可以在导航目录中看到 git 版本信息
Plug 'Xuyuanp/nerdtree-git-plugin'
" git比较不同，:Gvdiff
" Plug 'tpope/vim-fugitive'
" git更改显示
Plug 'airblade/vim-gitgutter'
" 快速移动 \\w  \\f
Plug 'easymotion/vim-easymotion'
" 函数大纲，需要依赖：go get -u github.com/jstemmer/gotags
" Plug 'majutsushi/tagbar'
" 快速注释，\ci  注释 \cc 取消注释 \cu
Plug 'scrooloose/nerdcommenter'
" 缩进线
Plug 'Yggdroot/indentLine'
" 搜索工具
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" 补全
" Plug 'honza/vim-snippets'
" gotests 生成go单元测试
" Plug 'buoto/gotests-vim'
" 一键运行插件 leader+r
" Plug '0x84/vim-coderunner'

call plug#end()