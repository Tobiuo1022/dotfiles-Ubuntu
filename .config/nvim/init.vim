" display
set number
set showcmd
set laststatus=2
set scrolloff=8
set termguicolors
" search
set hlsearch
set incsearch
set ignorecase
set smartcase
" indent
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set backspace=indent,eol,start
" fold
set foldmethod=indent
set foldtext=getline(v:foldstart)
set fillchars=fold:\ 
autocmd BufRead * exe "normal zR"
" misc
filetype plugin indent on
syntax enable
set hidden
set timeoutlen=1000 ttimeoutlen=0
set wildmenu

let mapleader = "\<Space>"
let loaded_matchparen = 1
" blink cursor
let &t_ti.="\e[1 q"

nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>
nnoremap <Space> <Nop>
" fzf
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>l :Lines<CR>

inoremap <silent> jk <ESC>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ` ``<LEFT>

" 関数の定義などの場面で中括弧の間を改行した際, カーソルを中括弧の間に移動する. 
function! IndentBraces()
    let beforeletter = getline(".")[col(".")-2] " 1つ前の文字
    let nowletter = getline(".")[col(".")-1]    " 今いるカーソルの文字

    " カーソルの位置の括弧が隣接している場合
    if beforeletter == "{" && nowletter == "}" 
        return "\n\<C-o>O"
    else
        return "\n"
    endif
endfunction
" Enterに割り当て
inoremap <silent> <expr> <CR> IndentBraces()

tnoremap jk <C-\><C-n>
