"*****************************************************************************
"" NeoBundle core
"*****************************************************************************

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

" Required:
call neobundle#begin(expand('~/.config/nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Look & Feel
NeoBundle 'https://github.com/vim-scripts/ScrollColors'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Yggdroot/indentLine'

"Git
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

"Navigating
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'vim-scripts/The-NERD-tree'
NeoBundle 'rking/ag.vim'
NeoBundle 'inside/vim-grep-operator'

"Editing
NeoBundle 'rainbow_parentheses.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'

NeoBundle 'neomake/neomake'
NeoBundle 'benjie/neomake-local-eslint.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'sheerun/vim-polyglot'

" Autocomplete
NeoBundle 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
NeoBundle 'ternjs/tern_for_vim', { 'do': 'npm install' }

"" Testing
NeoBundle 'janko-m/vim-test'

" Required:
call neobundle#end()


" Conf
let mapleader = ","

" Syntax highlighting
filetype plugin indent on
syntax on

set spelllang=en
set confirm
set hidden            " less warnings when dealing with buffers
set showcmd

" Whitespace
set expandtab         " use spaces instead of <Tab>s
set smartindent       " auto tabs when going to next line
set tabstop=2         " number of spaces that a <Tab> in the file counts for
set shiftwidth=2      " number of spaces to use for each step of (auto)indent
set softtabstop=2     " spaces feel like tabs

" Splitting
set splitbelow        " new split window below where you are
set splitright        " new vsplit windows right where you are

" Searching
set ignorecase
set smartcase

" Scrolling
set sidescrolloff=2   " keep 2 characters when scrolling
set scrolloff=3       "keep 3 lines when scrolling

" Fix cursor position with scrolling
map <PageUp> <C-U>
map <PageDown> <C-D>
imap <PageUp> <C-O><C-U>
imap <PageDown> <C-O><C-D>
set nostartofline

" Line info
set number
set relativenumber
set ruler
set title
set laststatus=2

" Disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
" Use hjkl to move in insert mode
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

set backspace=2 " make backspace work like most other apps
inoremap <C-d> <Del>

" Other commands
set shiftround        " < and > commands for indention

set foldlevel=100
set foldmethod=indent
set foldlevelstart=99

" set/unset folds with ctrl-space
nmap <Nul> za

" Additional root markers
let g:ctrlp_root_markers = ['.ruby-version', 'start', '*.cabal']
let g:ctrlp_by_filename = 0
let g:ctrlp_reuse_window = 1

" Better rezising for splits
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

" Maximize split
map <C-_> <C-w>_

" Equal size to splits
map <C-]> <C-w>=

" Moving between splits
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

" Visual Settings

set ruler
set number

colorscheme monokai
let g:indentLine_color_term = 238

set t_Co=256
set guioptions=egmrti
set gfn=Monaco\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
endif

" set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

if exists("*gutentags#statusline")
  set statusline+=%{gutentags#statusline()}
endif

" vim-airline
let g:airline_theme = 'base16'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " airline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" NERDTree

" Options
let NERDTreeCascadeOpenSingleChildDir=1
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" Mappings
let g:NERDTreeMapActivateNode="<F3>"
silent! nmap <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let NERDTreeMapOpenSplit="x"
let NERDTreeMapOpenVSplit="v"
let NERDTreeMapCloseDir="z"
let NERDTreeMapCloseChildren="Z"
" Exit vim automatically if nerdtree is the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" Trim trailing whitespace on save
autocmd FileType javascript,java,sass,ruby,coffee,haskell autocmd BufWritePre <buffer> :%s/\s\+$//e

" Initial markdown fold level
let g:vim_markdown_initial_foldlevel=1

" status line
set laststatus=2                " always show status line
set statusline=                 " build the status line
set statusline+=%-3.3n\         " buffer number
set statusline+=%f\             " filename
set statusline+=%h%m%r%w        " status flags
set statusline+=%y              " file type
set statusline+=%=              " right align remainder
set statusline+=0x%-8B          " character value
set statusline+=%-14(%l,%c%V%)  " line, character
set statusline+=%<%P            " file position

set wildignore+=*/tmp/*,*.so,*.o,*.hi,*.swp,*.zip,.DS_Store
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1
noremap <leader>b :CtrlPBuffer<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " This hides all in custom_ignore
  " let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "' + g:ctrlp_custom_ignore + '"'
  "
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_root_markers = ['start', 'package.json']

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
nnoremap <C-f> :Ag!<SPACE>

" yank the current visual selection and insert it as the search term
vnoremap <leader>f y:<C-u>Ag! "<C-r>0"<space>

let g:miniBufExplSplitBelow=0

" bind <Leader> K to grep word under cursor
nnoremap <Leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

nmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
vmap <leader>g <Plug>GrepOperatorOnCurrentDirectory
nmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt
vmap <leader><leader>g <Plug>GrepOperatorWithFilenamePrompt

" Move with ctrl, to the previous line with the same indent, ctrl. to the next
nnoremap <C-,> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>
nnoremap <C-.> :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>

nnoremap <F5> :set hlsearch!<CR>

" Easier clipboard copy and paste
map <Leader>y "*y
map <Leader>p "*p

" Replace old ruby hash syntax with new
map <Leader>h :s/:\(\w\+\)\s*=>/\1: /g<CR>

au VimEnter * RainbowParenthesesToggle

" " Make the signs readable using current color scheme
" highlight clear SignColumn

" Handle mocha compilers with mocha.opts
let g:rspec_command = "!bundle exec rspec {spec}"
let g:mocha_js_command = "!./node_modules/mocha/bin/mocha --recursive --no-colors {spec}"
let g:mocha_coffee_command = "!./node_modules/mocha/bin/mocha --recursive --no-colors {spec}"

let test#strategy = "neovim"
" vim-test bindings
map <silent> <Leader>s :TestNearest<CR>
map <silent> <Leader>t :TestFile<CR>
map <silent> <Leader>a :TestSuite<CR>
map <silent> <Leader>l :TestLast<CR>
map <silent> <Leader>v :TestVisit<CR>

:nnoremap <silent> <Leader>c :nohlsearch<Bar>:echo<CR>

let g:neomake_open_list = 2
autocmd! BufWritePost * Neomake
let g:neomake_scss_enabled_makers = ['stylelint']

" Autocomplete

call deoplete#enable()
let g:deoplete#enable_camel_case=1
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" " tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" Fix scrolling lag because of Highlight_matching_pair called too much
:set lazyredraw
let loaded_matchparen = 1
set synmaxcol=128
syntax sync minlines=256

