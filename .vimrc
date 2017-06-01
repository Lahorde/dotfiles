"colorscheme cobalt 

"Be sure files saved/opened as utf-8
set fileencoding=utf-8
set encoding=utf-8

" activates syntax highlighting among other things
syntax on

" enable color (used for tmux session)
set term=screen-256color

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

" indentation
set autoindent

" activates filetype detection
filetype plugin indent on

set cindent
" indentation settings per file
au FileType python setl shiftwidth=4 tabstop=4
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" set paste diable indentation. Instead use F4 to toggle paste/nopaste mode
set pastetoggle=<F4>
set nopaste

" Exit INSERT mode without moving cursor (press qs or sq)
set timeoutlen=300
inoremap qs <Esc>l
inoremap sq <Esc>l 

"refresh unchanged files
set autoread

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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'

call vundle#end()

" set path
" cd /home/remi/Projects
set autochdir

" do not copy line number when copying with mouse
se mouse+=a

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_check_header = 1

let g:syntastic_javascript_checkers = ['jshint']

" airline config
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='wombat'
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2

"jedi-vim config
" do not show doc window
autocmd FileType python setlocal completeopt-=preview
" do not show functions params
let g:jedi#show_call_signatures = 0

" shortcuts
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
" map <C-n> <Esc>:tabnew
" shortcuts over ssh
map <Esc>[1;5C <C-Right>
map <Esc>[1;5D <C-Left>

" new line in edit mode with enter
nmap <S-Enter> O<Esc>
" keep enter to run a command in command-line window 
augroup commandlinewindow
  autocmd!
  autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>
augroup END

nmap <CR> o<Esc>

nmap <c-s> :w<CR>
imap <c-s> <Esc>:w<CR>a

map <F2> :mksession! ~/vim_session <cr> " Quick write session with F2
map <F3> :source ~/vim_session <cr>     " And load session with F3

