" Automatically install vim-plug and missing plugins, hurts startup time
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endif


call plug#begin('~/.vim/plugged')

  " Fuzzy search all the things.
  " requires: cargo install --locked ripgrep
  " requires: cargo install --locked bat
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " LSP support for autocompletion, signature help, linting, and more.
  " Requires `nodejs` `npm`
  " requires: :CocInstall coc-tsserver coc-eslint coc-prettier
  " requires: :CocInstall coc-json coc-html coc-css
  " requires: :CocInstall coc-diagnostic
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Text editing 
  Plug 'sheerun/vim-polyglot' " Syntax support for most languages
  Plug 'tpope/vim-commentary' " Toggle comments, 'gcc' in normal, 'gc' in visual
  Plug 'tpope/vim-surround'   " Quotes, parenthesis

  " Shell formatting
  Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

  " Gotta have colors: https://vimcolorschemes.com/
  Plug 'drewtempelmeyer/palenight.vim'
  " Plug 'dracula/vim', { 'as': 'dracula' }
  " Plug 'embark-theme/vim', { 'as': 'embark' }
  " Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  " Plug 'bluz71/vim-nightfly-guicolors'
  " Plug 'morhetz/gruvbox'
  " Plug 'ghifarit53/tokyonight-vim'
  " Plug 'sainnhe/everforest'
  " Plug 'franbach/miramare'
  " Plug 'arcticicestudio/nord-vim'
  " Plug 'Rigellute/shades-of-purple.vim'
  " Plug 'Rigellute/rigel'
  " Plug 'mhartington/oceanic-next'
  " Plug 'bcicen/vim-vice'
  " Plug 'flrnd/candid.vim'
  " Plug 'wadackel/vim-dogrun'
  " Plug 'yassinebridi/vim-purpura'
  " Plug 'wojciechkepka/bogster'
  " Plug 'archseer/colibri.vim'
  " Plug 'relastle/bluewery.vim'
  " Plug 'Nequo/vim-allomancer'
  " Plug 'cseelus/vim-colors-tone'
  " Plug 'matveyt/vim-modest'
  " Plug 'kadekillary/skull-vim'
  " Plug 'kwsp/halcyon-neovim'

call plug#end()


" Mappings

  let mapleader = '\'


" FILE NATIGATION

  " jump to file and quick search via zfz
  nnoremap <c-p> :Files!<cr>
  nnoremap <c-f> :Rg!
  nnoremap <leader>p :Files!<cr>
  nnoremap <leader>f :Rg!

  " Explore file tree, open splits with `v` or `<cr>`
  let g:netrw_banner = 0                 " Cleaner explorer
  let g:netrw_liststyle = 3              " Explorer tree view by default
  let g:netrw_altv=1                     " Opne splits to the right
  let g:netrw_browser_split=4            " Open in prior window
  let g:netrw_list_hide=netrw_gitignore#Hide()
  let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'

  " Use spaces instead of default tabs, requires 'z0mbix/vim-shfmt'
  let g:shfmt_extra_args = '-i 4'


" BUFFERS AND SPLITS

  " Switch between alternate buffers
  nnoremap <leader>= <c-^>

  " List and jump to buffer by name or number 
  " nnoremap <leader>b :buffer <c-z><s-tab>
  nnoremap <leader>/ :ls<cr>:buffer<space>

  " Cycle through buffers
  noremap <tab><tab> :bnext<cr>
  noremap <s-tab><s-tab> :bprev<cr>

  " Vertical split
  nnoremap <leader>s <c-w><c-v>
  nnoremap <leader>v <c-w><c-v>
  nnoremap <leader>' <c-w><c-v>

  " Move to left and right split
  nnoremap <leader>, <c-w><c-h>
  nnoremap <leader>. <c-w><c-l>

  " Only leave this split opened
  nnoremap <leader>o :only<cr>


" EDITING HELPERS

  " ESlint fix format (lint)
  nmap <leader>l :CocCommand eslint.executeAutofix<cr>

  " Shell formatting. Requires: go install mvdan.cc/sh/v3/cmd/shfmt@latest
  " nmap <leader>l :!shfmt %
  " nmap <leader>l :Shfmt

  " Toggle line numbers
  nmap <leader>n :set invnumber<cr>

  " Clear search results when clearing screen
  nnoremap <c-l> :nohlsearch<cr><c-l>

  " Force write file with `sudo`
  noremap <leader>W :w !sudo tee % > /dev/null<CR>

  " Remove trailing whitespace on save (.sh and .js only)
  autocmd BufWritePre .sh,.js * :%s/\s\+$//e


" Basic settings

  " Small break with the past
  set nocompatible                       " Better Vim
  set nobackup noswapfile                " Live dangerously and dont leave traces
  set backspace=indent,eol,start         " Allow backspace in insert mode
  set encoding=utf8                      " Set utf8 as standard encoding
  set ffs=unix,dos,mac                   " Use Unix as the standard file type
  set hidden                             " Allow hidden buffers even unsaved
  set clipboard=unnamed                  " Use the OS clipboard by default (`+clipboard)
  set ttyfast                            " Optimize for fast terminal connections
  set scrolloff=3                        " Start scrolling three lines before

  " Command autocompletion
  set wildmenu                           " Use autocomplete menu for commands
  set wildmode=list:longest,full         " Match longest and full filenames
  set path+=**                           " Search subfolders with `:find`

  " Indentation
  set smarttab       " Use shiftwidth value
  set shiftwidth=2   " Number of spaces for 'autoindent'
  set tabstop=2      " Number of spaces for tab key
  set expandtab      " Required when using tabstop and shiftwidth
  set smartindent    " Mostly match '{' and '}' indentation

  " Line wrap
  set wrap           " Visually truncate long lines
  set linebreak      " Show long lines with line break
  set textwidth=90   " Will break lines at given column
  set colorcolumn=+1 " Show where it ends

  " Enable file detection, plugins and indent per filetype
  filetype plugin indent on

  " Sensible search
  set incsearch      " Makes search act like search in modern browsers
  set ignorecase     " Ignore case when searching
  set smartcase      " But preserve case whenever uppercase is used
  set hlsearch       " Highlight search results

  " Matching parenthesis, etc
  set showmatch      " Show matching brackets when text indicator is over them
  set matchtime=2    " Tenths of a second to blink when matching brackets

  " Color scheme
  syntax on                              " Required
  set termguicolors                      " 24-bit color when possible
  colorscheme palenight                  " Chosen colors, e.g. elflord, palenight

  " Cleanup for status line
  set noshowmode                         " Dont show mode automatically
  set title                              " Show window title with filename
  set cursorline                         " Highlight cursor line
  set number                             " Line numbers


" Simple status line

  " Basic setup
  set laststatus=2                       " Always show a status line
  set statusline=                        " Always be appending

  " Show modes in different colors. See :so $VIMRUNTIME/syntax/hitest.vim
  set statusline+=%#WildMenu#%{mode()==?'n'?'\ \ NORMAL\ ':''}
  set statusline+=%#DiffDelete#%{mode()==?'i'?'\ \ INSERT\ ':''}
  set statusline+=%#DiffDelete#%{mode()==?'r'?'\ \ REPLACE\ ':''}
  set statusline+=%#DiffChange#%{mode()==?'v'?'\ \ VISUAL\ ':''}

  " Show file flags in color when present.
  set statusline+=%#DiffDelete#          " Color
  set statusline+=%(%m%r%)               " Modified, read-only

  " Current filename with path.
  set statusline+=%#Directory#           " Color
  set statusline+=\ %F\                  " Full path
  set statusline+=\ %=                   " Separator between left and right aligned

  " Working dir and 'ruler' like info.
  set statusline+=\ %{getcwd()}\         " Working directory
  set statusline+=%#WildMenu#            " Color
  set statusline+=\ %l,%v\ %LL\          " Line number, column, total lines

