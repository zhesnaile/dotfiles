" PLUGIN CONFIG {{{
lua require('plugins')
lua require('lsp_settings')
  " FZF BINDINGS {{{
  map <silent> ; :Files<CR>
  nmap <silent> <space>w :W<cr>
  
  " Bind GFiles to ¡ if possible, fall back to Files
  silent! !git rev-parse --is-inside-work-tree
  if v:shell_error == 0
    nnoremap <silent>¡ :GFiles --cached --others --exclude-standard<CR>
  else
    nnoremap <silent>¡ :Files<CR>
  endif
  
  " Get a list of open buffers with FZF
  nnoremap <silent> <space><space> :Buffers<CR>
  
  " }}}
  
  "AIRLINE THEME{{{
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_theme='alduin'
  "}}}
  
"}}} END OF PLUGIN RELATED SETTINGS

" 'VANILLA-NVIM' BINDINGS {{{
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

  "TABS and their Bindings {{{
  nnoremap <silent> <space>t :tabnew<CR>
  nnoremap <silent> H :tabprevious<CR>
  nnoremap <silent> L :tabnext<CR>
  "}}}

  " Remap ç to act like semicolon (no shift in spanish layout :D)
  nnoremap ç :
  
  " Remap ´ to save
  nnoremap ´ :w <CR>
  
  " Center the cursor vertically when moving to the next word during a search.
  nnoremap n nzz
  nnoremap N Nzz
  
  "double tap ñ to exit insert mode
  inoremap ññ <ESC>
"}}}

" THEME SETTINGS{{{
set         termguicolors
syntax      enable
colorscheme dracula
set         colorcolumn=81
"}}}

" GENERAL BEHAVIOUR {{{
set noexpandtab
set tabstop=4
set shiftwidth=4
set foldmethod=syntax
set fdm=marker
set modelines=0

"set clipboard^=unnamed,unnamedplus
