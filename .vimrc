set nocompatible
set encoding=utf-8

""" Let's auto-install Vim-Plug if it isn't already installed...
"
" (I figure that this is the best thing to do, since I want to
" automate my Vim configuration!)
"
" Taken from https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
"
" (Note:  I used to use NeoBundle, but it's no longer maintained!)
"
" For a tutorial on Vim-Plug, see https://github.com/junegunn/vim-plug/wiki/tutorial
"
" A quick summary of commands:
"
"     :PlugInstall          " Installs plugins
"     :PlugStatus           " Check status of plugins
"     :PlugUpdate           " Update plugins; review changes by pressing 'D'
"     :PlugDiff             " Review changes of plugins if 'D' is skipped;
"                             review each change and press 'x' to roll back a particular change
"     :PlugClean            " After deleting/commenting out plugins to remove them;
"                           " restart Vim or ':source ~/.vimrc' first, though
"     :PlugUpgrade          " Upgrade vim-plug itself
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
	echo "Installing Vim-Plug\n"
	silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

""" .... plugins, such as ....
Plug 'myusuf3/numbers.vim'             " Toggle between absolute and relative line numbers.
Plug 'dhruvasagar/vim-zoom'            " <C-W> m for zooming in/out of split windows

""" Smart Tabs -- NOTICE:  This DOESN'T QUITE WORK!  It uses tabs at the
""" beginning of lines, and spaces everywhere else...which isn't quite true
""" smart-tabs...but I might have to figure out how to fix it myself...
""" Also, it doesn't seem to respect tabstop after text (for column aligning...)
"Plug 'vim-scripts/Smart-Tabs'          " Smart Tab support! (Depricated)
Plug 'Thyrum/vim-stabs'                " Smart Tab support!
Plug 'tpope/vim-surround'              " For dealing with 'surroundings'!  Parens, XML, etc.
Plug 'tpope/vim-repeat'                " So that . would work nicely with vim-surround
Plug 'tmhedberg/matchit'               " To use % on HTML/XML, LaTeX, etc...
Plug 'Townk/vim-autoclose'             " Autoclose brackets
"Plug 'vim-scripts/closetag.vim'        " Close HTML/XML tags with ^_
Plug 'alvan/vim-closetag'              " Close HTML/XML tags with ^_

""" Plug 'tpope/vim-speeddating'       " Adjust dates and times in a natural way...
""" Plug 'tpope/vim-commentary'        " Comment and Uncomment code.
""" Plug 'tpope/vim-unimpaired'        " Handy bracket mappings.
Plug 'vim-scripts/word_complete.vim'   " For word completion

""" File Navigation plugins; most of them augment NERDTree
" Plug 'kien/ctrlp.vim'                  " For filename searching
" Plug 'junegunn/fzf.vim'                " For filename searching

Plug 'preservim/nerdtree'                      " For filesystem navigating
Plug 'Xuyuanp/nerdtree-git-plugin'             " Git highlights for NERDTree
Plug 'ryanoasis/vim-devicons'                  " Icons for Vim Plugins
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Syntax highlighting for files
" Plug 'scrooloose/nerdtree-project-plugin'      " Save NERDTree State -- disabled due to weird error -- revisit this!
Plug 'PhilRunninger/nerdtree-buffer-ops'       " Highilght and Close Buffers from NERDTree
Plug 'PhilRunninger/nerdtree-visual-selection' " Visual Selection for NERDTree

""" It would be nice to select buffers, too!
Plug 'jlanzarotta/bufexplorer'                 " Visual Selection for buffers

""" Plug 'scrooloose/nerdcommenter'    " Comment and Uncomment code.
""" Plug 'scrooloose/syntastic'        " Syntax Checking
""" Plug 'Shougo/neocomplcache.vim'    " Neo-completion with cache
""" Plug 'Shougo/neocomplete.vim'      " Neo-completion with cache, requires Lua
""" NOTE:  (tagbar, easytags) requires installing Exuberant Ctags.

""" Plug 'xolox/vim-misc'                  " Miscellaneous things -- required by vim-easytags
""" Plug 'majutsushi/tagbar'               " Class outline viewer
""" Plug 'xolox/vim-easytags'              " Automated tag generation

""" Plug 'Lokaltog/vim-easymotion'     " Motion on speed...
""" Plug 'vim-tmux-navigator'          " Seemless window navigation between Vim and Tmux
Plug 'mbbill/undotree'                 " Undo Tree Goodness!
Plug 'airblade/vim-gitgutter'          " Show Git changes on the side...
Plug 'tpope/vim-obsession'             " Automatically save and restore sessions!

Plug 'christoomey/vim-tmux-navigator'  " For seamlessly using <c-{ijkl/}> for navigating vim/tmux splits

Plug 'leafgarland/typescript-vim'      " Syntax highlighting for ts files (typescript)
Plug 'ianks/vim-tsx'                   " Syntax highlighting for tsx files (ts/xml hybrids)
Plug 'LnL7/vim-nix'                    " Syntax highlighting for Nix files

""" Plug 'joker1007/vim-markdown-quote-syntax'    " Highlighting code snippets in MarkDown files
Plug 'godlygeek/tabular'               " Pre-requisite for vim-markdown
Plug 'plasticboy/vim-markdown'         " Syntax highlighting for markdown, including code snippets

Plug 'mechatroner/rainbow_csv'         " To work with CSV files


Plug 'uguu-org/vim-matrix-screensaver' " Vim Matrix 'screensaver'


""" For folding vertical columns
""" Unfortunately, this can overwhelm Vim; it can sometimes be useful, though...
""" Plug 'google/vim-maktaba'              " Plugin dev library for foldcol
""" Plug 'paulhybryant/foldcol'            " Column folding via <c-v> and :VFoldCol
call plug#end()


""" Settings for vim-zoom
nmap <C-W>z <Plug>(zoom-toggle)

""" Settings for vim-tmux-navigator
let g:tmux_navigator_disable_when_zoomed = 1    " To prevent navigating out of Vim when zoomed in on Vim

""" Settings for numbers.vim
set number              " Turn on numbers for file
" For some reason, <C-C> doesn't work with numbers.vim unless we directly map it to <Esc>
nnoremap <C-C> <Esc>

""" Settings for Smart-Tabs
" set list       " To turn on whitespace highlighting
" set nolist     " To turn off whitespace highlighting (the default)
" set listchars=tab:›\ ,trail:•,extends:≈,nbsp:⊡     " Highlight problematic whitespace
set listchars=tab:\,\ ,trail:.,extends:~,nbsp:#    " Highlight problematic whitespace
set backspace=indent,eol,start                     " Backspace settings for Insert mode
set tabstop=3                                      " Indents of 3 spaces.
set shiftwidth=6                                   " Column space indents of 6 spaces

set autoindent                                     " Turn on automatic indenting.
set copyindent                                     " Copy the previous indentation on autoindenting
" set paste                                        " Turn off indenting for pasting
" set nopaste                                      " Turn indenting back on
" set expandtab                                    " To turn off tabs -> ie use spaces for tabs...
                                                   " NOTE:  There are ways to do this python-specific...

""" Settings for Vim-GitGutter
let g:gitgutter_realtime = 1
let g:gitgutter_escape_grep = 1
let g:gitgutter_highligh_lines = 1

""" Settings for Vim-Markdown
let g:vim_markdown_folding_disabled = 1


""" Settings for alvan/vim-closetag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'


""" Personal Preferences
" This is to ensure that direction keys work as expected
" (That is, to go up and down *visual* lines.)
nnoremap k gk
nnoremap j gj
nnoremap <up> gk
nnoremap <down> gj

set hidden                       " Turn off requirement to save when switching between buffers
set background=dark              " Because I expect to do a lot of work in the CLI
set showmatch                    " Show matching brackets/parenthesis
set incsearch                    " Find as you type search
set hlsearch                     " Highlight search terms
set winminheight=0               " Windows can be 0 line high
set ignorecase                   " Case insensitive search
set smartcase                    " Case sensitive when uc present
set wildmenu                     " Show list instead of just completing
set wildmode=list:longest,full   " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]    " Backspace and cursor keys wrap too
set scrolljump=5                 " Lines to scroll when cursor leaves screen
set scrolloff=3                  " Minimum lines to keep above and below cursor
set foldenable                   " Auto fold code

" I'm always setting these things anyway:
set list                         " Show unusual whitespace
set nowrapscan                   " Don't wrap searches around
set wrap linebreak               " wrap and break lines at whitespace

" To enable block selection even for blank/short lines
set virtualedit+=block


" Highilight Row and Column options
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Insert newlines in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" I prefer to think of text files as markdown files:
au BufNewFile,BufRead *.txt set filetype=markdown

" Both 'ls' and 'buffers' list current buffers, but it's far more natural
" to abbreviate 'buffers' as 'bs' and not as 'ls'.  Hence...
" cnoreabbrev bs buffers    " This is somewhat outdated now that the bufexplorer plugin has been installed.
"
" Note that these are deliberately reversed -- I already use "bs" naturally
" for buffers, and I prefer the horizontal split over the vertical -- but I
" still want vertical to be an option, too!
cnoreabbrev bs :BufExplorerHorizontalSplit<CR>
cnoreabbrev bv :BufExplorerVerticalSplit<CR>
"
" With bufexplorer, you can quickly and easily switch between buffers by using the one of
" the default public interfaces:
"
"    \<Leader\>be normal open
"    \<Leader\>bt toggle open / close
"    \<Leader\>bs force horizontal split open
"    \<Leader\>bv force vertical split open
"
" Once the bufexplorer window is open you can use the normal movement keys (hjkl) to move
" around and then use <Enter> or <Left-Mouse-Click> to select the buffer you would like to
" open. If you would like to have the selected buffer opened in a new tab, simply press
" either <Shift-Enter> or t. Please note that when opening a buffer in a tab, that if the
" buffer is already in another tab, bufexplorer can switch to that tab automatically for
" you if you would like. More about that in the supplied VIM help.
