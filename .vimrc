set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on
set number
set autoindent
set textwidth=100
set shiftwidth=2 "sets the auto-indent to just four spaces, instead of a full tab. 
set hidden
syntax enable
set background=dark
color solarized

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

" Solarized for better colors
Plugin 'altercation/vim-colors-solarized'

"vimwiki for awesome wiki!
Plugin 'vimwiki/vimwiki'

"snippet plugins to make editing html and other code faster.
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" Optional:
Plugin 'honza/vim-snippets'

"emmet-vim allows for awesome html auto-completion
Plugin 'mattn/emmet-vim'
"web-api to make custom snippets for emmett
Plugin 'mattn/webapi-vim'
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
" * Emmett Configuration *
" ************************
let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/.snippets_custom.json')), "\n"))

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

"*****************************
"*  Vimwiki Configurations!  *
"*****************************

let g:vimwiki_list =[
\{
\'path': '~/vimwiki',
\'path_html': '~/vimwiki_html'
\},
\{
\'path': '~/Projects/SSB/ssb-non-dev-resources/wiki',
\'path_html': '~/Projects/SSB/ssb-non-dev-resources/ssbwiki_html/',
\'auto_export': 1,
\'template_path': '~/Projects/SSB/ssb-non-dev-resources/ssbwiki_html/templates',
\'template_default': 'def_template',
\'template_ext': '.tpl'
\},
\{
\'path': '~/Projects/SSB/ssb-wiki/',
\'syntax': 'markdown', 
\'ext': '.md',
\'index': 'README'
\},
\{
\ 'path': '~/Projects/EDA/wiki',
\ 'path_html': '~/Projects/EDA/web'
\},
\{
\ 'path': '~/Projects/Web/angblev/wiki',
\ 'path_html': '~/Projects/Web/angblev/wiki_web'
\}
\]
