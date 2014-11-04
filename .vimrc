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

NeoBundleCheck
filetype plugin indent on
syntax on
