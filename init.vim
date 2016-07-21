let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let mapleader = ","

"powerline
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
let g:airline_powerline_fonts = 1

if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

syntax on

"Vim-Plug {
let s:vim_plug_dir=expand($HOME.'/.config/nvim/autoload')
if !filereadable(s:vim_plug_dir.'/plug.vim')
    execute '!wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -P '.s:vim_plug_dir
    let s:install_plug=1
endif

call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/vimproc', {'do' : 'make'}

"Plug 'flazz/vim-colorschemes'
Plug 'fmoralesc/vim-tutor-mode'
Plug 'vim-scripts/ScrollColors'
Plug 'freeo/vim-kalisi'
Plug 'junegunn/seoul256.vim'
Plug 'vimwiki/vimwiki'
Plug 'sudar/vim-arduino-syntax'
Plug 'blarghmatey/split-expander'
Plug 'wavded/vim-stylus'
Plug 'digitaltoad/vim-jade'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 't9md/vim-choosewin'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'kchmck/vim-coffee-script'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'keith/swift.vim'
Plug 'kshenoy/vim-origami'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'xolox/vim-notes'
Plug 'junegunn/vim-emoji'

"clojure
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-static'
Plug 'kien/rainbow_parentheses.vim'
Plug 'jpalardy/vim-slime'
Plug 'slim-template/vim-slim'
Plug 'scrooloose/syntastic'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Add plugins to &runtimepath
call plug#end()

filetype plugin indent on     " Required!

colorscheme kalisi
set background=dark
set t_Co=256
" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
let g:airline_theme="kalisi"

" Numbers and Borders`
set number
set guioptions-=L
set guioptions-=r

"kill bell
set noerrorbells
set visualbell
set t_vb=

"stop shitting swps
set noswapfile
set nobackup
set nowritebackup

"easy align
vnoremap <silent> <Enter> :EasyAlign<Enter>

" stop undo files
set undofile
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set undoreload=10000

" hilight indention tabs
hi NonText ctermfg=darkgrey guifg=#565656
hi clear SpecialKey
hi link SpecialKey NonText

" nvim settings
let g:indentLine_color_term=238
let g:indentLine_color_gui='#565656'
let g:indentLine_char='â€¢'

let g:syntastic_javascript_checkers = ['eslint']

set encoding=utf-8
set modeline                   " i don't even know
set modelines=5
set noshowmode                   " indicate insert, replace, visual
set showcmd                    " show info about current operation in status line
set hidden                     " keep buffers hidden when abandoned (don't unload them)
set ttyfast                    " indicate fast terminal connection, helps with mouse + redraw stuff
set ruler                      " show line + column number of cursor
set backspace=indent,eol,start
set laststatus=2               " always show status lines, even in non-focused splits
set history=1000
set undofile                   " store undo history in fs
set undoreload=10000
set cpoptions+=J               " sentence has to be followed by two spaces after . ! ?
set lazyredraw                 " don't redraw while using macros, registers, etc.
set matchtime=3                " duration of parens hilight in 1/10 seconds
set showbreak=â†ª                " string to put at start of lines that have been wrapped
set splitbelow                 " spltting a window will put the new window below the current one
set splitright                 " same as above but for horizontal splits
                               " set fillchars=diff:â£¿

set nottimeout "these two options together determine whether to wait to receive mapping
set timeout
set autowrite         " write the contents of the file on each :next, :rewind, :make, etc.
set shiftround        " round indent to multiple of shiftwidth
set autoread          " automatically read changes in files from outside of vim (git pull, etc.)
set title             " set the window title to something meaningful
set nu                " show line numbers
set ignorecase
set smartcase         " override ignorecase if search pattern contains upper case letters
set incsearch         " hilight all search matches
set showmatch         " briefly jump to matching brackets on insert
set hlsearch          " hilight search results
set gdefault          " all regex matches are substituted by default. g toggles this behavior
set linebreak         " wrap lines at convenient points

" ----------------------------------------
" editing
set scrolloff=3       " minimum number of screen lines to keep above and below the cursor
set sidescrolloff=10  " minimum number of screen lines to keep left and right of the cursor
set sidescroll=1      " minimum number of columns to scroll horizontaly
set nowrap            " line wrapping
set showmatch         " Show briefly matching bracket when closing it.


"use system clipboard
set clipboard=unnamed

if has("gui")
  set macmeta "use option (alt) as meta key
endif

" nerd tree cusomiz
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"NERDTree
nmap <silent> <C-a> :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index', 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json', '.*\.o$', 'db.db']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" emoji
set completefunc=emoji#complete

" ----------------------------------------
"delimitMate
let g:delimitMate_expand_cr          = 1
let g:delimitMate_expand_space       = 1
let g:delimitMate_smart_matchpairs   = 1
let g:delimitMate_smart_quotes       = 1
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_autoclose          = 1


"Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*

" Tabs, spaces, wrapping {{{
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1
"set colorcolumn=+1
"}}}

"folding settings {{{
if v:version >= 600
  set nofoldenable
  set foldmethod=indent   "fold based on indent
  "set printoptions=paper:letter
  "set sidescrolloff=5
  "set mouse=nvi
endif
"}}}

" Wildmenu completion {{{
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code

" }}}
let g:session_autosave = 'no'

"Python/Django
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code

"git
set wildignore=*.o,*.obj,.git,*.pyc,*~,fugitive*

"make <leader>l clear the highlight as well as redraw
nnoremap <leader>l :nohls<CR><C-L>
inoremap <leader>l <C-O>:nohls<CR>

"turn syntastic checker off
nnoremap <leader>z :SyntasticToggleMode

"Clojure/Leiningen
set wildignore+=classes
set wildignore+=lib

" Choosewin
nmap  -  <Plug>(choosewin)
let g:choosewin_overlay_enable=1

" - - - - - - - - - - - - - - - - - - - -
" unite
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" OSX needs this...
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif

call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
    \ 'ignore_pattern', join([
        \ '\.git/',
        \ '\.sass-cache/',
        \ '\.tmp/',
        \ '\log',
        \ '\tmp',
        \ '\vendor/',
        \ '\node_modules/',
    \ ], '\|'))

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
" these three:
"   imap <buffer> <C-j> <Plug>(unite_select_next_line)
"   imap <buffer> <C-k> <Plug>(unite_select_previous_line)
"   imap <buffer> <c-a> <Plug>(unite_choose_action)
" are the same as:
"   imap <buffer> <C-j> <C-n>
"   imap <buffer> <C-k> <C-p>
"   imap <buffer> <c-a> <cr>
    imap <silent><buffer><expr> <C-s> unite#do_action('split')
    imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"   imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
    nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" General search
nnoremap <leader>/ :Unite -no-quit -keep-focus grep:.<cr>

" The prefix key
nnoremap [unite] <Nop>
"nmap <space> [unite]
nmap <leader>u [unite]

" General purpose
"nnoremap [unite]u :Unite -no-split -start-insert source<cr>
nnoremap [unite]u :Unite -no-split source<cr>

nnoremap <leader>b :Unite -no-split -buffer-name=buffer -start-insert buffer<cr>

" Files
nnoremap [unite]f :Unite -no-split -start-insert file_rec/async<cr>

" Files in rails
nnoremap [unite]rm :Unite -no-split -start-insert -input=app/models/ file_rec/async<cr>
nnoremap [unite]rv :Unite -no-split -start-insert -input=app/views/ file_rec/async<cr>
nnoremap [unite]ra :Unite -no-split -start-insert -input=app/assets/ file_rec/async<cr>
nnoremap [unite]rs :Unite -no-split -start-insert -input=spec/ file_rec/async<cr>

" Grepping
nnoremap [unite]g :Unite -no-split grep:.<cr>
nnoremap [unite]d :Unite -no-split grep:.:-s:\(TODO\|FIXME\)<cr>

" Content
nnoremap [unite]o :Unite -no-split -start-insert -auto-preview outline<cr>
nnoremap [unite]l :Unite -no-split -start-insert line<cr>
nnoremap [unite]t :!retag<cr>:Unite -no-split -auto-preview -start-insert tag<cr>

" Quickly switch between recent things
nnoremap [unite]F :Unite -no-split buffer tab file_mru directory_mru<cr>
nnoremap [unite]b :Unite -no-split buffer<cr>
nnoremap [unite]m :Unite -no-split file_mru<cr>

" Yank history
nnoremap [unite]y :Unite -no-split history/yank<cr>


" - - - - - - - - - - - - - - - - - - - -
"for better split navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
set noea

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

let g:tmux_navigator_save_on_switch = 1

:let g:session_autoload = 'no'

fu! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
