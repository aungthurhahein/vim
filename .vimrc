"
" Vim Configuraition- aungthurhahein@gmail.com
"
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'

"-----Python Plugin----------------------------------------------------
Plugin 'klen/python-mode'
Plugin 'fs111/pydoc.vim'
Plugin 'cburroughs/pep8.py'
Plugin 'valloric/YouCompleteMe'

"------Markdown Plugin-------------------------------------------------
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'
Plugin 'easymotion/vim-easymotion'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mileszs/ack.vim'
" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
"Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
"Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
"Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
"Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
"Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'tpope/vim-liquid'
"Plugin 'cakebaker/scss-syntax.vim'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch

syntax on

set mouse=a

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
"
" " Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
let g:solarized_termcolors=256

" Set the colorscheme
colorscheme solarized


" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1


" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0


" ----- scrooloose/syntastic settings -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
  au!
  au FileType tex let b:syntastic_mode = "passive"
augroup END


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1


" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

" YouCompleteMe:for C family support, this config path need to point out 
let g:ycm_global_ycm_extra_conf = '~atrx/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" default auto indentation
set ts=4 sts=4 sw=4 noexpandtab

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
  autocmd FileType python setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif
