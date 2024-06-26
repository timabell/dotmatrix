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

set guifont=Ubuntu\ Mono\ 14
set guioptions-=T guioptions-=e guioptions-=L guioptions-=r

set background=light

" Load environment (including aliases) for running commands in shell
" http://stackoverflow.com/a/18901595/10245
" let $BASH_ENV="~/.bashrc"

" turn on smart case where available
set ignorecase smartcase

set tabstop=2
set shiftwidth=2

set spell

set clipboard=unnamedplus

" visible whitespace
" https://vi.stackexchange.com/questions/422/displaying-tabs-as-characters/430#430
set list
set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵

noremap zs :update<cr>

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

let g:vimwiki_list = [{'path':'~/notes', 'format':'markdown', 'ext': '.md', 'path_html':'/tmp/vimwiki_html'}]
let g:vimwiki_url_maxsave=0 " turn off link shortner https://github.com/vimwiki/vimwiki/issues/312#issuecomment-284853877

let mapleader=","
