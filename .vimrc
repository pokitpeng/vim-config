" leader按键
let mapleader = "\<space>"
" 检测文件类型
filetype on
" 针对不同的文件类型采用不同的缩进格式
filetype indent on
" 允许插件
filetype plugin on
" 启动自动补全
filetype plugin indent on

" 在上下移动光标时，光标的上方或下方至少会保留显示的行数
set scrolloff=5

" 切换paste模式
set pastetoggle=<F3>

" 开启自动进入paste模式, 会导致补全失效
autocmd InsertEnter * set paste

"显示行号
set number

"开启语法高亮
set syntax=on

"设置以unix的格式保存文件"
set fileformat=unix

"设置table长度
set tabstop=4

"同上
set shiftwidth=4

"文件编码
set fenc=utf-8

"启用鼠标视图模式
set mouse=v

"突出显示当前行
"set cursorline

"文件编码
set encoding=utf-8

"自动缩进
set autoindent

set softtabstop=4

"自动缩进所使用的空白长度指示
set shiftwidth=4

" 输入Tab字符时,自动替换成空格
set expandtab