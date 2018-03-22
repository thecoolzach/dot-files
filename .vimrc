set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
set number
set autoindent
set textwidth=100
set shiftwidth=2 "sets the auto-indent to just two spaces, instead of a full tab. 
set hidden
syntax enable

" = Alternate Mappings =
let mapleader = ','

" = Omnicomplete =
" better mapping
inoremap <leader><Tab> <C-x><C-o>
" get the dropdown working a bit better
:set completeopt=longest,menuone
" be able to hit enter for your chosen option
":inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" be able to type and get more refined options
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"*************************
"        PLUGINS
"*************************
"
" VUNDLE!!
" set the runtime path to include Vundle and initialize.  The next two lines are required.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"  The Plugins ! 
" ******************
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Reede's Pencil for making vim easier to write with
Plugin 'reedes/vim-pencil'
 
" NERDTree for directory management
Plugin 'scrooloose/nerdtree'

"snippet plugins to make editing html and other code faster.
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'

"surround makes surrounding with tags easy
Plugin 'tpope/vim-surround.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" Pencil configurations!
" *********************
" 
let g:pencil#wrapModeDefault = 'soft'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,md  call pencil#init()
  autocmd FileType text             call pencil#init()
  autocmd FileType wiki             call pencil#init()
augroup END

"""""""""""""""""""""""""""""""""""""
" Markdown Specific Configurations! "
"""""""""""""""""""""""""""""""""""""
"
let g:markdown_fenced_languages = ['html', 'python', 'javascript', 'bash=sh'] "enables syntax highlightin for code blocks
let g:markdown_syntax_conceal = 0

"*****************************
"*  NERDTree Configurations! *
"*****************************
"autocmd vimenter * NERDTree " opens nerd tree whenever you start new vim session.
" Remappings
map <F2> :NERDTree<enter>

