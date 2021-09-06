" Plugins begin
"
 "automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

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
" Coc: LSP and extension manager
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" marketplace needs to be installed with ':CocInstall coc-marketplace' instead
" Plug 'fannheyward/coc-marketplace'
call plug#end()

" CoC SPECFICIC STUFF
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

"CoC end

" fzf fuzzy search
map ; :Files<CR>

"Window Splitting
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

"switch between tabs
nnoremap <C-n> :tabnew<CR>
nnoremap <silent> <C-Right> :tabnext<CR>
nnoremap <silent> <C-Left> :tabprevious<CR>

"nerdtree keybindings:
nnoremap <C-t> :NERDTreeToggle <CR>
nnoremap <C-f> :NERDTreeFind <CR>
"END OF PLUGIN RELATED SETTINGS

"example defaults for new projects
set expandtab
set tabstop=2
"set shiftwidth=2
set foldmethod=syntax
set fdm=marker
