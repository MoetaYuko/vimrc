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

" lightline {{{

let g:lightline = {
      \ 'colorscheme': 'gruvbox8',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['tabs', 'close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
      \ }

set showtabline=2

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" }}}

" togglecursor {{{
if $TERM == 'tmux-256color'
  let g:togglecursor_force = 'xterm'
endif
" }}}

let g:rainbow_active = 1

let g:indentLine_setColors = 0
let g:indentLine_concealcursor = ''
let g:indentLine_fileTypeExclude = ['coc-explorer', 'leaderf']

" vim:fdm=marker
