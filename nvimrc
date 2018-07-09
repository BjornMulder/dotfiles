" _______                                              __       __            __        __                     __               __    __  __     __  ______  __       __  _______    ______
"/       \                                            /  \     /  |          /  |      /  |                   /  |             /  \  /  |/  |   /  |/      |/  \     /  |/       \  /      \
"$$$$$$$  |    __   ______    ______   _______        $$  \   /$$ | __    __ $$ |  ____$$ |  ______    ______ $$/_______       $$  \ $$ |$$ |   $$ |$$$$$$/ $$  \   /$$ |$$$$$$$  |/$$$$$$  |
"$$ |__$$ |   /  | /      \  /      \ /       \       $$$  \ /$$$ |/  |  /  |$$ | /    $$ | /      \  /      \$//       |      $$$  \$$ |$$ |   $$ |  $$ |  $$$  \ /$$$ |$$ |__$$ |$$ |  $$/
"$$    $$<    $$/ /$$$$$$  |/$$$$$$  |$$$$$$$  |      $$$$  /$$$$ |$$ |  $$ |$$ |/$$$$$$$ |/$$$$$$  |/$$$$$$  |/$$$$$$$/       $$$$  $$ |$$  \ /$$/   $$ |  $$$$  /$$$$ |$$    $$< $$ |
"$$$$$$$  |   /  |$$ |  $$ |$$ |  $$/ $$ |  $$ |      $$ $$ $$/$$ |$$ |  $$ |$$ |$$ |  $$ |$$    $$ |$$ |  $$/ $$      \       $$ $$ $$ | $$  /$$/    $$ |  $$ $$ $$/$$ |$$$$$$$  |$$ |   __
"$$ |__$$ |   $$ |$$ \__$$ |$$ |      $$ |  $$ |      $$ |$$$/ $$ |$$ \__$$ |$$ |$$ \__$$ |$$$$$$$$/ $$ |       $$$$$$  |      $$ |$$$$ |  $$ $$/    _$$ |_ $$ |$$$/ $$ |$$ |  $$ |$$ \__/  |
"$$    $$/    $$ |$$    $$/ $$ |      $$ |  $$ |      $$ | $/  $$ |$$    $$/ $$ |$$    $$ |$$       |$$ |      /     $$/       $$ | $$$ |   $$$/    / $$   |$$ | $/  $$ |$$ |  $$ |$$    $$/
"$$$$$$$/__   $$ | $$$$$$/  $$/       $$/   $$/       $$/      $$/  $$$$$$/  $$/  $$$$$$$/  $$$$$$$/ $$/       $$$$$$$/        $$/   $$/     $/     $$$$$$/ $$/      $$/ $$/   $$/  $$$$$$/
"       /  \__$$ |
"       $$    $$/
"        $$$$$$/
" Author: Bjorn Mulder
" Repo: https://github.com/bjornmulder/dotfiles

" basic config"{{{
""" disable all deamon keys"{{{
"disable arrows
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <left> <NOP>
inoremap <right> <NOP>
inoremap <up> <NOP>
inoremap <down> <NOP>

"}}}

" switch ; and :
nnoremap ; :
nnoremap : ;

"map leader to space
let mapleader = "\<space>"

" reload window on focus lost
:au FocusLost * :wa

" Fonts
set encoding=utf8

" map local leader to comma
let maplocalleader = ","

let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')

"adding some stuff to the wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/kohana_system/*

" set filetype to html + php for php files
autocmd BufRead,BufNewFile *.php setlocal filetype=php
autocmd BufRead,BufNewFile *.ctp setlocal filetype=php
autocmd BufRead,BufNewFile *.ts setlocal filetype=typescript
autocmd BufRead,BufNewFile *.njk setlocal filetype=jinja.html


" disable folding for markdown
autocmd Filetype markdown setlocal nofoldenable
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" auto source nvimrc
autocmd! bufwritepost .nvimrc source %

" use system clipboard
set clipboard=unnamed

" make vim save more
set hidden
set history=1000

" show whitespace
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<
" make backspace behave as it should
set backspace=indent,eol,start

"disable antient vi compaitibility
set nocompatible

" help me with this
set autoindent

" show mode in status bar
set showmode

" open splits the right
set splitright

" open splits below current
set splitbelow

" enable line numbering
set number
set relativenumber

" disable backupfiles
set nobackup

" disable swap files
set noswapfile

" show column and line number
set ruler

" show command bar
set showcmd

" cmd menu tabbing
set wildmenu

" set global filetype
set encoding=utf-8

" set default tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype php setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype php.html setlocal ts=4 sw=4 sts=0 expandtab

" More tabs for python
au BufNewFile,BufRead *.py
      \ set tabstop=4 |
      \ set softtabstop=4 |
      \ set shiftwidth=4 |
      \ set textwidth=79 |
      \ set expandtab |
      \ set autoindent |
      \ set fileformat=unix

" Don't even try to write backups
set nowb

" make regex behave
set regexpengine=1

" fixing some cursor slugishnes
set ttyfast

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" make folds behave
set foldmethod=marker

" try and fix laggy mode switching
set ttimeoutlen=50

" fix complete menu
set complete-=.,w,b,y,t
set completeopt=longest,menuone,preview

" note that must keep noinsert in completeopt, the others is optional
"set completeopt=noinsert,menuone,noselect


set wrap

" make myself behave
set colorcolumn=+1

" enable the mouse
set mouse=a

" Don't update the display while executing macros
set lazyredraw
" FoldText"{{{
function! MyFoldText()
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()"}}}
"}}}
" including all plugins"{{{
call plug#begin('~/.vim/plugged')
"plugin calls
""" Autocompletion "{{{
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']


"}}}
""" Custom plugins"{{{
Plug 'bjornmulder/vim-highlight'
Plug 'bjornmulder/vim-textobjects'
"}}}
""" Ctags "{{{

Plug 'craigemery/vim-autotag'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'rstacruz/vim-fastunite'

Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
"}}}
""" Editorconfig "{{{
Plug 'editorconfig/editorconfig-vim'
"}}}
""" Icons"{{{
Plug 'ryanoasis/vim-devicons'
"}}}
""" easy comments with gcc"{{{
Plug 'tpope/vim-commentary'"}}}
""" well... emmet"{{{
Plug 'mattn/emmet-vim'"}}}
""" syntax checker"{{{
Plug 'scrooloose/syntastic'
Plug 'beanworks/vim-phpfmt'
"}}}
""" brackets & tags"{{{
" auto {}[]''() etc
Plug 'jiangmiao/auto-pairs'
" change surrounding tag and braces
Plug 'tpope/vim-surround'"}}}
""" file utilities"{{{
" I MEAN NERDTREE!
Plug 'scrooloose/nerdtree'
" bar to visualise ctags
Plug 'majutsushi/tagbar'
"}}}
""" making things look pretty"{{{
" auto size splits
Plug 'zhaocai/GoldenView.vim'
" colors!
Plug 'jacoborus/tender.vim'
Plug 'flazz/vim-colorschemes'
Plug 'sickill/vim-monokai'
""" airline"{{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'"}}}"}}}
""" git"{{{
" git utilities
Plug 'jreybert/vimagit'
" git markings in file
Plug 'tpope/vim-fugitive'
" git markings in the gutter
Plug 'airblade/vim-gitgutter'
"}}}
""" Filetype plugins"{{{
""" html"{{{
Plug 'othree/html5.vim'
" autocomp <html></html> tags
Plug 'tmhedberg/matchit'
" close html tags
Plug 'alvan/vim-closetag'"}}}
""" sass"{{{
Plug 'cakebaker/scss-syntax.vim'"}}}
""" javascript"{{{
Plug 'isRuslan/vim-es6'
Plug 'walm/jshint.vim'
" better js
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'elzr/vim-json'
Plug 'itspriddle/vim-jquery'
Plug 'othree/javascript-libraries-syntax.vim'

"}}}
""" PHP "{{{
Plug 'jwalton512/vim-blade'
Plug 'stephpy/vim-php-cs-fixer'

" requires phpactor
Plug 'phpactor/phpactor' ,  {'do': 'composer install'}

Plug 'roxma/ncm-phpactor'

Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'tobyS/pdv'
Plug 'tobyS/vmustache'

Plug 'bjornmulder/vim-test'

Plug 'noahfrederick/vim-laravel'
Plug 'noahfrederick/vim-composer'

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
"}}}
""" markdown"{{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'"}}}
""" mysql "{{{
Plug 'vim-scripts/SQLComplete.vim'
"}}}
"}}}
""" Snippets"{{{
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
"}}}
""" VimWiki"{{{
Plug 'vimwiki/vimwiki'"}}}
""" ctrlp"{{{
Plug 'ctrlpvim/ctrlp.vim'
"}}}
""" Beautifull indentation "{{{
Plug 'Yggdroot/indentLine'
"}}}
""" Vdebug "{{{
Plug 'joonty/vdebug'
"}}}
""" mysql "{{{
Plug 'NLKNguyen/pipe.vim'  " dependency
Plug 'NLKNguyen/pipe-mysql.vim'
"}}}
""" easymotion "{{{
Plug 'easymotion/vim-easymotion'
"}}}
""" Grammar checking"{{{
Plug 'rhysd/vim-grammarous'
"}}}
""" TypeScript"{{{
Plug 'leafgarland/typescript-vim'
"}}}
""" SuperTab"{{{
Plug 'ervandew/supertab'
"}}}
" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required
"}}}
" Plugin Config"{{{
" ncm2{{{
" Use <TAB> to select the popup menu:
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"}}}
"gitgutter config"{{{
set updatetime=250
let g:gitgutter_realtime = 1"}}}
" ctrlP "{{{
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/kohana_system/*,*/panoview/*,*/huiswerk/*,*/node_modules/*,*/dist/*     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*.pyc
let NERDTreeIgnore = ['\.pyc$']

let g:ctrlp_follow_symlinks=0
let g:ctrlp_clear_cache_on_exit=0

let g:ctrlp_root_markers = ['robots.txt', 'package.json']
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|kohana_system|kohana_modules|huiswerk|panoview|node_modules)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
"}}}
" syntastic"{{{
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['jshint']"}}}
" closetag"{{{
let g:closetag_filenames = "*.html,*.xhtml,*.phtml""}}}
" airline"{{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
"molokai
let g:airline_theme='solarized'
"}}}
" handlebars files highlighting"{{{
au BufReadPost *.hbs set syntax=html
au BufReadPost *.hbs set filetype=html
au BufReadPost *.handlebars set syntax=html
au BufReadPost *.handlebars set filetype=html"}}}
" pandoc"{{{
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0"}}}
" vimwiki"{{{
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]"}}}
" indentline "{{{
let g:indentLine_char = '¦'
"}}}
" easymotion {{{
" Move to line
map <Leader>el <Plug>(easymotion-bd-jk)
nmap <Leader>el <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>ew <Plug>(easymotion-bd-w)
nmap <Leader>ew <Plug>(easymotion-overwin-w)
"}}}
" superTab "{{{
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"
" "}}}
" Instant markdown{{{
let g:instant_markdown_autostart = 0
"}}}
" PHP-fmt{{{
let g:phpfmt_standard = '/.DIJ.xml'
"}}}
" styling"{{{
syntax enable
set background=dark
colorscheme solarized
" tender
" hybrid

" Set split separator to Unicode box drawing character
set encoding=utf8
set fillchars=vert:│

" Override color scheme to make split the same color as tmux's default
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
hi LineNr ctermbg=bg
hi foldcolumn ctermbg=bg
hi VertSplit ctermbg=bg ctermfg=bg

"}}}
" leader commands"{{{

" Better split navigation
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

nnoremap <leader>td :TernDef<CR>
nnoremap <leader>tc :TernDoc<CR>
nnoremap <leader>tty :TernType<CR>
nnoremap <leader>tr :TernRefs<CR>

" Nerdtree shortcut
nnoremap <leader>tt :NERDTreeToggle<CR>

" TagBar shortcut
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" Stop vim from highlighting after a search
nnoremap <leader>nhl :nohlsearch<CR>

" Some plugin shortcuts INSTALL > UPDATE > CLEAN
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

" Enable and disable paste
nnoremap <leader>sp :set paste<CR>
nnoremap <leader>snp :set nopaste<CR>

" Fold toggle
nnoremap <leader>ff za

" CommandT
nnoremap <leader>o :CtrlP<CR>

" Reload ~/.vimrc
nnoremap <leader>r :source ~/.nvimrc<CR>

" Magit shortcut
nnoremap <leader>g :Magit<CR>

" Open current file in Sublime
nnoremap <leader>so :!sublime %:p<CR>

" Cordova shortcuts
nnoremap <leader>cpi :!cordova prepare ios<CR>
nnoremap <leader>cpa :!cordova prepare android<CR>


"convert whole file to tabs
nnoremap <leader>ctt :set ts=2 <CR> :set et <CR> :%retab! <CR>


"}}}
" remapping"{{{
" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <


" tab config
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap td  :tabclose<CR>
nnoremap te  :tabedit<Space>


" faster moving around a file
noremap J 5j
noremap K 5k

" more natural line movement
nnoremap j gj
nnoremap k gk

"easier beginning/end of line
noremap H ^
noremap L $

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" Clean trailing whitespace
nnoremap <leader>cw mz:%s/\s\+$//<cr>:let @/=''<cr>`z


" Move lines up and down
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==

map <C-p> [unite]p

" Window Resizing {{{
" right/up : bigger
" left/down : smaller
nnoremap <m-right> :vertical resize +3<cr>
nnoremap <m-left> :vertical resize -3<cr>
nnoremap <m-up> :resize +3<cr>
nnoremap <m-down> :resize -3<cr>
" }}}
"}}}
" FileType specific config{{{
  " Php{{{
  let g:syntastic_php_checkers=['php', '/usr/local/bin']
  autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
  autocmd FileType php nnoremap  <leader>pd <ESC>:call pdv#DocumentCurrentLine()<CR>
  let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
  "}}}
"}}}
" change cursor depending on mode"{{{
" Use a blinking upright bar cursor in Insert mode, a blinking block in normal
if &term == 'xterm-256color' || &term == 'screen-256color'
  let &t_SI = "\<Esc>[5 q"
  let &t_EI = "\<Esc>[1 q"
endif

if exists('$TMUX')
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
endif

"     "}}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" }}}
" }}}
" Persistent Undo "{{{
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry
"}}}
" Snippet variables"{{{
let g:snips_author = 'Bjorn Mulder'
let g:snips_email = 'hello@bjorn-mulder.com'
let g:snips_github = 'http://github.com/BjornMulder'
"}}}
