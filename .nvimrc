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

" map local leader to comma
let maplocalleader = ","

let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')

"adding some stuff to the wildignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/kohana_system/*

" set filetype to html + php for php files
autocmd BufRead,BufNewFile *.php setlocal filetype=php
autocmd BufRead,BufNewFile *.ctp setlocal filetype=php.html
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
set history=100

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
""" easy comments with gcc"{{{
Plug 'tpope/vim-commentary'"}}}
""" well... emmet"{{{
Plug 'mattn/emmet-vim'"}}}
""" syntax checker"{{{
Plug 'scrooloose/syntastic'"}}}
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
""" filetype plugins"{{{
""" html"{{{
Plug 'othree/html5.vim'
" autocomp <html></html> tags
Plug 'tmhedberg/matchit'
" close html tags
Plug 'alvan/vim-closetag'"}}}
""" sass"{{{
Plug 'cakebaker/scss-syntax.vim'"}}}
""" javascript"{{{
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'isRuslan/vim-es6'
Plug 'sheerun/vim-polyglot'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
" better js
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'elzr/vim-json'
Plug 'itspriddle/vim-jquery'
Plug 'othree/javascript-libraries-syntax.vim'

"}}}
"}}}
""" autocompletion "{{{
Plug 'ervandew/supertab'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/deoplete.nvim'    "}}}
""" markdown"{{{
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'"}}}
""" VimWiki"{{{
Plug 'vimwiki/vimwiki'"}}}
""" command-T"{{{
Plug 'ctrlpvim/ctrlp.vim'
"}}}
""" Beautifull indentation "{{{
Plug 'Yggdroot/indentLine'
"}}}
""" phpcomplete "{{{
Plug 'shawncplus/phpcomplete.vim'
Plug 'Shougo/vimproc'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-jedi'
"}}}
""" jinja "{{{
Plug 'lepture/vim-jinja'"}}}
""" mysql "{{{
Plug 'vim-scripts/SQLComplete.vim'
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
""" ultisnips"{{{
" Track the engine.
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
"}}}
""" TypeScript"{{{
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
"}}}
""" Ionic"{{{
Plug 'akz92/vim-ionic2'
"}}}
""" Latex"{{{
Plug 'lervag/vimtex'
"}}}
" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required
"}}}
" Plugin Config"{{{
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

let g:ctrlp_root_markers = ['robots.txt']
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
" superTab "{{{
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"
" "}}}
" deoplete"{{{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
let g:neosnippet#snippets_directory='~/dotfiles/snippets/vim'

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
augroup end

au FileType php set omnifunc=phpcomplete#CompletePHP
let php_sql_query=1
let php_htmlInStrings=1
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
let g:deoplete#omni_patterns = {}
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
""}}}
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


" Write shortcut (don's really use it though)
nnoremap <Leader>w :w<CR>

" CommandT
nnoremap <leader>o :CtrlP<CR>
" Reload ~/.vimrc
nnoremap <leader>r :source ~/.nvimrc<CR>

" Magit shortcut
nnoremap <leader>g :Magit<CR>

" Emmet shortcut
nnoremap <leader>e <C-Y>,

" Open current file in Sublime
nnoremap <leader>so :!sublime %<CR>

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

" Window Resizing {{{
" right/up : bigger
" left/down : smaller
nnoremap <m-right> :vertical resize +3<cr>
nnoremap <m-left> :vertical resize -3<cr>
nnoremap <m-up> :resize +3<cr>
nnoremap <m-down> :resize -3<cr>
" }}}
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
" text objects"{{{
" Motions for "next/last object". For example, "din()" deletes contents of
" next ()
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>

onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
function! s:NextTextObject(motion, dir)
  let c = nr2char(getchar())

  if c ==# "b"
    let c = "("
  elseif c ==# "B"
    let c = "{"
  elseif c ==# "d"
    let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction
"}}}
" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HiInterestingWord(n) " {{{
  " Save our location.
  normal! mz

  " Yank the current word into the z register.
  normal! "zyiw

  " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
  let mid = 86750 + a:n

  " Clear existing matches, but don't worry if they don't exist.
  silent! call matchdelete(mid)

  " Construct a literal pattern that has to match at boundaries.
  let pat = '\V\<' . escape(@z, '\') . '\>'

  " Actually match the words.
  call matchadd("InterestingWord" . a:n, pat, 1, mid)

  " Move back to our original location.
  normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HiInterestingWord(6)<cr>

" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

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
let g:snips_email = 'info@bjorn-mulder.com'
let g:snips_github = 'http://github.com/BjornMulder'
"}}}
