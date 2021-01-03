""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Vim Script
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default Config
set number
set encoding=UTF-8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom ColorSheme
try 
    colorscheme codedark
catch
endtry


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let g:NERDTreeWinPos = "left"
" nnoremap <silent> <leader>d :NERDTree-I<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$']
" Start NERDTree and leave the cursor in it. 
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
" KeyBindings:
" <u>        => move the tree root up one directory
" <C-u>      => same as 'u'
" <r>        => recursively refresh the current directory
" <C-r>      => recursively refresh the current root
" <m>        => display the NERDTree menu
" <C-c>      => change the tree root to the selected dir


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ACK
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" Ack.vim configured to use https://github.com/BurntSushi/ripgrep
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case --pretty'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGBAR
nnoremap <silent> <C-t> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter
let g:gitgutter_enabled = 1
