" USEFUL STUFF
" 1. reload vimrc by doing :source $MYVIMRC
" TODO: make {, [, (, close each other automatically
" TODO: figure out a way to create vertical splits faster, and when one opens
" up to select files from the current directory or do a fuzzy search for
" files.
"
"
"
"
"
" some stuff about tabs
" create a new tab - :tabnew
" go to the next tab - gt
"       can use a number before this to go to the tab that you want: i.e. 3gt
"       will take you to the 3rd tab (not move you 3 tabs forward)
" to go back a tab - gT
" to close a tab - :tabc[lose]
set relativenumber
packloadall

" Found this in ale when I downloaded it.. Not sure if I need it
" silent! helptags ALL
helptags ALL


" indentation
set expandtab
set shiftwidth=2

" set working directory to current file
set autochdir

" spellcheck
set spelllang=en
set spell
" set this for.....
" set spellfile=$HOME/...

" make search case insensitive by default
" can use \c or \C when searching to make it case sensitive or insensitive
set ic

" make cursor have a line
set cursorline




" just examples for my to look at if I need them
" tells vim when I press <F5> to surround a word in {}
" :map <F5> i{<Esc>ea}<Esc>
" F6 now writes () to a buffer
" :map <F6> i()<Esc>
" one key that can be used with mappings is the backslash. Here's two examples
" :map \p i(<Esc>ea)<Esc>
" :map \c i{<Esc>ea}<Esc>
" tried to create a mapping to the previous file instead of typing command e#
" every time
" :map \b <Esc>:e#<CR>


" Note: javascript formatting setup in ftplugin/javascript.vim
" Note: markdown formatting setup in ftplugin/markdown.vim
"
"
" Enable true color
if exists('+termguicolors')
  set termguicolors
endif
colorscheme desert
" for some reason tmux doesn't set this properly: this is happening on mac I
" don't know if it's going to happen on Linux. Also, if I change my Terminal
" color theme then this might cause issues.
" set background=light
