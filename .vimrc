set nocompatible
filetype plugin on
syntax on
set cursorline
set number
set tabstop=2

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set laststatus=2


" auto install plug.vim
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'skywind3000/asyncrun.vim'
Plug 'samgriesemer/vim-roam'
Plug 'vimwiki/vimwiki'
Plug 'ChesleyTan/wordCount.vim'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdtree'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'

call plug#end()

colorscheme onedark

" Currently not doing anything I guess
set statusline+=%{wordCount#WordCount()}

let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
