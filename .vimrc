" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: Eric Solomon
"          http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: Edited ./.vimrc based on the file provided at above URL
"
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
set nobackup

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.

" Clear filetype flags before changing runtimepath to force Vim to reload them.
" Do this to load Vundle
filetype off

" Vundle requirements
call plug#begin()

" Vim-plug bundles
" vim-tmux-navigator
Plug 'christoomey/vim-tmux-navigator'
" Go syntax highlighting
Plug 'fatih/vim-go'
" plugin on GitHub repo
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-pathogen'
" jellybeans color scheme
Plug 'nanotech/jellybeans.vim'
" Nord color scheme
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
" June Gunn's fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" ctrlp vim tags
Plug 'ctrlpvim/ctrlp.vim'
" vim tagbar
Plug 'majutsushi/tagbar'
" NERDtree file sidebar
Plug 'scrooloose/nerdtree'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-scripts/ZoomWin'
Plug 'liuchengxu/vim-which-key'
Plug 'MilesCranmer/gso'
Plug 'leafgarland/typescript-vim'
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'
Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'godoctor/godoctor.vim'
Plug 'mattn/emmet-vim'
Plug 'supercollider/scvim'
Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-salve'
Plug 'kien/rainbow_parentheses.vim'
Plug 'rust-lang/rust.vim'
Plug 'pechorin/any-jump.vim'
Plug 'mhinz/vim-startify'
call plug#end()         " required

"filetype plugin indent on " required

" Enable syntax highlighting
"syntax on

" Enable toggle for auto-indenting on pasting
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set cindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Set EOL to appear as close as possible to 80 characters
set tw=80
set wrap

" Give access to system clipboard with * and + registers
set clipboard=unnamed
set clipboard=unnamedplus

" Syntax highlighting for Assembly
autocmd BufNewFile,BufRead *.ys set ft=asm
autocmd BufNewFile,BufRead *.ys set nosmartindent

"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

"------------------------------------------------------------
" Max tabs open
set tabpagemax=100

"------------------------------------------------------------
" merlin and ocp-indent for ocaml
let g:opamshare = substitute(system('opam config var share'), '\n$','','''')
"execute "set rtp+=" . g:opamshare."/merlin/vim"

let g:syntastic_ocaml_checkers = ['merlin']

"set rtp+=~/opam/system/share/typrex/ocp-indent/ocp-indent.vim
autocmd FileType ocaml source /home/eric/.opam/system/share/typerex/ocp-indent/ocp-indent.vim

"------------------------------------------------------------
" enable matchit.vim
set nocompatible
filetype plugin on
runtime macros/matchit.vim
let s:conditionalEnd = '\(([^()]*\)\@!\<end\>\([^()]*)\)\@!'
autocmd FileType octave let b:match_words = '\<if\>\|\<while\>\|\<for\>\|\<switch\>:' .
       \ s:conditionalEnd . ',\<if\>:\<elseif\>:\<else\>:' . s:conditionalEnd

"------------------------------------------------------------
" Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=matlab
augroup END
" Use keywords from Octave syntax language file for autocomplete
"if has("autocmd") && exists("+omnifunc")
"  autocmd Filetype octave
"        \if &omnifunc=="" |
"        \setlocal omnifunc=syntaxcomplete#Complete |
"        \endif
"endif

" when editing a *.m file, type 'K' in normal mode and the word under the cursor
" will be searched for in the GNU Octave documentation index. Pressing ','
" yields the next occurrence
autocmd FileType matlab setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
" autocmd FileType matlab setlocal keywordprg=info\ matlab\ --vi-keys\ --index-search
"
let g:syntastic_mode_map = { 'passive_filetypes': ['matlab'] }

"-----------------------------------------------------------"
" Colorscheme
colorscheme jellybeans

"-----------------------------------------------------------"
" dense-analysis/ale
" let g:ale_lint_on_enter = 0
let g:ale_linters = {
        \'cpp': [ 'clangtidy' ],
        \'proto': ['buf-check-lint',],
        \'javascript': ['eslint',],
        \'javascriptreact': ['eslint',],
        \'typescript': ['eslint',],
        \'typescriptreact': ['eslint',],
\}
let g:ale_fixers = {
        \'*': ['remove_trailing_lines', 'trim_whitespace'],
        \'cpp': [ 'clangtidy' ],
        \'rs': [ 'rustfmt' ],
        \'javascript': ['prettier', 'eslint'],
        \'javascriptreact': ['prettier', 'eslint'],
        \'typescript': ['prettier', 'eslint'],
        \'typescriptreact': ['prettier', 'eslint'],
        \'css': ['prettier'],
\}
let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_cpp_clang_options = '-std=c++14 -Wall -Ibuild'
let g:ale_cpp_gcc_options = '-std=c++14 -Wall -Ibuild'
let g:ale_cpp_clangtidy_options = '-Ibuild'

"-----------------------------------------------------------"
let g:vim_jsx_pretty_template_tags = ['html', 'jsx', 'div']

"-----------------------------------------------------------"

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"-----------------------------------------------------------"
" Mappings {{{1
"
" Useful mappings


" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$


" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"lose the current buffer
map <leader>bd :Bclose<cr>


" Close all the buffers
map <leader>ba :1,1000 bd!<cr>


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove


" Useful mappings to move between tabs
map <leader>g{i} :{i}gt<cr>
nnoremap <S-h> gT<cr>
nnoremap <S-l> gt<cr>


" Copy to clipboard
vnoremap <leader>y :w !xclip -i -sel c<cr>
nnoremap <leader>p :w !xclip -o -sel -c<cr>


" Switch present working directory to directory of current file
map <leader>cpwd :lcd %:p:h<cr>


" Copy and paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa


" June Gunn's Fuzzy Finder
" Mapping selected mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)


" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)


" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


" Replace the default dictionary completion with fzf-based
" fuzzy completion
inoremap <expr> <c-x><c-k> fzf#complete('cat /usr/share/dict/words')


" Vim + Ctags + Ctrlp
nnoremap <leader>. :CtrlPTag<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" NERDtree
map <C-n> :NERDTreeToggle<CR>

" ZoomWin
nnoremap <silent> <C-w>w :ZoomWin<CR>

" vim-which-key
nnoremap <silent> <leader> :WhichKey '\'<CR>
"------------------------------------------------------------
