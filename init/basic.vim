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

" exclude quickfix from bnext
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END
