" reset autocmd's useful for :so $MYVIMRC

autocmd!
source "~/.config/nvim/autoload/*"
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'editorconfig/editorconfig-vim'
Plug 'jaredgorski/spacecamp'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'

Plug 'alvan/vim-closetag'

" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'itchyny/lightline.vim'

if executable('meson')
    Plug 'igankevich/mesonic'
endif

if executable('ctags')
    Plug 'preservim/tagbar'
    Plug 'ludovicchabant/vim-gutentags'
endif

if executable("go")
    Plug 'RRethy/vim-hexokinase', {'do': 'make hexokinase'}
endif

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'jackguo380/vim-lsp-cxx-highlight', {'for': ['c', 'cpp']}

if executable("cargo") && (has("nvim-0.5") || v:version >= 802)
    " requires nvim > 5.0 || vim > 8.2
    Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}
endif

call plug#end()

let g:lightline = { 'colorscheme': 'seoul256' }

let g:cargo_makeprg_params = 'build'

let g:gutentags_file_list_command = {
            \ 'markers': {
            \ '.git': 'git ls-files',
            \ '.hg': 'hg files',
            \ },
            \ }

let g:gutentags_cache_dir = expand('~/.cache/nvim/gutentags')

let g:minimap_width = 30

try
    colorscheme spacecamp
catch
endtry

lua require('lsp')

" TODO map this in lsp.lua
imap <silent> <c-space> <Plug>(completion_trigger)

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let mapleader = " "

nnoremap <silent> <leader>of :silent! !open <C-R><C-F><CR>

nmap <leader>c :make<CR>

nnoremap <leader>g :G<CR>
nmap <leader><Tab> :Tagbar<cr>

nnoremap <leader>f <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>rg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
"
nmap <M-q> <C-W>q

map <leader><S-J> <C-W>J
map <leader><S-H> <C-W>H
map <leader><S-K> <C-W>K
map <leader><S-L> <C-W>L

map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w<cr>
" delete all buffers
nmap <leader>X :bufdo bd<cr>
" delete all buffers but current
nmap <leader>x :%bd\|e#\|bd# <cr> 

" Alt {a,d} can switch buffers
nnoremap <M-a> :bp<CR>
nnoremap <M-d> :bn<CR>

map <leader>e :e <c-r>=expand("%:p:h")<cr>/

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

set undodir=~/.local/share/nvim/undo
set undofile
set mouse=nv
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

setglobal errorformat^=%-Gmake:\ ***%m

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
