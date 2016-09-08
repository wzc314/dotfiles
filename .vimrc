"    Author:   Kris Wang
"    Date: Thu Aug 25 22:38:00 CST 2016
"=============================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"使用vim-markdown支持markdown语法高亮
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_frontmatter=1
let g:vim_markdown_folding_disabled=1
"使用vim-instant-markdown支持实时预览
Plugin 'suan/vim-instant-markdown'
let g:instant_markdown_autostart=0
Plugin 'vim-airline/vim-airline'
"let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:powerlineish=1
let g:airline#extensions#whitespace#checks=[] " [ 'indent', 'trailing', 'long', 'mix-indent-file' ]
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
let NERDTreeShowLineNumbers=1
Plugin 'elixir-lang/vim-elixir'
Plugin 'qpkorr/vim-bufkill'
"Plugin 'taglist.vim'
"Plugin 'ctags.vim'
Plugin 'a.vim'
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf='/home/wangzicong/gem5/.ycm_extra_conf.py'
let g:ycm_key_detailed_diagnostics=''
let g:ycm_show_diagnostics_ui=0
let g:ycm_add_preview_to_completeopt=0
set completeopt-=preview
Plugin 'rdnetto/YCM-Generator'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"配置backspace键工作方式
set backspace=indent,eol,start
"显示行号
set relativenumber
"设置在编辑过程中右下角显示光标的行列信息
set ruler
"在状态栏显示正在输入的命令
set showcmd
"设置历史记录条数
set history=1000
"设置取消备份 禁止临时文件生成
set nobackup
set noswapfile
"突出现实当前行列
"set cursorline
"set cursorcolumn
"设置匹配模式 类似当输入一个左括号时会匹配相应的那个右括号
set showmatch
"设置C/C++方式自动对齐
set autoindent
set cindent
"开启语法高亮功能
syntax enable
syntax on
"指定配色方案为256色
set t_Co=256
"设置搜索时忽略大小写
set ignorecase
set incsearch
set hlsearch
"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a
"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4
"设置按退格键时可以一次删除4个空格
set softtabstop=4
"设置按退格键时可以一次删除4个空格
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab
"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
set laststatus=2
"close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Taglist配置
"let Tlist_Use_Right_Window=1
"let Tlist_WinWidth=36
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1
"nnoremap <C-p> :TlistToggle<CR>
"ctags配置
set tags=/home/wangzicong/gem5/build/ALPHA_MESI_Two_Level/tags

"插入当前时间
"map <Leader>dt a<C-R>=strftime('%Y-%m-%d %H:%M:%S')<CR>
"比较当前文件与原始文件的差异
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis
endif

highlight Search term=standout ctermfg=Black ctermbg=Yellow
set diffopt=context:3

let mapleader = "\<Space>"
map <C-c> :BD<CR>
nnoremap <CR> Gzz
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e!<CR>
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>a :A<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :qa<CR>
nnoremap <Leader>y ggyG
nnoremap <Leader>p ggVGP
nnoremap <Leader>g :YcmCompleter GoTo<CR>
nnoremap <Leader>v :wincmd v<CR>
nnoremap <Leader>o :wincmd o<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>b :windo set scrollbind!<CR>
nnoremap <Leader>m :mksession! ~/Documents/Session.vim<CR>
nnoremap <Leader>. :<C-p><CR>
nnoremap <Leader><Leader> :wincmd w<CR>
