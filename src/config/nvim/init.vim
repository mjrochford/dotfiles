" reset autocmd's useful for :so $MYVIMRC
"
lua require('plugins')
lua require('lsp')

autocmd!
source "~/.config/nvim/autoload/*"

try
    colorscheme spacecamp
catch
endtry

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let mapleader = " "

nnoremap <silent> <leader>of :silent! !open <C-R><C-F><CR>

nmap <leader>c :make<CR>

nnoremap <leader>g :G<CR>
nmap <leader><Tab> :Tagbar<cr>

nnoremap <leader>. :Ido std.browse<cr>
nnoremap <leader>> :Ido std.git_files<cr>
nnoremap <leader>b :Ido std.buffer<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Fast saving
nmap <leader>w :w<cr>
" delete all buffers
nmap <leader>X :bufdo bd<cr>
" delete all buffers but current
nmap <leader>x :%bd\|e#\|bd# <cr> 

" Alt {a,d} can switch buffers
nnoremap <M-a> :bp<CR>
nnoremap <M-d> :bn<CR>

" map <leader>e :e <c-r>=expand("%:p:h")<cr>/

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Tabbing out lines
vnoremap > >gv
vnoremap < <gv
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

map 0 ^

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
    autocmd BufEnter * let &titlestring = expand("%:t")
set title

au TermOpen * startinsert
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m

set undodir=~/.local/share/nvim/undo
set undofile
set mouse=nv
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

set splitbelow splitright

set updatetime=300
set signcolumn=auto

set list
" set listchars=tab:>-,trail:~,space:.

set foldmethod=syntax
set foldlevel=8

set number
set relativenumber

set clipboard+=unnamedplus

" Height of the command bar
set cmdheight=1
" A buffer becomes hidden when it is abandoned
set hidden

set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set hlsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" No annoying sound on errors
set noerrorbells
set novisualbell

" Use Unix as the standard file type
set ffs=unix,dos,mac

set nobackup
set nowb
set noswapfile

set undodir=~/.local/share/nvim/undo
set undofile

" tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4

set textwidth=100
set colorcolumn=+1

set wrap
set background=dark

highlight clear SignColumn
" make transparent bg work -- alacritty
highlight Normal ctermbg=NONE guibg=NONE 
highlight NonText ctermbg=NONE guibg=NONE
" type correct color
highlight link Type cType

hi StatusLine ctermbg=235 ctermfg=White
