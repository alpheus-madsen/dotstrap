set nocompatible

""" Let's auto-install NeoBundle if it isn't already installed...
"
" (I figure that this is the best thing to do, since I want to
" automate my Vim configuration!)
"
" Taken from http://www.reddit.com/r/vim/comments/27nnsz/top_shortcuts_commands_configuration_for_vim/ci3sp5e
"
"
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  if !isdirectory(expand('~/.vim/bundle/neobundle.vim'))
    echo "Installing NeoBundle\n"
    silent execute '!mkdir -p ~/.vim/bundle'
    silent execute '!git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim'
  endif
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch "Shougo/neobundle.vim"

""" .... plugins, such as ....
NeoBundle "myusuf3/numbers.vim"             " Toggle between absolute and relative line numbers.
NeoBundle "dhruvasagar/vim-zoom"            " <C-W> m for zooming in/out of split windows


""" Smart Tabs -- NOTICE:  This DOESN'T QUITE WORK!  It uses tabs at the
""" beginning of lines, and spaces everywhere else...which isn't quite true
""" smart-tabs...but I might have to figure out how to fix it myself...
""" Also, it doesn't seem to respect tabstop after text (for column aligning...)
"NeoBundle "vim-scripts/Smart-Tabs"          " Smart Tab support!
NeoBundle "tpope/vim-surround"              " For dealing with 'surroundings'!  Parens, XML, etc.
NeoBundle "tpope/vim-repeat"                " So that . would work nicely with vim-surround
NeoBundle "tmhedberg/matchit"               " To use % on HTML/XML, LaTeX, etc...
NeoBundle "Townk/vim-autoclose"             " Autoclose brackets
"NeoBundle "vim-scripts/closetag.vim"        " Close HTML/XML tags with ^_
NeoBundle "alvan/vim-closetag"              " Close HTML/XML tags with ^_

""" NeoBundle "tpope/vim-speeddating"       " Adjust dates and times in a natural way...
""" Neobundle "tpope/vim-commentary"        " Comment and Uncomment code.
""" NeoBundle "tpope/vim-unimpaired"        " Handy bracket mappings.
NeoBundle "vim-scripts/word_complete.vim"   " For word completion

" NeoBundle "kien/ctrlp.vim"                  " For filename searching
" NeoBundle "scrooloose/nerdtree"             " For filesystem navigating

""" NeoBundle "scrooloose/nerdcommenter"    " Comment and Uncomment code.
""" NeoBundle "scrooloose/syntastic"        " Syntax Checking
""" NeoBundle "Shougo/neocomplcache.vim"    " Neo-completion with cache
""" NeoBundle "Shougo/neocomplete.vim"      " Neo-completion with cache, requires Lua
""" NOTE:  (tagbar, easytags) requires installing Exuberant Ctags.

""" NeoBundle "xolox/vim-misc"                  " Miscellaneous things -- required by vim-easytags
""" NeoBundle "majutsushi/tagbar"               " Class outline viewer
""" NeoBundle "xolox/vim-easytags"              " Automated tag generation

""" NeoBundle "Lokaltog/vim-easymotion"     " Motion on speed...
""" NeoBundle "vim-tmux-navigator"          " Seemless window navigation between Vim and Tmux
NeoBundle "mbbill/undotree"                 " Undo Tree Goodness!
NeoBundle "airblade/vim-gitgutter"          " Show Git changes on the side...
NeoBundle "tpope/vim-obsession"             " Automatically save and restore sessions!

NeoBundle "christoomey/vim-tmux-navigator"  " For seamlessly using <c-{ijkl/}> for navigating vim/tmux splits

NeoBundle "leafgarland/typescript-vim"      " Syntax highlighting for ts files (typescript)
NeoBundle "ianks/vim-tsx"                   " Syntax highlighting for tsx files (ts/xml hybrids)
NeoBundle "LnL7/vim-nix"                    " Syntax highlighting for Nix files

""" NeoBundle "joker1007/vim-markdown-quote-syntax"    " Highlighting code snippets in MarkDown files
NeoBundle "godlygeek/tabular"               " Pre-requisite for vim-markdown
NeoBundle "plasticboy/vim-markdown"         " Syntax highlighting for markdown, including code snippets

NeoBundle "mechatroner/rainbow_csv"         " To work with CSV files


NeoBundle "uguu-org/vim-matrix-screensaver" " Vim Matrix 'screensaver'


""" For folding vertical columns
""" Unfortunately, this can overwhelm Vim; it can sometimes be useful, though...
""" NeoBundle "google/vim-maktaba"              " Plugin dev library for foldcol
""" NeoBundle "paulhybryant/foldcol"            " Column folding via <c-v> and :VFoldCol

NeoBundleCheck
call neobundle#end()
filetype plugin indent on

syntax on


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
set listchars=tab:›\ ,trail:•,extends:≈,nbsp:⊡     " Highlight problematic whitespace
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
set nowrapscan                   " Don't wrap around

" To enable block selection even for blank/short lines
set virtualedit+=block


" Highilight Row and Column options
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Insert newlines in normal mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
