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
" YouCompleteMe
let g:ycm_language_server =[
            \ ]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ACK
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
" Ack.vim configured to use https://github.com/BurntSushi/ripgrep
if executable('rg')
  let g:ackprg = 'rg --vimgrep --smart-case --pretty'
endif

let g:ale_linters = {'rust': ['analyzer']}


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TAGBAR
nnoremap <silent> <C-t> :TagbarToggle<CR>
let g:tagbar_autofocus = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter
let g:gitgutter_enabled = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prettier
nnoremap <silent> <leader>p :Prettier<CR>

