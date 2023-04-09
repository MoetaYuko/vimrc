" term capability {{{
if !has('nvim') && !has('gui_running')
  " Mouse support
  set ttymouse=sgr
  set balloonevalterm
  " Styled and colored underline support
  let &t_AU = "\e[58:5:%dm"
  let &t_8u = "\e[58:2:%lu:%lu:%lum"
  let &t_Us = "\e[4:2m"
  let &t_Cs = "\e[4:3m"
  let &t_ds = "\e[4:4m"
  let &t_Ds = "\e[4:5m"
  let &t_Ce = "\e[4:0m"
  " Strikethrough
  let &t_Ts = "\e[9m"
  let &t_Te = "\e[29m"
  " Truecolor support
  let &t_8f = "\e[38:2:%lu:%lu:%lum"
  let &t_8b = "\e[48:2:%lu:%lu:%lum"
  let &t_RF = "\e]10;?\e\\"
  let &t_RB = "\e]11;?\e\\"
  " Bracketed paste
  let &t_BE = "\e[?2004h"
  let &t_BD = "\e[?2004l"
  let &t_PS = "\e[200~"
  let &t_PE = "\e[201~"
  " Cursor control
  let &t_RC = "\e[?12$p"
  let &t_SH = "\e[%d q"
  let &t_RS = "\eP$q q\e\\"
  let &t_SI = "\e[5 q"
  let &t_SR = "\e[3 q"
  let &t_EI = "\e[1 q"
  let &t_VS = "\e[?12l"
  " Focus tracking
  let &t_fe = "\e[?1004h"
  let &t_fd = "\e[?1004l"
  execute "set <FocusGained>=\<Esc>[I"
  execute "set <FocusLost>=\<Esc>[O"
  " Window title
  let &t_ST = "\e[22;2t"
  let &t_RT = "\e[23;2t"

  " vim hardcodes background color erase even if the terminfo file does
  " not contain bce. This causes incorrect background rendering when
  " using a color theme with a background color in terminals such as
  " kitty that do not support background color erase.
  let &t_ut=''
endif
" }}}

" gruvbox8 {{{

if has('termguicolors')
  set termguicolors
endif

let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1
let g:gruvbox_transp_bg = 1
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
