nnoremap <leader>ev :vsplit $MYVIMRC<cr>

function! ToggleQuickFix()
    if getqflist({'winid' : 0}).winid
        cclose
    else
        copen
    endif
endfunction

command! -nargs=0 -bar ToggleQuickFix call ToggleQuickFix()

nnoremap yoq :ToggleQuickFix<CR>

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

"###############################################################
" vim-sandwich
"###############################################################
nmap s <Nop>
xmap s <Nop>
