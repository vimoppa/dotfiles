set runtimepath+=~/.vim

" adopted: https://github.com/amix/vimrc
source ~/.vim/vim_runtime/basic.vim
source ~/.vim/vim_runtime/filetypes.vim
source ~/.vim/vim_runtime/plugins_config.vim
source ~/.vim/vim_runtime/extended.vim

" custom configurations and keybinds
try
  source ~/.vim/custom.vim
catch
endtry
