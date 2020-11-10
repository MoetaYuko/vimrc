call plug#begin()
 Plug 'AndrewRadev/sideways.vim'
 Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
 Plug 'Yggdroot/indentLine'
 Plug 'airblade/vim-gitgutter'
 Plug 'antoinemadec/coc-fzf'
 Plug 'bkad/CamelCaseMotion'
 Plug 'bronson/vim-visual-star-search'
 Plug 'cespare/vim-toml'
 Plug 'easymotion/vim-easymotion'
 Plug 'farmergreg/vim-lastplace'
 Plug 'gilligan/textobj-gitgutter'
 Plug 'godlygeek/tabular'
 Plug 'heavenshell/vim-textlint'
 Plug 'honza/vim-snippets'
 Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }
 Plug 'ianding1/leetcode.vim'
 Plug 'jackguo380/vim-lsp-cxx-highlight'
 Plug 'jiangmiao/auto-pairs'
 Plug 'junegunn/fzf.vim'
 Plug 'junegunn/gv.vim'
 Plug 'junegunn/vim-easy-align'
 Plug 'jupyter-vim/jupyter-vim'
 Plug 'kana/vim-textobj-entire'
 Plug 'kana/vim-textobj-lastpat'
 Plug 'kana/vim-textobj-line'
 Plug 'kana/vim-textobj-user'
 Plug 'lilydjwg/fcitx.vim'
 Plug 'liuchengxu/vim-which-key'
 Plug 'luochen1990/rainbow'
 Plug 'lzap/vim-selinux'
 Plug 'michaeljsmith/vim-indent-object'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'ntpeters/vim-better-whitespace'
 Plug 'pboettch/vim-cmake-syntax'
 Plug 'plasticboy/vim-markdown'
 Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --force-enable-rust --basedir $HOME/.vim/vimspector-config'}
 Plug 'qpkorr/vim-bufkill'
 Plug 'rhysd/vim-grammarous'
 Plug 'roxma/vim-tmux-clipboard'
 Plug 'sainnhe/gruvbox-material'
 Plug 'sgur/vim-textobj-parameter'
 Plug 'skywind3000/asyncrun.vim'
 Plug 'skywind3000/asynctasks.vim'
 Plug 'skywind3000/vim-terminal-help'
 Plug 'svermeulen/vim-cutlass'
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
 Plug 'tpope/vim-unimpaired'
 Plug 'vim-airline/vim-airline'
 Plug 'vim-python/python-syntax'
 Plug 'vimwiki/vimwiki'
 Plug 'whatyouhide/vim-textobj-xmlattr'
 Plug 'will133/vim-dirdiff'
 Plug 'wincent/terminus'
call plug#end()

"###############################################################
" Random
let g:mapleader = "\<Space>"
let g:maplocalleader = '\'

set number
set cursorline
set ignorecase smartcase
set hlsearch

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>wq :x<cr>

let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

"###############################################################
" color scheme
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set background=dark
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
colorscheme gruvbox-material

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
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1

"###############################################################
" FZF
" Rg current word
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>

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
" grammarous
let g:grammarous#languagetool_cmd = 'yalafi-grammarous'
let g:grammarous#show_first_error = 1
command! -nargs=0 -bar GrammarousReopen call grammarous#create_update_info_window_of(b:grammarous_result)

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
let g:airline_theme='gruvbox_material'

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
" leetcode
let g:leetcode_solution_filetype='rust'
let g:leetcode_browser='chrome'

"###############################################################
" rainbow
let g:rainbow_active = 1

"###############################################################
" sideways.vim
nnoremap [, :SidewaysJumpLeft<cr>
nnoremap ], :SidewaysJumpRight<cr>
nnoremap <, :SidewaysLeft<cr>
nnoremap >, :SidewaysRight<cr>

"###############################################################
" vim-gitgutter
let g:gitgutter_max_signs = 10000

"###############################################################
" vim-cutlass
nnoremap x d
xnoremap x d

nnoremap xx dd
nnoremap X D

"###############################################################
" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\  '%': { 'pattern': '%\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\ }

"###############################################################
" auto-pairs
let g:AutoPairsMapCR = 0

"###############################################################
" -----buffer------
" To open a new empty buffer
nmap <leader>B :enew<cr>

"###############################################################
" vimspector
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_base_dir=expand( '$HOME/.vim/vimspector-config' )

"###############################################################
" vimwiki
let g:vimwiki_list = [{'path': '~/OneDrive/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

"###############################################################
" -----------coc.nvim begin----------------
" extensions
let g:coc_global_extensions = [
      \ 'coc-clangd',
      \ 'coc-cmake',
      \ 'coc-dictionary',
      \ 'coc-ecdict',
      \ 'coc-explorer',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-markdownlint',
      \ 'coc-python',
      \ 'coc-rainbow-fart',
      \ 'coc-rls',
      \ 'coc-snippets',
      \ 'coc-texlab',
      \ 'coc-vimlsp',
      \ 'coc-xml',
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

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call CocAction('doHover')<CR>

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
  autocmd CursorHoldI * silent call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap iF <Plug>(coc-funcobj-i)
omap iF <Plug>(coc-funcobj-i)
xmap aF <Plug>(coc-funcobj-a)
omap aF <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <expr><C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<Right>"
inoremap <expr><C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<Left>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocFzfList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocFzfList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocFzfList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocFzfList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocFzfList symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocFzfListResume<CR>

nmap <silent> <C-c> <Plug>(coc-cursors-position)
" use normal command like `<leader>xi(`
nmap <leader>x  <Plug>(coc-cursors-operator)

map <C-n> :CocCommand explorer<CR>

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" -----------coc.nvim end----------------

"###############################################################
" LaTex
autocmd FileType tex nnoremap <silent> <localleader>lv  :CocCommand latex.ForwardSearch<CR>
let g:tex_flavor = "latex"
