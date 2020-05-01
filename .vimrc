" Vundle
filetype off

let g:vundle_default_git_proto = 'git'
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Bundles
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'

call vundle#end()


" Required for vundle
"filetype plugin indent on 
filetype plugin on 

" Highlighting
syntax on

" Tab settings and indentation
set tabstop=2
set shiftwidth=2
set expandtab
set ai

" Autoindent if possible
set autoindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Show line number
set number

" Highlight all search patterns
set hlsearch

""
set ruler

"" Make backspace cool
set backspace=indent,eol,start

" Airline config
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'

" Colorscheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

"" Nerdtree
map <C-n> :NERDTreeToggle<CR>
