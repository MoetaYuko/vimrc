if has('termguicolors')
  if !has('nvim')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif
set background=dark

let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1
colorscheme gruvbox8

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox8'

let g:rainbow_active = 1

let g:indentLine_setColors = 0
let g:indentLine_concealcursor = ''
let g:indentLine_fileTypeExclude = ['coc-explorer', 'leaderf']
