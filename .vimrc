" enable filetype detection
filetype on
filetype plugin on
filetype indent on

" Indent options
set autoindent " New lines inherit the indentation of previous lines.
set tabstop=2 " Indent using two spaces.
set expandtab " Convert tabs to spaces.
set shiftwidth=2 " When shifting, indent using two spaces.
set shiftround " When shifting lines, round the indentation to the nearest multiple of “shiftwidth.”
set smarttab " Insert “tabstop” number of spaces when the “tab” key is pressed.

" support tab for makefile
au Filetype make set noexpandtab nosmarttab tabstop=8 shiftwidth=8
" do not copy comment symbol to the next line
au Filetype * set fo-=c fo-=r fo-=o

" Search options
set hlsearch " Highlight searched keyword
set incsearch " Incremental search that shows partial matches.
set ignorecase " Automatically switch search to case-sensitive when search query contains an uppercase letter.

" Performance options
set complete-=i " Limit the files searched for auto-completes.
set lazyredraw " Don’t update screen during macro and script execution.

" Text rendering options
set display+=lastline " Always try to show a paragraph’s last line.
set fileencodings=utf-8 " Set file encoding
syntax enable

" UI options
set laststatus=2 " Always display the status bar.
set ruler " Always show cursor position.
set wildmenu " Display command line’s tab complete options as a menu.
set tabpagemax=50 " Maximum number of tab pages that can be opened from the command line.
set number " Show line number
set noerrorbells " Disable beep on errors.
set title " Set the window’s title, reflecting the file currently being edited.
" Only for unix users.
set mouse=a " Enable mouse for scrolling and resizing.

" Miscellaneous Options
set autoread " Automatically re-read files if unmodified inside Vim.
set history=500 " Increase the undo limit

" Auto install plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Color themes
Plug 'morhetz/gruvbox'

" Lightline settings
Plug 'itchyny/lightline.vim'

" Language syntaxes
Plug 'leafgarland/typescript-vim'

" Initialize plugin system
call plug#end()

" Color scheme settings
set t_Co=256
colo gruvbox
set background=dark
" TODO: Find a way to prevent syntax highlighting from being disabled over color-column.
highlight ColorColumn guibg=#2d2d2d 
let &colorcolumn="".join(range(100, 999),",")

" Lightline settings
set noshowmode
let g:lightline = { 'colorscheme': 'jellybeans' }

" save last cursor position
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "norm g`\"" |
      \ endif
