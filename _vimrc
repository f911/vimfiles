" ===========================================================================-
" Copyright (C) 2014 nick All Rights Reserved
" MAINTAINER:   nick
" CREATED:      2014-10-04
" LASTMODIFY:   2015-01-08
" VERSION:      V1.0
" DESCRIPTION:  
"   Gvim or Vim resource files, store as ~/.vim(*nix) or ~/_vimrc 
" (windows). Currently most for Gvim on Windows. use git to mantain it.
" 
" SECTIONS:
"   - Global Variables.
"   - Vundle The Vim Plugin System.
"   - User Interface.
"       -- 
"   - Text Editing And Display.
"       -- Indent Related
"       -- Search Related
"       -- Fold Related
"       -- File Type Specific
"   - Plugin Settings.
"       -- NERDTree
"       -- Yggdroot/indentLine
"   - Key Mapping
"   - Local Settings.
"
" TODO_LIST:    
"     - Windows CMD Supports
"
" REFERENCE:
"    - http://www.oschina.net/code/snippet_574132_13357
" =============================================================================


" < 0x01 >. Set Global Variables.
" ===============================

"   +-----------+-----------+---------+
"   |           | isWindows | isLinux |
"   +-----------+-----------+---------+
"   | isGUI     |           |         |
"   +-----------+-----------+---------+
"   | isConsole |           |         |
"   +-----------+-----------+---------+

    set nocompatible
    let g:isWindows = 0
    let g:isLinux   = 0
    let g:isGUI     = 0
    let g:isConsole = 0

    if(has("win32") || has("win64") || has("win95") || has("win16"))
        let g:isWindows = 1
    else
        let g:isLinux   = 1
    endif
    
    if has("gui_running")
        let g:isGUI     = 1
    else
        let g:isConsole = 1
    endif
" }


" < 0x02 >. VUNDLE THE VIM PLUGIN SYSTEM. 
" ==============================================================
" BRIEF:  see :h vundle for more details
" :PluginList      - list configured plugins
" :PluginInstall   - installs plugins; append '!' to update
" :PluginUpdate    - equal :PluginInstall!
" :PluginClean     - confirms removal of unused plugins; append '!' to 
"                    auto-appove
    filetype off
    if g:isLinux
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
    else
        set rtp+=~/vimfiles/bundle/Vundle.vim/
        let path='~/vimfiles/bundle'
        call vundle#begin(path)
    endif
    " Plugin 'XXXX' equals
    " Plugin 'https://github.com/vim-scrips/XXXX.git'
    Plugin 'gmarik/Vundle.vim'
    Plugin 'bling/vim-airline' " Plugin 'Lokaltog/vim-powerline' is deprecated 
    Plugin 'kien/ctrlp.vim'
    Plugin 'Shougo/unite.vim'
    Plugin 'majutsushi/tagbar'
    Plugin 'chrisbra/csv.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/syntastic'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'mhinz/vim-signify'
    Plugin 'jmcantrell/vim-virtualenv'
    Plugin 'edkolev/tmuxline.vim'
    Plugin 'edkolev/promptline.vim'

    Plugin 'Yggdroot/indentLine'
    Plugin 'a.vim'
    Plugin 'Align'
    Plugin 'bufexplorer.zip'
    Plugin 'ccvext.vim'
    Plugin 'cSyntaxAfter'
    Plugin 'chase/vim-ansible-yaml'
    " markdown plugins
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
"    Plugin 'vim-pandoc/vim-pandoc-syntax'
"   Plugin 'vim-pandoc/vim-pandoc'
    
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'std_c.zip'
    Plugin 'Shougo/neocomplcache.vim'
    Plugin 'taglist.vim'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-commentary'
    Plugin 'TxtBrowser'
    Plugin 'mattn/emmet-vim'
    Plugin 'Mark--Karkat'
    Plugin 'msanders/snipmate.vim'
    Plugin 'OmniCppComplete'
    Plugin 'repeat.vim'
    Plugin 'vim-javacompleteex'
    Plugin 'wesleyche/SrcExpl'
    Plugin 'xolox/vim-shell'
    Plugin 'xolox/vim-misc'
    Plugin 'ZoomWin'
    " full screen the window
"    Plugin 'derekmcloughlin/gvimfullscreen_win32'
    " Plugin 'jistr/vim-nerdtree-tabs'
    " Plugin 'EditPlus.git'   " a color scheme
    if g:isLinux
        call vundle#end()
    else
        call vundle#end(path)
    endif
" }


"  < 0x03 >. General settins for code writing and file editing. 
" ==============================================================================
" set nocompatible          showmode showcmd
" set shortmess=atI

" Edit Interface {{
" -----------------
    set number
    set ruler
    "set laststatus=2
    set cmdheight=1
    set cursorline
    hi CursorLine term=underline cterm=underline guibg=#202020
    hi CursorLine ctermbg=darkgrey guibg=gray13
    if g:isGUI
        " au GUIEnter * simalt ~x
        winpos 100 20
        set columns=180
        set lines=60
        " set guioptions-=T
    endif
   
    set background=dark
   
    if g:isWindows
        if g:isGUI
            colorscheme rainbow_neon
        else
            colorscheme Tomorrow-Night-Eighties
        endif
        set guifont=Terminus:h12
        "set guifont=gohufont-14:h12
        set guifontwide=Yahei\ Mono:h10.5
    else
        if g:isGUI
            set t_Co=256
        endif
        colorscheme rainbow_neon
        set guifont=Terminus\ 10
    endif
    
    " REF: http://vim.wikia.com/wiki/The_perfect_programming_font
    " set guifont=ProggyCleanTT\ 12
    " set guifont=ProggyClean
    " set guifont=YaHei\ Consolas\ Hybrid, h12
    " set guifont=Source\ Code\ Pro\ 11:h11
" }}

" tabs and indent 
" {
    set shiftwidth=4
    set tabstop=4
    set expandtab
    set cindent
    set smartindent
    set autoindent
    " Except for Makefiles; hard tabs of width 2
    autocmd FileType make set ts=2
    " And Markdown
    autocmd FileType markdown set sw=4
    autocmd FileType markdown set sts=4
" }


" search options 
" {
    set showmatch
    set incsearch
    set ignorecase
    set smartcase
    set hlsearch
" }

" file options 
" {
    syntax on
    filetype on
    filetype plugin on
    filetype plugin indent on
    if has("multi_byte")
        set encoding=utf-8
    endif
    "set fileencoding=utf-8
    "set termencoding=utf-8
    set fileencodings=ucs-bom,utf-8,cp936,default,latin-1,GB232,GBK,GB8030
    if g:isWindows
        set fileformat=dos
        set fileformats=dos,unix
    else
        set fileformat=unix
        set fileformats=unix,dos
    endif
    set formatoptions=croql
    set backspace=indent,eol,start
" }} 

" code fold 
" {
    set foldenable
    set foldmethod=indent    "/marker/syntax"
    set foldcolumn=1
    set foldlevelstart=20
    let javaScript_fold=1                 " JavaScript
    let perl_fold=1                       " Perl
    let php_folding=1                     " PHP
    let r_syntax_folding=1                " R
    let ruby_fold=1                       " Ruby
    let sh_fold_enabled=1                 " sh
    let vimsyn_folding='af'               " Vim script
    let xml_syntax_folding=1              " XML
    " use SPACE to unfold code, zR: open all folds zM: close all folds
    nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
" }


" set nowrap 
" {
    set writebackup
    set nobackup
    set noswapfile          " use version control insead
    set clipboard=unnamed   " use OS clipboard ro copypasta
    set paste               " fix bad autoindent of pasted text
    if has("mouse")         " Enable OS mouse clicking and scrolling
        set mouse=a
    endif
    set autoread
    set autochdir
" }

"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)



" autocmds to automatically enter hex mode and handle file writes properly
if has("autocmd")
  " vim -b : edit binary using xxd-format!
  augroup Binary
    au!

    " set binary option for all binary files before reading them
    au BufReadPre *.bin,*.hex,*.exe,*.dll setlocal binary

    " if on a fresh read the buffer variable is already set, it's wrong
    au BufReadPost *
          \ if exists('b:editHex') && b:editHex |
          \   let b:editHex = 0 |
          \ endif

    " convert to hex on startup for binary files automatically
    au BufReadPost *
          \ if &binary | Hexmode | endif

    " When the text is freed, the next time the buffer is made active it will
    " re-read the text and thus not match the correct mode, we will need to
    " convert it again if the buffer is again loaded.
    au BufUnload *
          \ if getbufvar(expand("<afile>"), 'editHex') == 1 |
          \   call setbufvar(expand("<afile>"), 'editHex', 0) |
          \ endif

    " before writing a file when editing in hex mode, convert back to non-hex
    au BufWritePre *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd -r" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif

    " after writing a binary file, if we're in hex mode, restore hex mode
    au BufWritePost *
          \ if exists("b:editHex") && b:editHex && &binary |
          \  let oldro=&ro | let &ro=0 |
          \  let oldma=&ma | let &ma=1 |
          \  silent exe "%!xxd" |
          \  exe "set nomod" |
          \  let &ma=oldma | let &ro=oldro |
          \  unlet oldma | unlet oldro |
          \ endif
  augroup END
endif
" refering from link http://vim.wikia.com/wiki/Improved_Hex_editing


"  < 0x04 >. SETTINGS FOR PLUGINS.
" =============================================================================

" plugins.bling/vim-airline
" {
    let g:Powerline_symbols = 'fancy'
    set t_Co=256
    set fillchars+=stl:\ ,stlnc:\
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme             = 'powerlineish'

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
" unicode symbols
"    let g:airline_section_b = '%{strftime("%C")}'
"    let g:airline_section_y = 'BN: %{bufnr("%")}'
"    let g:airline#extensions#tabline#enabled = 1
"    let g:airline#extensions#tabline#left_sep = ' '
"    let g:airline#extensions#tabline#left_alt_sep = '|'
    
" }

" plugins.yggdroot/indentline 
" {
    nmap <leader>il :IndentLinesToggle<CR>
    let g:indentLine_enabled=1
    "let g:indentLine_char = '┊'
    if g:isGUI
        let g:indentLine_char = "¦"
        let g:indentLine_first_char = "¦"
        "let g:indentLine_color_gui = '#A4E57E'
        let g:indentLine_color_gui = '#C0C0C0'
    else
        let g:indentLine_color_term =239
    endif
" }

" plugins.scrooloose/nerdtree 
" {
    autocmd bufenter * if (winnr("$") == 1 && 
                \ exists("b:NERDTreeType") && 
                \ b:NERDTreeType == "primary") | q | 
                \ endif
    if g:isWindows
        let g:NERDTreeCopyCmd= 'copy '
    else
        let g:NERDTreeCopyCmd= 'cp -r'
    endif
    nmap <F2> :NERDTreeToggle ..<CR>
" }


" plugins.derekmcloughlin/gvimfullscreen_win32 
" {
    map <F11> <Esc>:call libcallnr("gvimfullscreen.dll",
                \ "ToggleFullScreen", 0)<CR><C-L>
" }

" plugins.for.markdown
"    - plasticboy/vim-markdown 
"    - 
" {
    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} 
                \ set filetype=markdown
    let g:vim_markdown_folding_disabled=1 " Markdown
    let g:vim_markdown_math=1
    let g:vim_markdown_frontmatter=1
    let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
    let g:pandoc#filetypes#pandoc_markdown = 0
    let g:pandoc#modules#disabled = ["folding"]
    let g:pandoc#spell#enabled = 0
" }

" Plugins.scrooloose/syntastic 
" {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_python_python_exec = 'c:/Python27/'
" }

" plugins.kien/ctrlp 
" {
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    if exists("g:ctrl_user_command")
        unlet g:ctrlp_user_command
    endif
    set wildignore+=.* 
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"    let g:ctrlp_custom_ignore = {
"        \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"        \ 'file': '\v\.(exe|so|dll)$',
"        \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
"        \ } 
    "let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$', 'link': 'some_bad_symbolic_links'}
    "let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
    "let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows
" }

"  < 0x05 >. Map common keyboard shortcuts. 
" =============================================================================

imap <C-a> <Esc>I
imap <C-e> <ESC>A
map <C-Tab> <C-W>w
imap <C-Tab> <C-O><C-W>w
imap <C-Tab> <C-C><C-Tab>
map <kMinus> :cp<C-M>
map - :cp<C-M>
map <kPlus> :cn<C-M>
map + :cn<C-M>
vmap <C-c> "+y
vmap <S-Insert> "+gP
nmap <C-c> "+yy
vmap <C-x> "+d
if g:isWindows
    nmap <leader>e :tabnew $HOME/_vimrc<CR>
else
    nmap <leader>e :tabnew $HOME/.vimrc<CR>
endif
nmap <leader>t :tabnew<CR>
nnoremap <leader>pd :!pandoc % -f markdown -t html -s -o %.html && %.html<CR>
"nnoremap <leader>gq :%!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>
"vnoremap <leader>gq :!pandoc -f html -t markdown <bar> pandoc -f markdown -t html<CR>

