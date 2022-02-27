" https://github.com/gabssnake/dotfiles
" .vimrc


" LEADER MAPPINGS

  " Backlaslash for DVORAK, comma for QWERTY
  let mapleader = '\'
  nmap , \

  " Switch between alternate buffers
  nnoremap <leader>= <c-^>

  " List and jump to buffer by name or number
  nnoremap <leader>/ :ls<cr>:buffer<space>

  " Manage window splits without chords
  nnoremap <leader>s <c-w>

  " Open window vsplit with terminal
  nnoremap <leader>t :vert term<cr>

  " Open file in same folder as current file
  nnoremap <leader>e :e <c-r>=expand("%:p:h") . "/" <cr>

  " Toggle line numbers
  nnoremap <leader>n :set invnumber<cr>

  " Copy selection to system clipboard
  vnoremap <leader>y "+y<cr>

  " Force write file with `sudo`
  nnoremap <leader>w :w !sudo tee % > /dev/null<cr>

  " Custom command to change color scheme
  nnoremap <leader>c :RandomColor<cr>

  " Fuzzy search all the things (ZFZ plugin)
  nnoremap <leader>p :Files!<cr>
  nnoremap <leader>f :Rg!
  nnoremap <leader>b :Buffers!<cr>

  " Language server features (ALE plugin)
  nnoremap <leader>af :ALEFix<cr>
  nnoremap <leader>ad :ALEGoToDefinition<cr>
  nnoremap <leader>ar :ALEFindReferences<cr>
  nnoremap <leader>an :ALENext<cr>

  " File history in quickfix window (fugitive plugin)
  nnoremap <leader>h :0Gclog!<cr>

  " Enter focus mode (goyo and limelight plugin)
  nnoremap <leader>o :Focus<cr>


" AUTOMAGIC AND ERGONOMICS

  " Required for some settings
  filetype plugin indent on

  " Clear search results when clearing screen
  nnoremap <c-l> :nohlsearch<cr><c-l>

  " Equalize split sizes when resizing terminal
  autocmd VimResized * wincmd =

  " Common mistake to try :W expecting :w (probably dangerous)
  cnoreabbrev W w

  " Reselect visual selecting after indent
  vnoremap < <gv
  vnoremap > >gv

  " Transparently center view on the search result
  nnoremap n nzz
  nnoremap N Nzz

  " Move between multi-line paragraphs as if they were actual lines
  nnoremap j gj
  nnoremap k gk

  " Open file with `gf` even when it does not exist
  map gf :edit <cfile><cr>

  " Delete trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//ge

  " Delete whitespace at end of file on save
  autocmd BufWritePre * :%s/\(\s*\n\)\+\%$//ge

  " Don't replace tabs with spaces when editing makefiles
  autocmd Filetype makefile setlocal noexpandtab


" PLUGINS
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation

call plug#begin('~/.vim/plugged')

  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'

  Plug 'airblade/vim-gitgutter'
    let g:gitgutter_sign_allow_clobber = 0
    let g:gitgutter_sign_modified = '✦'

  Plug 'takac/vim-hardtime'
    let g:hardtime_default_on = 0

  Plug 'dense-analysis/ale'
    let g:ale_completion_enabled = 1
    let g:ale_sign_column_always = 1   " Avoid visual jumps with permanent column
    let g:ale_sign_error = '☛'         " Also: ☛ ⚑ ✖ ● ★ ► ✸ ➽ ◆ ✦ ☗ 🌩
    let g:ale_sign_warning = '☛'
    let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'json': ['prettier', 'eslint'],
      \}

  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/limelight.vim'
    let g:goyo_width = &textwidth + 10
    autocmd! User GoyoEnter Limelight
    autocmd! User GoyoLeave Limelight!
    command Focus Goyo

call plug#end()


" PREFERENCES

  set hidden    " Allow hidden buffers even unsaved
  set path+=**  " Jump to file with `:find` including subfolders

  " Sensible search
  set incsearch      " Makes search act like search in modern browsers
  set ignorecase     " Ignore case when searching
  set smartcase      " But preserve case whenever uppercase is used
  set hlsearch       " Highlight search results

  " Line wrap
  set wrap           " Visually truncate long lines
  set linebreak      " Show long lines with line break
  set textwidth=80   " Will break lines at given column
  set colorcolumn=81 " Shown column

  " Matching parenthesis
  set showmatch      " Show matching brackets when text indicator is over them
  set matchtime=2    " Tenths of a second to blink when matching brackets

  " Show whitespace characters
  set list                               " Enable invisible chars
  set listchars=tab:»\ ,nbsp:·,trail:·   " Only these ones

  " Color scheme, e.g. elflord, desert
  syntax on                              " Required
  set termguicolors                      " 24-bit color when available
  colorscheme desert                     " Default to a built-in colorscheme

  " Basic editing
  set backspace=indent,eol,start         " Allow backspace in insert mode
  set visualbell                         " No bell sound
  set scrolloff=8                        " Start scrolling three lines before
  "set signcolumn=number                 " Sign column and numbers in one

  " File opening
  set encoding=utf8                 " Set utf8 as standard encoding
  set ffs=unix,dos,mac              " Use Unix as the standard file type
  set ttyfast                       " Optimize for fast terminal connections

  " Somehow more familiar. Also applies to quickfix preview window.
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


" COLORS

" Different color each time vim runs
autocmd VimEnter * RandomColor

" Mostly random color
command RandomColor call RandomColor()
function! RandomColor()
  let l:colors = '
        \ embark nightfly rigel tokyonight tone vice bogster aylin ayu
        \ challenger-deep iceberg monokai-pro moonfly night-owl purpura
        \ shades-of-purple spaceduck synthwave toast
        \'
  let l:randint = str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
  execute 'colorscheme ' . split(colors)[randint % len(split(colors))]
  redraw!
  colorscheme
endfunction

" Cycle through all the custom colors
command ColorDisco call ColorDisco()
function! ColorDisco()
  let currDir = getcwd()
  exec "cd $HOME/.vim/colors"
  for myCol in split(glob("*"), '\n')
    if myCol =~ '\.vim'
      let mycol = substitute(myCol, '\.vim', '', '')
      exec "colorscheme " . mycol
      exec "redraw!"
      echo "colorscheme = ". myCol
      sleep 2
    endif
  endfor
  exec "cd " . currDir
endfunction
