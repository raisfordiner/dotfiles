set guicursor=i:ver25-iCursor
" Set expandtab
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4

" Set lines nummbering: Relative with current line number
set nu
set rnu

" Set ui theme
set termguicolors
colorscheme catppuccin_mocha

" Disable parentheses matching depends on system. This way we should address all cases (?)
set noshowmatch
" NoMatchParen " This doesnt work as it belongs to a plugin, which is only loaded _after_ all files are.
" Trying disable MatchParen after loading all plugins
"
function! g:FckThatMatchParen ()
    if exists(":NoMatchParen")
        :NoMatchParen
    endif
endfunction

augroup plugin_initialize
    autocmd!
    autocmd VimEnter * call FckThatMatchParen()
augroup END
