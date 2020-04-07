call plug#begin()
 Plug 'NLKNguyen/papercolor-theme'
 Plug 'SirVer/ultisnips'
 Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
 Plug 'Yggdroot/indentLine'
 Plug 'airblade/vim-gitgutter'
 Plug 'bkad/CamelCaseMotion'
 Plug 'cespare/vim-toml'
 Plug 'easymotion/vim-easymotion'
 Plug 'farmergreg/vim-lastplace'
 Plug 'gilligan/textobj-gitgutter'
 Plug 'honza/vim-snippets'
 Plug 'junegunn/fzf.vim'
 Plug 'kana/vim-textobj-entire'
 Plug 'kana/vim-textobj-lastpat'
 Plug 'kana/vim-textobj-line'
 Plug 'kana/vim-textobj-user'
 Plug 'liuchengxu/vim-which-key'
 Plug 'luochen1990/rainbow'
 Plug 'lzap/vim-selinux'
 Plug 'michaeljsmith/vim-indent-object'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'ntpeters/vim-better-whitespace'
 Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python'}
 Plug 'qpkorr/vim-bufkill'
 Plug 'rhysd/vim-grammarous'
 Plug 'roxma/vim-tmux-clipboard'
 Plug 'sgur/vim-textobj-parameter'
 Plug 'skywind3000/asyncrun.vim'
 Plug 'skywind3000/asynctasks.vim'
 Plug 'skywind3000/vim-terminal-help'
 Plug 'thinca/vim-textobj-between'
 Plug 'tmux-plugins/vim-tmux-focus-events'
 Plug 'tpope/vim-abolish'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-eunuch'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-sensible'
 Plug 'tpope/vim-sleuth'
 Plug 'tpope/vim-surround'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'vim-python/python-syntax'
 Plug 'whatyouhide/vim-textobj-xmlattr'
 Plug 'wincent/terminus'
call plug#end()

"###############################################################
" Random
let g:mapleader = "\<Space>"
let g:maplocalleader = ','

set number
set cursorline
set ignorecase smartcase
set hlsearch

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>wq :x<cr>

"###############################################################
" color scheme
let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default': {
  \       'transparent_background': 1
  \     }
  \   }
  \ }

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
" CJK
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

"###############################################################
" FZF
" Make :Ag not match file names
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Ag current word
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
nnoremap <silent> <Leader>gg :GGrep <C-R><C-W><CR>

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

"###############################################################
" LeaderF
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

"###############################################################
" vim-which-key
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

"###############################################################
" CamelCaseMotion
let g:camelcasemotion_key = '\'

"###############################################################
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"###############################################################
" asynctasks.vim
let g:asyncrun_open = 8
let g:asynctasks_term_pos = 'bottom'

" LeaderF integration
function! s:lf_task_source(...)
	let rows = asynctasks#source(&columns * 48 / 100)
	let source = []
	for row in rows
		let name = row[0]
		let source += [name . '  ' . row[1] . '  : ' . row[2]]
	endfor
	return source
endfunction


function! s:lf_task_accept(line, arg)
	let pos = stridx(a:line, '<')
	if pos < 0
		return
	endif
	let name = strpart(a:line, 0, pos)
	let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
	if name != ''
		exec "AsyncTask " . name
	endif
endfunction

function! s:lf_task_digest(line, mode)
	let pos = stridx(a:line, '<')
	if pos < 0
		return [a:line, 0]
	endif
	let name = strpart(a:line, 0, pos)
	return [name, 0]
endfunction

function! s:lf_win_init(...)
	setlocal nonumber
	setlocal nowrap
endfunction


let g:Lf_Extensions = get(g:, 'Lf_Extensions', {})
let g:Lf_Extensions.task = {
			\ 'source': string(function('s:lf_task_source'))[10:-3],
			\ 'accept': string(function('s:lf_task_accept'))[10:-3],
			\ 'get_digest': string(function('s:lf_task_digest'))[10:-3],
			\ 'highlights_def': {
			\     'Lf_hl_funcScope': '^\S\+',
			\     'Lf_hl_funcDirname': '^\S\+\s*\zs<.*>\ze\s*:',
			\ },
		\ }

noremap <leader>ft :<C-U><C-R>=printf("Leaderf --nowrap task %s", "")<CR><CR>

"###############################################################
" indentLine
let g:indentLine_concealcursor = ''

"###############################################################
" rainbow
let g:rainbow_active = 1

"###############################################################
" ultisnips
let g:UltiSnipsExpandTrigger="<c-l>"

"###############################################################
" vim-gitgutter
let g:gitgutter_max_signs = 10000

"###############################################################
" -----buffer------
" To open a new empty buffer
nmap <leader>B :enew<cr>

" Move to the next buffer
nmap gb :bnext<CR>

" Move to the previous buffer
nmap gB :bprevious<CR>

" Move backwards through recently accessed buffers
nmap <leader>bb :BB<CR>

" Move forwards through recently accessed buffers
nmap <leader>bf :BF<CR>

" Close the current buffer
nmap <leader>bd :BD<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

"###############################################################
" vimspector
let g:vimspector_enable_mappings = 'HUMAN'

"###############################################################
" -----------coc.nvim begin----------------
" extensions
let g:coc_global_extensions = [
      \ 'coc-dictionary',
      \ 'coc-ecdict',
      \ 'coc-explorer',
      \ 'coc-json',
      \ 'coc-pairs',
      \ 'coc-python',
      \ 'coc-rls',
      \ 'coc-texlab',
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <silent><expr> <cr> complete_info()["selected"] != "-1" ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
else
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                          \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
endif

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
xmap <leader>=  <Plug>(coc-format-selected)
nmap <leader>=  <Plug>(coc-format-selected)

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

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap iF <Plug>(coc-funcobj-i)
xmap aF <Plug>(coc-funcobj-a)
omap iF <Plug>(coc-funcobj-i)
omap aF <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
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

map <C-n> :CocCommand explorer<CR>
" -----------coc.nvim end----------------

"###############################################################
" LaTex
autocmd FileType tex nnoremap <silent> <leader>lv  :CocCommand latex.ForwardSearch<CR>
let g:tex_flavor = "latex"
