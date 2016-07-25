" colorscheme cobalt 

" activates filetype detection
filetype plugin indent on

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

" indentation
set tabstop=8 softtabstop=0 expandtab shiftwidth=2

" disable transparency
hi Normal guibg=Black ctermbg=Black

" highlight search
set hlsearch

"set line number
set number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" list installed plugins
Plugin 'pangloss/vim-javascript'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" set path
" cd /home/remi/Projects
set autochdir

" set le nom de tabs 
set statusline+=%f
set laststatus=2

set paste

" airline config
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='molokai'
" set laststatus=2

" shortcuts
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-n> <Esc>:tabnew

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3
