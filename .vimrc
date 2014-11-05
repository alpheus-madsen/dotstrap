" Let's auto-install NeoBundle if it isn't already installed...
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
call neobundle#end()

" .... plugins, such as ....
" NeoBundle "tpope/vim-unimpaired"
NeoBundle "myusuf3/numbers.vim"  " Toggle between absolute and relative numbers.

NeoBundleCheck
filetype plugin indent on
syntax on


""" Settings for numbers.vim
set number              " Turn on numbers for file
" For some reason, <C-C> doesn't work with numbers.vim unless we directly map it to <Esc>
nnoremap <C-C> <Esc>


""" Personal Preferences
" This is to ensure that direction keys work as expected
" (That is, to go up and down *visual* lines.)
nnoremap <up> gk
nnoremap <down> gj
