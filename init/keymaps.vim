nnoremap <leader>ev :vsplit $MYVIMRC<cr>

"###############################################################
" sideways.vim
"###############################################################
nnoremap [, :SidewaysJumpLeft<cr>
nnoremap ], :SidewaysJumpRight<cr>
nnoremap <, :SidewaysLeft<cr>
nnoremap >, :SidewaysRight<cr>

"###############################################################
" vim-cutlass
"###############################################################
nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D

"###############################################################
" vim-easy-align
"###############################################################
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
