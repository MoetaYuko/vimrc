set number
set cursorline
set ignorecase smartcase
set hlsearch

if has('multi_byte')
  " 内部工作编码
  set encoding=utf-8

  " 文件默认编码
  set fileencoding=utf-8

  " 打开文件时自动尝试下面顺序的编码
  set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

if filereadable('/usr/share/dict/words')
  set dict+=/usr/share/dict/words
endif

if has("patch-8.1.0360")
  set diffopt+=algorithm:patience
endif

" exclude quickfix from bnext {{{
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END
" }}}

" tmux integration {{{

if !has('nvim') && !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  " Better mouse support, see  :help 'ttymouse'
  set ttymouse=sgr

  " Enable true colors, see  :help xterm-true-color
  " let &termguicolors = v:true
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

  " Enable bracketed paste mode, see  :help xterm-bracketed-paste
  let &t_BE = "\<Esc>[?2004h"
  let &t_BD = "\<Esc>[?2004l"
  let &t_PS = "\<Esc>[200~"
  let &t_PE = "\<Esc>[201~"

  " Enable focus event tracking, see  :help xterm-focus-event
  let &t_fe = "\<Esc>[?1004h"
  let &t_fd = "\<Esc>[?1004l"
  execute "set <FocusGained>=\<Esc>[I"
  execute "set <FocusLost>=\<Esc>[O"

  " Enable modified arrow keys, see  :help arrow_modifiers
  execute "silent! set <xUp>=\<Esc>[@;*A"
  execute "silent! set <xDown>=\<Esc>[@;*B"
  execute "silent! set <xRight>=\<Esc>[@;*C"
  execute "silent! set <xLeft>=\<Esc>[@;*D"
endif

" }}}

" vim:fdm=marker
