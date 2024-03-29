" ___    ______________  ___________________
" __ |  / /___  _/__   |/  /__  __ \_  ____/
" __ | / / __  / __  /|_/ /__  /_/ /  /
" __ |/ / __/ /  _  /  / / _  _, _// /___
" _____/  /___/  /_/  /_/  /_/ |_| \____/

runtime! debian.vim

" plugin list begin
call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/indentLine', {'for': ['python', 'cpp']}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'Chiel92/vim-autoformat'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-surround'
Plug 'voldikss/vim-floaterm'
Plug 'vim/killersheep'
Plug 'liuchengxu/vim-which-key', {'on': ['WhichKey', 'WhichKey!']}
Plug 'liuchengxu/space-vim-theme'
Plug 'mbbill/undotree'
Plug 'farmergreg/vim-lastplace'
Plug 'junegunn/vim-easy-align'
Plug 'francoiscabrol/ranger.vim'
Plug 'sillybun/vim-repl'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dstein64/vim-startuptime'
Plug 'skywind3000/vim-terminal-help'
"Plug 'vwxyutarooo/nerdtree-devicons-syntax'
call plug#end()
" plugin list end

if has("syntax")
    syntax on
endif
set laststatus=2

if filereadable("/etc/vim/vimrc.local")
    source /etc/vim/vimrc.local
endif

set cursorline
set backspace=indent,eol,start
set backspace=2
"set nowrap
set sidescroll=0
set rnu
set number
set ignorecase
syntax on
let g:airline_theme='onedark'
set background=dark
colorscheme onedark
set mouse=a
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,latin1
set termencoding=utf-8
set encoding=utf-8
filetype indent on
set autoindent
set tabstop=4
set expandtab
set softtabstop=4
set smarttab
set shiftwidth=4
set showmatch
filetype on
filetype plugin on
set linespace=0
set noshowmode
set nobackup
set autoread
set confirm
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let mapleader=','
set encoding=utf8
set termencoding=utf-8
let g:NERDCreateDeafultMappings=0
nnoremap <F3> :NERDTreeToggle<CR>
let g:startify_custom_header=
            \ startify#center([
            \'██╗   ██╗██╗███╗   ███╗██████╗  ██████╗  ██████╗██╗  ██╗',
            \'██║   ██║██║████╗ ████║██╔══██╗██╔═══██╗██╔════╝██║ ██╔╝',
            \'██║   ██║██║██╔████╔██║██████╔╝██║   ██║██║     █████╔╝ ',
            \'╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║   ██║██║     ██╔═██╗ ',
            \' ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╔╝╚██████╗██║  ██╗',
            \'  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝'
            \])

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <Leader>ve :edit ~/.vimrc<cr>
nnoremap <Leader>vs :source ~/.vimrc<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <C-N> :bn<cr>
nnoremap <C-P> :bp<cr>
nnoremap <Leader>bd :bd<cr>
nnoremap <Leader>1 :b1<cr>
nnoremap <Leader>2 :b2<cr>
nnoremap <Leader>3 :b3<cr>
nnoremap <Leader>4 :b4<cr>
nnoremap <Leader>5 :b5<cr>
nnoremap <Leader>6 :b6<cr>
nnoremap <Leader>7 :b7<cr>
nnoremap <Leader>8 :b8<cr>
nnoremap <Leader>9 :b9<cr>
nnoremap J 3j
nnoremap K 3k

let g:coc_node_path = '/home/xtayex/.nvm/versions/node/v12.18.0/bin/node'
map <F8> :call GenerateTags()<cr>
func! GenerateTags()
    exec '!ctags -R --fields=+lS'
endfunc

map <F11> :call CompileAndRun()<cr>
func! CompileAndRun()
    exec 'w'
    if &filetype is 'cpp' || &filetype is 'c' || &filetype is 'cc'
        exec '!g++ -Wall -std=gnu++17 -g -o2 % -o %<'
        exec '!time ./%<'
    elseif &filetype is 'python'
        exec '!python3 %'
    else
        echo 'This file cannot be run'
    endif
endfunc

map <F10> :call Run()<cr>
func! Run()
    if &filetype is 'cpp' || &filetype is 'c' || &filetype is 'cc'
        exec '!time ./%<'
    elseif &filetype is 'python'
        exec '!python3 %'
    else
        echo 'This file cannot be run'
    endif
endfunc

map <F9> :call Compile()<cr>
func! Compile()
    exec 'w'
    if &filetype is 'cpp' || &filetype is 'c' || &filetype is 'cc'
        exec '!g++ -Wall -std=gnu++17 -g -o2 % -o %<'
    else
        echo 'Not a cpp or c file'
    endif
endfunc

nmap <F12> :call Settitle()<cr>Gi
nmap <leader>a ggvG$
nmap <Leader>pi :PlugInstall<cr>
nmap <Leader>ps :PlugStatus<cr>
map <leader><space> <plug>NERDCommenterToggle
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

func! Settitle()
    let l = 0
    let l = l + 1 | call setline(l, '#include <iostream>')
    let l = l + 1 | call setline(l, '#include <cstdio>')
    let l = l + 1 | call setline(l, '#include <algorithm>')
    let l = l + 1 | call setline(l, '#include <cstring>')
    let l = l + 1 | call setline(l, '#include <string>')
    let l = l + 1 | call setline(l, '#include <vector>')
    let l = l + 1 | call setline(l, '#include <map>')
    let l = l + 1 | call setline(l, '#include <stack>')
    let l = l + 1 | call setline(l, '#include <queue>')
    let l = l + 1 | call setline(l, '#include <set>')
    let l = l + 1 | call setline(l, '#include <cctype>')
    let l = l + 1 | call setline(l, '#include <cmath>')
    let l = l + 1 | call setline(l, '#include <unordered_map>')
    let l = l + 1 | call setline(l, '#define mst(a,b) memset((a),(b),sizeof(a))')
    let l = l + 1 | call setline(l, '#define debug(x) cerr << "\033[01;31m" << #x << " = " << x << "\033[0m" << "\n"')
    let l = l + 1 | call setline(l, '#define INF 0x3f3f3f3f')
    let l = l + 1 | call setline(l, '#define lson lef,mid,rt<<1')
    let l = l + 1 | call setline(l, '#define rson mid+1,rig,rt<<1|1')
    let l = l + 1 | call setline(l, 'const int maxn=1e5+5;')
    let l = l + 1 | call setline(l, 'using namespace std;')
    let l = l + 1 | call setline(l, 'typedef long long ll;')
    let l = l + 1 | call setline(l, 'typedef unsigned long long ull;')
    let l = l + 1 | call setline(l, '')
endfunc

" 使用windows的剪贴板
vmap `y :!/mnt/c/Windows/System32/clip.exe<cr>u
nmap `p :read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l
map! `p <esc>:read !/mnt/c/Windows/System32/paste.exe <cr>i<bs><esc>l
nmap <F2> :Autoformat<cr>

" 当vim打开一个目录时, nerdtree自动使用
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" 打开新的窗口时, focus在buffer中而不是nerdtree
autocmd VimEnter * :wincmd l

" 当vim中没有其他文件, 只剩下nerdtree时, 自动关闭窗口
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

set noswapfile

" 修改光标样式
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" 使vim支持真彩色
if has("termguicolors")
    " fix bug for vim
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " enable true color
    set termguicolors
endif

let g:airline_left_sep="\uE0B8"
let g:airline_right_sep="\uE0BE"
let g:airline_left_alt_sep="\uE0BF"
let g:airline_right_alt_sep="\uE0BF"

nnoremap <Leader>= :exec "vert res ".(winwidth(0) * 11/10)<CR>
nnoremap <leader>- :exec "vert res ".(winwidth(0) * 10/11)<CR>

set timeoutlen=500
set ttimeoutlen=10
set incsearch

nmap f <Plug>(easymotion-s2)
vnoremap d "_d
vnoremap dd "_dd
nnoremap d "_d
nnoremap dd "_dd
set wildmenu

let g:fzf_preview_window='right:40%'
let g:fzf_layout={'window': { 'width': 0.9, 'height': 0.7 }}
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}'], 'window': {'width': 0.9, 'height': 0.6}}, <bang>0)

function! NoTrailingSpaceFunc()
    exec '%s/\s\+$//g'
endfunc

command! NoTrailingSpace call NoTrailingSpaceFunc()

"nnoremap <leader>y :<C-u>CocList -A --normal yank<cr>

" floaterm
let g:floaterm_keymap_new = '<F6>'
let g:floaterm_keymap_prev = '<F7>'
let g:floaterm_keymap_next = '<F8>'

" coc-bookmark configuration
" begin
nmap <leader>mm <plug>(coc-bookmark-toggle)
nmap <leader>nm <plug>(coc-bookmark-next)
nmap <leader>pm <plug>(coc-bookmark-prev)
" end

" open CocCommand
nnoremap <c-c> :CocCommand<cr>

" undotree
nnoremap UT :UndotreeToggle<cr>

command Clear !clear

let g:lastplace_ignore_buftype="quickfix,nofile,help"
let g:airline#extensions#coc#enabled=1

" vim-easy-align
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)


let g:easy_align_delimiters = {
            \ '>': { 'pattern': '>>\|=>\|>' },
            \ '/': {
            \     'pattern':         '//\+\|/\*\|\*/',
            \     'delimiter_align': 'l',
            \     'ignore_groups':   ['!Comment'] },
            \ ']': {
            \     'pattern':       '[[\]]',
            \     'left_margin':   0,
            \     'right_margin':  0,
            \     'stick_to_left': 0
            \   },
            \ ')': {
            \     'pattern':       '[()]',
            \     'left_margin':   0,
            \     'right_margin':  0,
            \     'stick_to_left': 0
            \   },
            \ 'd': {
            \     'pattern':      ' \(\S\+\s*[;=]\)\@=',
            \     'left_margin':  0,
            \     'right_margin': 0
            \   }
            \ }

" clang-format: short if statement
let g:formatdef_my_custom_cpp='"clang-format -style=file"'
let g:formatters_cpp=['my_custom_cpp']

" ranger.vim
let g:ranger_map_keys=0
nnoremap <leader>r :Ranger<cr>

" set the maximum number of items to show in the popop menu for Insert mode completion
set pumheight=20
set pumwidth=5


" coc-yank
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

" coc.nvim navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" coc.nvim jump to error
nnoremap <silent> ne :call CocAction('diagnosticNext')<cr>
nnoremap <silent> pe :call CocAction('diagnosticPrevious')<cr>

" coc-vimlsp
let g:markdown_fenced_languages=[
            \ 'vim',
            \ 'help'
            \]

" termdebug
let g:termdebug_wide=1

" vim-repl
let g:sendtorepl_invoke_key="<leader>w"
let g:repl_position=3
let g:repl_program={
            \ 'python': 'python3',
            \ 'default': 'zsh',
            \ 'vim': 'vim -e'
            \}
let g:repl_predefine_python={
            \ 'numpy': 'import numpy as np',
            \ 'matplotlib': 'import matplotlib.pyplot as plt'
            \}
let g:repl_python_automerge=0
let g:onedark_terminal_italics=1

" set the indent width of javascript
"autocmd FileType javascript setlocal et sta sw=2 sts=2

" coc-translator
nmap <leader>t <Plug>(coc-translator-p)
vmap <leader>t <Plug>(coc-translator-pv)

" coc.nvim refractor
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-refactor)

" indentLine
let g:indentLine_char='▏'

