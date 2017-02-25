let loaded_matchparen = 1
set number
set nocursorline
" basic config"{{{
" keep indentation on return
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

" switch ; and :
nnoremap ; :
nnoremap : ;"}}}
" save on focus lost
"map leader to space
let mapleader = "\<space>"
let maplocalleader = ","

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*,*/kohana_system/*,*/kohana_modules/*


filetype off
autocmd! bufwritepost .vimrc source %

" make backspace behave as it should
set backspace=indent,eol,start
set nocompatible
set autoindent

" show mode in status bar
set showmode

" open splits the right
set splitright

" open splits below current
set splitbelow

" enable line numbering
set number

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

" set tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent

au BufNewFile,BufRead *.py
      \ set tabstop=4
      \ set softtabstop=4
      \ set shiftwidth=4
      \ set textwidth=79
      \ set expandtab
      \ set autoindent
      \ set fileformat=unix

" Don't even try to write backups
set nowb

" enable regexes
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

" set listchars
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set nowrap

" make myself behave
set colorcolumn=+1
" Don't update the display while executing macros
set lazyredraw    

set synmaxcol=128

syntax sync minlines=256

" Trailing whitespace {{{
" Only shown when not in insert mode so I don't go insane.
augroup trailing
  au!
  au InsertEnter * :set listchars-=trail:⌴
  au InsertLeave * :set listchars+=trail:⌴
augroup END

" }}}
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
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" calling vundle
Plugin 'VundleVim/Vundle.vim'           "let vundle manage itself
"plugin calls
    """ easy comments with gcc"{{{
    Plugin 'tpope/vim-commentary'"}}}
    """ well... emmet"{{{
    Plugin 'mattn/emmet-vim'"}}}
    "syntax checker"{{{
    Plugin 'scrooloose/syntastic'"}}}
    """ brackets & tags"{{{
    " auto {}[]''() etc
    Plugin 'jiangmiao/auto-pairs'
    " change surrounding tag and braces
    Plugin 'tpope/vim-surround'"}}}
    """ file utilities"{{{
    " I MEAN NERDTREE!
    Plugin 'scrooloose/nerdtree'
    " bar to visualise ctags
    Plugin 'majutsushi/tagbar'
    "}}}
    """ making things look pretty"{{{
    " auto size splits
    " Plugin 'zhaocai/GoldenView.vim'
    " colors!
    Plugin 'flazz/vim-colorschemes'
    Plugin 'sickill/vim-monokai'
    """ git"{{{
    " git markings in the gutter
    Plugin 'airblade/vim-gitgutter'
    "}}}
    """ filetype plugins"{{{
    """ html"{{{
    Plugin 'othree/html5.vim'
    " autocomp <html></html> tags
    Plugin 'tmhedberg/matchit'
    "}}}
    """ sass"{{{
    Plugin 'cakebaker/scss-syntax.vim'"}}}
    """ javascript"{{{
    Plugin 'jelera/vim-javascript-syntax'
    Plugin 'pangloss/vim-javascript'
    Plugin 'isRuslan/vim-es6'
    " better js
    Plugin 'ternjs/tern_for_vim'"}}}
    
    "}}}
    """ autocompletion "{{{
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    "}}}
    """ markdown"{{{
    Plugin 'plasticboy/vim-markdown'
    "}}}
    """ VimWiki"{{{
       Plugin 'vimwiki/vimwiki'"}}}
    """ ctrlP"{{{
    Plugin 'ctrlpvim/ctrlp.vim'
    "}}}
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"}}}
" plugin config"{{{
    "gitgutter config"{{{
    set updatetime=250
    let g:gitgutter_realtime = 1"}}}
    " ctrlP "{{{
    " let g:ctrlp_map = '<c-p>'
    " let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'

    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

    let g:ctrlp_root_markers = ['robots.txt']

    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn|kohana_system|kohana_modules|panoview)$',
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
    " emmet config"{{{
    let g:user_emmet_leader_key='<c-e>'"}}}
    " airline"{{{
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#left_sep = ' '
    let g:airline#extensions#tabline#left_alt_sep = '|'
    "molokai
    let g:airline_theme='solarized'"}}}
    " handlebars files highlighting"{{{
    au BufReadPost *.hbs set syntax=html
    au BufReadPost *.hbs set filetype=html
    au BufReadPost *.handlebars set syntax=html
    au BufReadPost *.handlebars set filetype=html"}}}
    " make YCM compatible with UltiSnips (using supertab)"{{{
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'

    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger="<tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>""}}}
    " vimwiki"{{{
      let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]"}}}
    "}}}
" styling"{{{
syntax enable
set background=dark
colorscheme hybrid

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

" copy & pasting from system clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Nerdtree shortcut
nnoremap <leader>tt :NERDTreeToggle<CR>

" TagBar shortcut
nnoremap <silent> <leader>tb :TagbarToggle<CR>

" Stop vim from highlighting after a search
nnoremap <leader>nhl :nohlsearch<CR>

" Some plugin shortcuts INSTALL > UPDATE > CLEAN
nnoremap <leader>pi :PluginInstall<CR>
nnoremap <leader>pu :PluginUpdate<CR>
nnoremap <leader>pc :PluginClean<CR>

" Enable and disable paste
nnoremap <leader>sp :set paste<CR>
nnoremap <leader>snp :set nopaste<CR>

" Fold toggle
nnoremap <leader>ff za

" Convert markdown to pdf with a node module (markdown-pdf on npm)
nnoremap <leader>md :w<CR>:!markdown-pdf %<CR>


" Write shortcut (don's really use it though)
nnoremap <Leader>w :w<CR>

" CommandT
nnoremap <leader>o :CtrlP<CR>
" Reload ~/.vimrc
nnoremap <leader>r :source ~/.vimrc<CR>

" Magit shortcut
nnoremap <leader>g :Magit<CR>

" Emmet shortcut
nnoremap <leader>e <C-Y>,

" Toggle gundo tree
nnoremap <leader>u :GundoToggle<CR>


"}}}
" remapping"{{{
" indend / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <

" pastetoggle
set pastetoggle=<F2>

"tab config
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

" Use tab to jump between brackets, quotes and html tags
map <tab> %

" Move lines up and down
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-j> :m .+1<CR>==
    " copy to the clipboard"{{{
" For some reason Vim no longer wants to talk to the OS X pasteboard through "*.
" Computers are bullshit.
" function! g:FuckingCopyTheTextPlease()
"     let view = winsaveview()
"     let old_z = @z
"     normal! gv"zy
"     call system('pbcopy', @z)
"     let @z = old_z
"     call winrestview(view)
" endfunction

" function! g:FuckingCopyAllTheTextPlease()
"     let view = winsaveview()
"     let old_z = @z
"     normal! ggVG"zy
"     call system('pbcopy', @z)
"     let @z = old_z
"     call winrestview(view)
" endfunction

" noremap <leader>p "*p
" " noremap <leader>p mz:r!pbpaste<cr>`z
" vnoremap <leader>y :<c-u>call g:FuckingCopyTheTextPlease()<cr>
" nnoremap <leader>y VV:<c-u>call g:FuckingCopyTheTextPlease()<cr>
" nnoremap <leader>Y :<c-u>call g:FuckingCopyAllTheTextPlease()<cr>

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
