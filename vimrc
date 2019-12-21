call plug#begin('~/.vim/plugged')
 Plug 'NLKNguyen/papercolor-theme'
 Plug 'SirVer/ultisnips'
 Plug 'Yggdroot/indentLine'
 Plug 'bkad/CamelCaseMotion'
 Plug 'easymotion/vim-easymotion'
 Plug 'honza/vim-snippets'
 Plug 'liuchengxu/vim-which-key'
 Plug 'michaeljsmith/vim-indent-object'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'ntpeters/vim-better-whitespace'
 Plug 'scrooloose/nerdtree'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-eunuch'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-sleuth'
 Plug 'tpope/vim-surround'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-python/python-syntax'
 Plug 'vim-vdebug/vdebug'
call plug#end()

"###############################################################
" Random
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

set number
set cursorline
set ignorecase smartcase
set incsearch hlsearch
set mouse=a

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :x<cr>

"###############################################################
" color scheme
colorscheme PaperColor
set background=dark

"###############################################################
" English dictionary
if filereadable('/usr/share/dict/words')
  set dict+=/usr/share/dict/words
endif

"###############################################################
" syntax
let g:python_highlight_all = 1

"###############################################################
" Switch between different windows by their direction
nnoremap <C-j> <C-w>j| "switching to below window
nnoremap <C-k> <C-w>k| "switching to above window
nnoremap <C-l> <C-w>l| "switching to right window
nnoremap <C-h> <C-w>h| "switching to left window

"###############################################################
" CJK
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

"###############################################################
" Nerdtree
map <C-n> :NERDTreeToggle<CR>

"###############################################################
" vim-which-key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

"###############################################################
" CamelCaseMotion
let g:camelcasemotion_key = '<leader><leader>'

"###############################################################
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"###############################################################
" indentLine
let g:indentLine_concealcursor = ''

"###############################################################
" ultisnips
let g:UltiSnipsExpandTrigger="<c-l>"

"###############################################################
" -----buffer------
" To open a new empty buffer
nmap <leader>B :enew<cr>

" Move to the next buffer
nmap gb :bnext<CR>

" Move to the previous buffer
nmap gB :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"###############################################################
" -----------coc.nvim begin----------------
" extensions
let g:coc_global_extensions = [
      \ 'coc-dictionary',
      \ 'coc-ecdict',
      \ 'coc-json',
      \ 'coc-texlab',
      \ 'coc-python',
      \ 'coc-ultisnips',
      \ 'coc-yaml',
      \ ]

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nmap <silent> <C-c> <Plug>(coc-cursors-position)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)
" -----------coc.nvim end----------------

"###############################################################
" LaTex
nnoremap <silent> <leader>lv  :CocCommand latex.ForwardSearch<CR>
let g:tex_flavor = "latex"
