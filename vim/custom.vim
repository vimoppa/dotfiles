""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" enter current millenium
set nocompatible

" Reset file detection
filetype off

" enable file detection
filetype plugin indent on

" indicate fast terminal conn for faster redraw
set ttyfast

" Wait to draw
set lazyredraw

" indicate terminal type for mouse code
"set ttymouse=xterm-kitty

" Enable syntax highlighting
syntax on

"show commands typed
set showcmd

" Show popup menu, even if there is one entry
set completeopt=menu,menuone,noselect,noinsert

" Do not show matching brackets by flickering
set noshowmatch

" Vertical windows should be split to right
set splitright

" Horizontal windows should split to bottom
set splitbelow

" Search down into subfolders
" Providers tab-completion for all file related task
set path+=**

set relativenumber
set number
set wildmenu
set encoding=UTF-8

" No annoying sound on errors
" set noerrorbells
" set novisualbell
set belloff=all
set t_vb=
set tm=500

" don't bell or blink
set noeb
set vb t_vb=

" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" Enable undo persistence
if has('persistent_undo')
    let target_path = expand('$HOME/.vim/.undo')

    if !isdirectory(target_path)
        call system('mkdir ' . target_path)
    endif

    let &undodir = target_path
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom ColorSheme:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('$TMUX')
    if has('nvim')
       set termguicolors
    else
        set term=screen-256color
    endif
endif

set t_Co=256
set background=dark

try
    colorscheme codedark " PaperColor gruvbox
    let g:PaperColor_Theme_Options = {
     \}
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cindent

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" disable autoident for filetypes that have incompetent indent files
" autocmd FileType vim,tex let b:ai=0

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" enable indentation list
set list
set listchars=tab:┊\ ,
" hi SpecialKey ctermfg=239 ctermbg=bg

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" merge signcolumn and number column
set signcolumn=yes

" TextEdit might fail if hidden is not set
set hidden

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowritebackup
set nowb
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tag Jumping:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TODO: bind to save key
" Create the `tags` file
command! MakeTags !ctags -R .
" - <C-]> to jump tags under cursor
" - g<C-]> for ambiguous tags
" - <C-t> to jump back up the tag stack


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto Completion:                                      |ins-completion|
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" You need to be in 'insert mode' for completion support.
" Commands:
" - <C-x><C-n> for only the current file
" - <C-x><C-f> for filenames (works with path trick!)
" - <C-x><C-]> for tags only
" - <C-n> for anything specified by the 'complete' option

" Navigation:
" <C-n> and <C-p> to go back and forth in the suggestion list


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Browsing:                                      |netrw-browse-map|
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner=0        " disable banner
let g:netrw_browser_split=4 " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" - :edit to browse files
" - <CR>/v/t to open in an h-split/v-split/tab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ACK:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" Ack.vim configured to use https://github.com/BurntSushi/ripgrep
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case --pretty'
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let NERDTreeNaturalSort = 1

let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']
" There is a predefined map used nerdfonts, to enable it
let g:NERDTreeGitStatusUseNerdFonts = 1
" How to hide the boring brackets([ ])?
let g:NERDTreeGitStatusConcealBrackets = 1

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Mirror the NERDTree before showing it. This makes it the same on all tabs.
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>m :NERDTreeFind<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:gitgutter_enabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autowrite

" enable folding
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

" disable code completion
let g:go_code_completion_enabled = 1

" Auto import dependencies when save the file
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1

" Enable meta linter and dispatch it on save
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

" Use popup-window for K and :GoDoc, rather than the preview-window
let g:go_doc_popup_window = 1

" let g:go_highlight_string_spellcheck=1

" set 'guru scope' for vim-go subcommands.
" autocmd BufRead /home/martin/go/src/github.com/user/pkg/*.go
"     \ :GoGuruScope github.com/user/pkg

" let g:go_auto_type_info = 1
let g:go_term_enabled = 1
let g:go_fmt_fail_silently = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:syntastic_go_checkers = ['go']
let g:go_list_type = "quickfix"
let g:go_template_autocreate = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable completion where available. (do not enable)
" let g:ale_completion_enabled = 1

" disable LSP feature for ale
let g:ale_disable_lsp = 1

" Keep the sign gutter open at all times
" let g:ale_sign_column_always = 1

" run ale_fix on buffer save
let g:ale_fix_on_save = 1

" Fix files with the specified fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['importjs', 'prettier', 'eslint'],
\}

" Enable Linting for specific filetypes
let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'go': ['go build', 'golint', 'gofmt', 'go vet'],
\}

" Only run linters named in ale_linters settings
let g:ale_linters_explicit = 1
let g:airline#extensions#ale#enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" syntax highlighting for comment in json files
autocmd FileType json syntax match Comment +\/\/.\+$+

" give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300"

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" install coc extensions
let g:coc_global_extensions = [
\ 'coc-json',
\ 'coc-git',
\ 'coc-tsserver',
\ 'coc-sql',
\ 'coc-prettier',
\ 'coc-eslint',
\ 'coc-clangd',
\ 'coc-pyright',
\ 'coc-db',
\]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SQL FILE TYPE:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't let sql completion ruin insert-mode
" disable annoying autocompletion on <Left><Right> keys
" Reference: satori/dotrc
let g:ftplugin_sql_omni_key_right = 'stub'
let g:ftplugin_sql_omni_key_left = 'stub'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" EDITORCONFIG:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" Disable for specific files.
au FileType gitcommit let b:EditorConfig_disable = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
