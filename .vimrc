let hostname=substitute(system('hostname'), '\n', '', '')
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:powerlineish=1
let g:airline#extensions#whitespace#checks=[] " [ 'indent', 'trailing', 'long', 'mix-indent-file' ]
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=40
Plugin 'qpkorr/vim-bufkill'
Plugin 'majutsushi/tagbar'
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_map_showproto = "w"
let g:tagbar_map_nexttag = ""
let g:tagbar_map_prevtag = ""

if hostname=="109-server"
    Plugin 'elixir-lang/vim-elixir'
elseif hostname=="smart-laptop" || hostname=="smartMBP"
    Plugin 'fatih/vim-go'
    let g:tagbar_type_go = {
                \ 'ctagstype' : 'go',
                \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
                \ ],
                \ 'sro' : '.',
                \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
                \ },
                \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
                \ },
                \ 'ctagsbin'  : 'gotags',
                \ 'ctagsargs' : '-sort -silent'
                \ }
endif

Plugin 'Raimondi/delimitMate'
Plugin 'FSwitch'
au! BufEnter *.cc let b:fswitchdst = 'hh' | let b:fswitchlocs = '.'
au! BufEnter *.hh let b:fswitchdst = 'cc' | let b:fswitchlocs = '.'
au! BufEnter *.cpp let b:fswitchdst = 'hpp' | let b:fswitchlocs = '.'
au! BufEnter *.hpp let b:fswitchdst = 'cpp' | let b:fswitchlocs = '.'
Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion = ['<c-n>']
let g:ycm_key_list_previous_completion = ['<c-p>']
let g:ycm_key_detailed_diagnostics=''
let g:ycm_show_diagnostics_ui=0
let g:ycm_add_preview_to_completeopt=0
let g:ycm_collect_identifiers_from_tags_files=1 
set completeopt-=preview
Plugin 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

call vundle#end()            " required
filetype plugin indent on    " required

"set runtimepath-=~/.vim/bundle/YouCompleteMe

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
"突出显示当前行列
set cursorline
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
"ctags配置
"set tags=

highlight Search term=standout ctermfg=Black ctermbg=Yellow
highlight DiffAdd term=bold ctermfg=Green ctermbg=0 guibg=LightBlue
highlight DiffChange term=bold ctermfg=Yellow ctermbg=0 guibg=LightBlue
highlight DiffDelete term=bold ctermfg=Red ctermbg=0 guibg=LightBlue
set diffopt=context:3

let mapleader = "\<Space>"
map <C-c> :BD<CR>
nnoremap <CR> Gzz
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-p> :TagbarToggle<CR>
nnoremap gt :YcmCompleter GoTo<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e!<CR>
nnoremap <Leader>n :noh<CR>
nnoremap <Leader>a :FSHere<CR>
nnoremap <Leader>z @z
nnoremap <Leader>p "+p
nnoremap <Leader>r :set wrap!<CR>
nnoremap <Leader>P "+P
nnoremap <Leader>g 1<C-g>
nnoremap <Leader>y "+y
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :qa<CR>
nnoremap <Leader>v :wincmd v<CR>
nnoremap <Leader>o :wincmd o<CR>
nnoremap <Leader>s :wincmd s<CR>
nnoremap <Leader>b :windo set scrollbind!<CR>
nnoremap <Leader>m :mksession! ~/Documents/Session.vim<CR>
nnoremap <Leader>. :<C-p><CR>
nnoremap <Leader><Leader> :wincmd w<CR>

au filetype go nnoremap gr :GoRun<CR>
au filetype go nnoremap gn :GoRename<CR>
au filetype go nnoremap gb :GoBuild<CR>
au filetype go nnoremap gi :GoImports<CR>
