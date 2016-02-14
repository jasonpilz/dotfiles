" macVim keeps themes at: /Applications/MacVim.app/Contents/Resources/vim/runtime/colors
" macVim loads these in order ~/.vimrc, ~/.gvimrc

syntax enable

" Show ruler for 80 chars
:set colorcolumn=80

" Auto change directory to current (helps ctrlp to index only whats needed)
:se autochdir

" Turn off the left / right scrollbars
:set guioptions-=L
:set guioptions-=R
:set guioptions-=r
:set guioptions-=l

" Solarized theme config
set background=dark
" let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" Load with cursor column enabled
:set cursorcolumn

" Toggle the cursor column highlighting
function! CursorColumnToggle()
  if &cursorcolumn
    set nocursorcolumn
  else
    set cursorcolumn
  endif
endfunction

" Bind ',cc' to toggle cursorcolumn
let mapleader = ","
nmap <leader>cc :call CursorColumnToggle()<cr>

