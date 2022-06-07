if has('termguicolors')
  set termguicolors
endif

" gruvbox8 {{{

let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1
colorscheme gruvbox8
set background=dark

" }}}

" lightline {{{

let g:lightline = {
      \ 'colorscheme': 'gruvbox8',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'], ['tabs'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'gitbranch': 'FugitiveHead'
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
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" }}}

" togglecursor {{{

if $TERM == 'tmux-256color'
  let g:togglecursor_force = 'xterm'
endif

" }}}

" rainbow {{{

let g:rainbow_active = 1

" }}}

" indentLine {{{

let g:indentLine_setColors = 0
let g:indentLine_concealcursor = ''
let g:indentLine_fileTypeExclude = ['coc-explorer', 'leaderf']

" }}}

" vim:fdm=marker
