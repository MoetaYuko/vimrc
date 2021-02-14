let g:vim_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
command! -nargs=1 LoadScript exec 'so '.globpath(g:vim_home, '<args>')

LoadScript init/plug.vim
LoadScript init/basic.vim
LoadScript init/keymaps.vim
LoadScript init/style.vim
