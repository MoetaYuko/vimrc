call plug#begin()
" lsp / dap {{{
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'puremourning/vimspector', {'do': ':VimspectorInstall --enable-c --enable-python --enable-rust'}
" }}}

" misc {{{
 Plug 'airblade/vim-gitgutter'
 Plug 'anufrievroman/vim-angry-reviewer'
 Plug 'christoomey/vim-system-copy'
 Plug 'honza/vim-snippets'
 Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
 Plug 'junegunn/gv.vim'
 Plug 'junegunn/vim-easy-align'
 Plug 'lervag/vimtex'
 Plug 'lilydjwg/fcitx.vim'
 Plug 'machakann/vim-sandwich'
 Plug 'ojroques/vim-oscyank'
 Plug 'roxma/vim-tmux-clipboard'
 Plug 'skywind3000/asyncrun.vim' | Plug 'skywind3000/asynctasks.vim'
 Plug 'skywind3000/vim-terminal-help'
 Plug 'tommcdo/vim-exchange'
 Plug 'tpope/vim-abolish'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-dispatch'
 Plug 'tpope/vim-eunuch'
 Plug 'tpope/vim-fugitive'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-rhubarb'
 Plug 'tpope/vim-sensible'
 Plug 'tpope/vim-unimpaired'
 Plug 'vimwiki/vimwiki'
 Plug 'will133/vim-dirdiff'
" }}}

" navigation {{{
 " Plug 'andymass/vim-matchup'
 Plug 'bkad/CamelCaseMotion'
 Plug 'bronson/vim-visual-star-search'
 Plug 'easymotion/vim-easymotion'
 Plug 'farmergreg/vim-lastplace'
 Plug 'qpkorr/vim-bufkill'
" }}}

" search {{{
 Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
 Plug 'romainl/vim-cool'
" }}}

" style {{{
 Plug 'Yggdroot/indentLine'
 Plug 'itchyny/lightline.vim'
 Plug 'lifepillar/vim-gruvbox8'
 Plug 'liuchengxu/vim-which-key'
 Plug 'luochen1990/rainbow'
 Plug 'mengelbrecht/lightline-bufferline'
 Plug 'mhinz/vim-startify'
 Plug 'ntpeters/vim-better-whitespace'
 Plug 'ryanoasis/vim-devicons'
 Plug 'tpope/vim-sleuth'
" }}}

" syntax {{{
 Plug 'cespare/vim-toml'
 Plug 'elkowar/yuck.vim'
 Plug 'fladson/vim-kitty'
 Plug 'lzap/vim-selinux'
 Plug 'pboettch/vim-cmake-syntax'
 Plug 'rubberduck203/aosp-vim'
 Plug 'vim-python/python-syntax', { 'for': 'python' }
" }}}

" textobj {{{
 Plug 'AndrewRadev/sideways.vim'
 Plug 'michaeljsmith/vim-indent-object'
 Plug 'wellle/targets.vim'
" }}}
call plug#end()

" python-syntax {{{
let g:python_highlight_all = 1
" }}}

" LeaderF {{{
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

let g:Lf_ShortcutF = "<leader>ff"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--hidden"
    \ ]

" search word under cursor, the pattern is treated as regex, and enter normal mode directly
noremap <leader>rg :<C-U><C-R>=printf("Leaderf! rg -e %s", expand("<cword>"))<CR><CR>

" search visually selected text literally
xnoremap <leader>rg :<C-U><C-R>=printf("Leaderf! rg -F -e %s", leaderf#Rg#visual())<CR><CR>

" recall last search. If the result window is closed, reopen it.
noremap go :<C-U>Leaderf! --recall<CR>

command! -bang -bar -nargs=? Rg Leaderf<bang> rg <q-args><CR>
" }}}

" vim-which-key {{{
nnoremap <silent> <leader>      :<c-u>WhichKey '<leader>'<CR>
nnoremap <silent> <space>      :<c-u>WhichKey '<space>'<CR>
" }}}

" vim-markdown {{{
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
" }}}

" CamelCaseMotion {{{
let g:camelcasemotion_key = '<leader><leader>'
" }}}

" asynctasks.vim {{{
let g:asyncrun_open = 8
let g:asynctasks_term_pos = 'bottom'
noremap <silent><leader>mm :AsyncTaskLast<cr>
noremap <silent><f2> :AsyncTask file-run<cr>

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
" }}}

" fcitx.vim {{{
let g:fcitx5_remote = 'fcitx5-remote'
" }}}

" leetcode {{{
let g:leetcode_solution_filetype='rust'
let g:leetcode_browser='chrome'
" }}}

" vim-easy-align {{{
let g:easy_align_delimiters = {
\  '%': { 'pattern': '%\+', 'delimiter_align': 'l', 'ignore_groups': ['!Comment']  },
\ }
" }}}

" vim-terminal-help {{{
let g:terminal_list = 0
if has('win32')
  let g:terminal_shell = 'powershell'
endif
" }}}

" vim-gitgutter {{{
let g:gitgutter_max_signs = 10000
let g:gitgutter_sign_priority = 9
" }}}

" vimspector {{{
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
let g:vimspector_base_dir=globpath(g:vim_home, 'vimspector-config')
" }}}

" vimtex {{{
if has('clientserver') && empty(v:servername) && exists('*remote_startserver') && (!empty($DISPLAY) || has('win32'))
  call remote_startserver('VIM')
endif

let g:matchup_override_vimtex = 1
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-shell-escape',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
" use texlab completion
let g:vimtex_complete_enabled = 0

let g:vimtex_view_method = 'zathura'

let g:vimtex_quickfix_ignore_filters = [
    \ 'Underfull',
    \ 'Overfull',
    \ 'math shift',
    \ ]

set spelllang=en_us
let g:vimtex_grammar_vlty = {}
let g:vimtex_grammar_vlty.lt_command = 'languagetool'
let g:vimtex_grammar_vlty.server = 'my'
let g:vimtex_grammar_vlty.shell_options =
        \   ' --packages "*"'
        \ . ' --equation-punctuation display'
let g:vimtex_grammar_vlty.show_suggestions = 1

" Close viewers when vimtex buffers are closed
function! CloseViewers()
  " Close viewers on quit
  if executable('xdotool') && exists('b:vimtex')
      \ && exists('b:vimtex.viewer') && b:vimtex.viewer.xwin_id > 0
    call system('xdotool windowclose '. b:vimtex.viewer.xwin_id)
  endif
endfunction

augroup vimtex_event_2
  au!
  au User VimtexEventInitPost command! -buffer -nargs=0 VimtexGrammarCheck :Dispatch -compiler=vlty
  au User VimtexEventQuit call CloseViewers()
augroup END
" }}}

" vimwiki {{{
let g:vimwiki_list = [{'path': '~/OneDrive/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_table_mappings = 0
" }}}

" vim-startify {{{
let g:startify_change_to_dir = 0
" }}}

LoadScript init/coc-nvim.vim

" vim:fdm=marker
