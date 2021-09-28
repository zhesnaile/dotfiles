" PLUGIN CONFIG {{{
" Check For Plug {{{
" automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif
" }}}

"PLUGINS {{{
call plug#begin('~/.config/nvim/plugged')
" VimSleuth: Detect and follow a file's already existing indentation.
Plug 'tpope/vim-sleuth'
" EditorConfig: Consistent config across various IDE's (https://editorconfig.org).
Plug 'editorconfig/editorconfig-vim'
" Fzf: fuzzy search 
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Auto Pairs: Insert or delete brackets, parens, quotes in pair.
Plug 'jiangmiao/auto-pairs'
" VimSandwich: edit the surroundings of a sandwiched textobject. 
Plug 'machakann/vim-sandwich'
" Nerdcommenter: Commenting tools/shortcuts.
Plug 'preservim/nerdcommenter'
" NerdTree: Tree view file viewer.
Plug 'preservim/nerdtree'
" Devicons: icons
Plug 'ryanoasis/vim-devicons'
" Airline: pretty
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Coc: LSP and extension manager
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" marketplace needs to be installed with ':CocInstall coc-marketplace' instead
" Plug 'fannheyward/coc-marketplace'
call plug#end()
"}}}

" CoC SPECFICIC STUFF {{{
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>


" }}}

" FZF BINDINGS {{{
map ; :Files<CR>
nmap <silent> <space>w :W<cr>
" }}}
" NERDTREE Bindings{{{
nnoremap <C-t> :NERDTreeToggle <CR>
nnoremap <C-f> :NERDTreeFind <CR>
" }}}

"AIRLINE THEME{{{
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='alduin'
"}}}

"}}} END OF PLUGIN RELATED SETTINGS

" WINDOWS {{{
" Window Splitting
function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

"create a window leftright
nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>

"switch between opened windows
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>p

" }}}

"TAB Bindings {{{
nnoremap <C-n> :tabnew<CR>
nnoremap <silent> H :tabprevious<CR>
nnoremap <silent> L :tabnext<CR>
"}}}

" GENERAL BEHAVIOUR {{{
set noexpandtab
set tabstop=4
set shiftwidth=4
set foldmethod=syntax
set fdm=marker
" }}}
