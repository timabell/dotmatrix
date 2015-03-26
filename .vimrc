if $VIM_PLUGINS != 'NO'
  runtime! autoload/pathogen.vim
  if exists('g:loaded_pathogen')
    execute pathogen#infect('~/.vimbundles/{}', '~/.vim/bundle/{}')
  endif
endif

syntax on
filetype plugin indent on

set visualbell

set wildmenu
set wildmode=list:longest,full

set splitright
set splitbelow

set hidden

set guifont=Monaco:h16
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r

set background=dark
colorscheme solarized

" Load environment (including aliases) for running commands in shell
" http://stackoverflow.com/a/18901595/10245
" let $BASH_ENV="~/.bashrc"

set ignorecase

augroup vimrc
  autocmd!
  autocmd GuiEnter * set columns=120 lines=70 number
augroup END

augroup unfold_on_open
  autocmd Syntax ruby normal zR
augroup END

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
