" Automatically install vim-plug and missing plugins, hurts startup time
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
\| endif

" Everything is within vim-plug to be able to declare plugins
" next to relevant configuration and settings. See end of file.
call plug#begin('~/.vim/plugged')


" BASIC STUFF

  let mapleader = '\'                    " Default, but a reminder
  nmap , \

  filetype plugin indent on              " Required for some settings below


" FILE NATIGATION

  set hidden    " Allow hidden buffers even unsaved
  set path+=**  " Jump to file with `:find` including subfolders

  " Open file in same folder as current file
  nnoremap <leader>e :e <c-r>=expand("%:p:h") . "/" <cr>

  " Switch between alternate buffers
  nnoremap <leader>= <c-^>

  " List and jump to buffer by name or number
  nnoremap <leader>/ :ls<cr>:buffer<space>

  " Move to left and right split
  nnoremap <leader>, <c-w><c-h>
  nnoremap <leader>. <c-w><c-l>

  " jump to file and quick search via (requries zfz plugin)
  nnoremap <leader>p :Files!<cr>
  nnoremap <leader>f :Rg!

  " Equalize split sizes when resizing terminal
  autocmd VimResized * wincmd =

  " Fuzzy search all the things.
  " cargo install --locked ripgrep bat
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'


" NAVIGATE WITHIN FILES

  " Sensible search
  set incsearch      " Makes search act like search in modern browsers
  set ignorecase     " Ignore case when searching
  set smartcase      " But preserve case whenever uppercase is used
  set hlsearch       " Highlight search results

  " Clear search results when clearing screen
  nnoremap <c-l> :nohlsearch<cr><c-l>

  " Show all function definitions in the location list
  nnoremap <leader>j :lvimgrep /function/ % \| lw<cr>

  " Transparently center view on the search result
  nnoremap n nzz
  nnoremap N Nzz


" DISPLAY

  " Line wrap
  set wrap           " Visually truncate long lines
  set linebreak      " Show long lines with line break
  set textwidth=80   " Will break lines at given column
  set colorcolumn=+1 " Show column where wrap happens

  " Matching parenthesis
  set showmatch      " Show matching brackets when text indicator is over them
  set matchtime=2    " Tenths of a second to blink when matching brackets

  " Show whitespace characters
  set list                               " Enable inviseble chars
  set listchars=tab:⟼\ ,nbsp:·,trail:·   " Only these ones

  " Toggle line numbers
  nnoremap <leader>n :set invnumber<cr>

  " Color scheme, e.g. elflord, desert
  syntax on                              " Required
  set termguicolors                      " 24-bit when available
  colorscheme desert                     " Default to a built-in colorscheme

  " Mostly random color
  function! RandomColor()
    let l:colors = 'embark palenight nightfly rigel tokyonight
          \ tone vice skull nord everforest sonokai shades_of_purple'
    let l:randint = str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
    execute 'colorscheme ' . split(colors)[randint % len(split(colors))]
    redraw!
    colorscheme
  endfunction

  " For easy access as a command
  command RandomColor call RandomColor()

  " After plugins are loaded
  autocmd VimEnter * RandomColor

  " Syntax support for most languages
  Plug 'sheerun/vim-polyglot'

  " Gotta have colors: https://vimcolorschemes.com/
  Plug 'embark-theme/vim', { 'as': 'embark' }
  Plug 'drewtempelmeyer/palenight.vim'
  Plug 'bluz71/vim-nightfly-guicolors'
  Plug 'Rigellute/rigel'
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'cseelus/vim-colors-tone'
  Plug 'bcicen/vim-vice'
  Plug 'kadekillary/skull-vim'
  Plug 'arcticicestudio/nord-vim'
  Plug 'sainnhe/everforest'
  Plug 'sainnhe/sonokai'
  Plug 'Rigellute/shades-of-purple.vim'


" EDITING

  set backspace=indent,eol,start         " Allow backspace in insert mode
  set visualbell                         " No bell sound
  set scrolloff=3                        " Start scrolling three lines before

  " File opening
  set encoding=utf8                 " Set utf8 as standard encoding
  set ffs=unix,dos,mac              " Use Unix as the standard file type
  set ttyfast                       " Optimize for fast terminal connections

  " Split at bottom and right. Also applies to quickfix preview window.
  set splitbelow splitright

  " File saving
  set nobackup noswapfile           " Live dangerously and dont leave traces
  set confirm                       " Ask for action instead of warning on :q
  set autoread                      " Reload files automatically

  " Autocomplete commands
  set wildmenu                      " Use autocomplete menu for commands
  set wildmode=longest:full,full    " Match longest and full filenames

  " Indentation
  set smarttab       " Use shiftwidth value
  set shiftwidth=2   " Number of spaces for 'autoindent'
  set tabstop=2      " Number of spaces for tab key
  set expandtab      " Required when using tabstop and shiftwidth
  set smartindent    " Mostly match '{' and '}' indentation

  " Don't replace tabs with spaces when editing makefiles
  autocmd Filetype makefile setlocal noexpandtab

  " Force write file with `sudo`
  noremap <leader>w :w !sudo tee % > /dev/null<CR>

  " Delete trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//ge

  " Delete whitespace at end of file on save
  autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

  " Copy/Paste to system clipboard
  " Check support with: `vim --version | grep .xterm_clipboard -o`
  " `sudo apt-get install vim-gtk3` or `sudo apt-get install vim-gui-common`
  noremap <c-c> "+y<cr>
  noremap <c-p> "+p<cr>

  " Text editing
  Plug 'tpope/vim-commentary' " Toggle comments, 'gcc' in normal, 'gc' in visual
  Plug 'tpope/vim-surround'   " Quotes, parenthesis

  " Git additions/deletions signs in the gutter
  Plug 'airblade/vim-gitgutter'
  let g:gitgutter_sign_allow_clobber = 0
  let g:gitgutter_sign_modified = '✦'

  " Avoid bad habits (might be frustrating!)
  Plug 'takac/vim-hardtime'
  let g:hardtime_default_on = 1


" LANGUAGE SERVER

  " Autocompletion
  let g:ale_completion_enabled = 1

  " Lint and fix
  set signcolumn=number              " Sign column and numbers share a column
  let g:ale_sign_column_always = 1   " Avoid visual jumps with permanent column
  let g:ale_sign_error = '☛'         " Also: ☛ ⚑ ✖ ● ★ ► ✸ ➽ ◆ ✦ ☗ 🌩 ⛑
  let g:ale_sign_warning = '☛'
  let g:ale_fix_on_save = 1
  let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'json': ['prettier', 'eslint'],
    \}

  " Format current file
  nnoremap <leader>af :ALEFix<cr>

  " Go to definition (overwrites ctags mapping)
  nnoremap <leader>ad :ALEGoToDefinition<cr>

  " Find references
  nnoremap <leader>ar :ALEFindReferences<cr>

  " Async Lining Engine (ALE)
  Plug 'dense-analysis/ale'


" STATUSLINE

  " Cleanup for status line
  set noshowmode                         " Dont show mode automatically
  set title                              " Show window title with filename
  set cursorline                         " Highlight cursor line
  set number                             " Line numbers

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


call plug#end()
