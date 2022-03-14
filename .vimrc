set foldcolumn=0
set signcolumn=no
set ttimeoutlen=10
set cursorline

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'Yggdroot/indentLine'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dunstontc/vim-vscode-theme'
Plugin 'bling/vim-bufferline'
Plugin 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plugin 'honza/vim-snippets'
Plugin 'morhetz/gruvbox'
Plugin 'ctrlpvim/ctrlp.vim'


" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" 设置外观 -------------------------------------
set number                      "显示行号 
set showtabline=0               "隐藏顶部标签栏"
set guioptions-=r               "隐藏右侧滚动条" 
set guioptions-=L               "隐藏左侧滚动条"
set guioptions-=b               "隐藏底部滚动条"
set langmenu=zh_CN.UTF-8        "显示中文菜单
set backspace=0
" 变成辅助 -------------------------------------
syntax on                       "开启语法高亮
colorscheme slate
set wrap                        "设置代码折行"
set fileformat=unix             "设置以unix的格式保存文件"
set cindent                     "设置C样式的缩进格式"
set tabstop=2                   "一个 tab 显示出来是多少个空格，默认 8
set shiftwidth=2                "每一级缩进是多少个空格
set showmatch                   "显示匹配的括号"
set scrolloff=5                 "距离顶部和底部5行"
set laststatus=1                "命令行为一行"
" 其他杂项 -------------------------------------
set mouse=a                     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase                  "忽略大小写"
set incsearch
set hlsearch                    "高亮搜索项"
set textwidth=200
set clipboard=unnamed           "支持系统粘贴板"

" ESC取消上次高亮
" 按照PEP8标准来配置vim
au BufNewFile,BufRead *.py set tabstop=4 |set softtabstop=4|set shiftwidth=4|set textwidth=79|set expandtab|set autoindent|set fileformat=unix

" 支持任意ASCII码，也可以使用特殊字符：¦, ┆, or │ ，但只在utf-8编码下有效
let g:indentLine_char='¦'  
" 使indentline生效
let g:indentLine_enabled = 1   

" vim-airline 
set t_Co=256
" let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
noremap <F2> :bprev<CR>
noremap <F1> :bnext<CR>

" bufferline
" let g:bufferline_inactive_highlight = 'StatusLineNC'
let g:bufferline_show_bufnr = 0

" theme
let g:solarized_termtrans = 1
set background=light
colorscheme solarized

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Quickly Run
map <F5> :call CompileRunGcc()<CR>

func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o a.out -std=c++17'
        exec '!time ./a.out'
    elseif &filetype == 'cpp'
        exec '!g++ % -o a.out'
        exec '!time ./a.out'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'sh'
        :!time bash %
    endif
endfunc


" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
