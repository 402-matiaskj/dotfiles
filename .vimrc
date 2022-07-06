set nocompatible

set t_Co=256
syntax on
filetype plugin on
set number
set shiftwidth=4
set tabstop=4
set expandtab
set smartindent
set wrapscan
set ignorecase
set textwidth=80

" autowrap lines at textwidth
" Turn off autocomment on newline but keep comment on wrapped line
autocmd BufNewFile ,BufRead * setlocal formatoptions+=t
autocmd BufNewFile ,BufRead * setlocal formatoptions-=ro

colorscheme torte
" Spelling and language
"set spell
"set spelllang=nb,en_us

" set matching bracket highlight
hi MatchParen cterm=bold ctermbg=none ctermfg=red

let mapleader = " "

filetype plugin on

set nolist
set listchars=nbsp:‰

" Stop annoyting scratch window showing on compleation suggestion
set completeopt-=preview

" vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" A Vim Plugin for Lively Previewing LaTeX PDF Output
Plugin 'morhetz/gruvbox'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'lervag/vimtex'
Plugin 'vimwiki/vimwiki'
Plugin 'sirver/ultisnips'

" Rust plugin
Plugin 'dense-analysis/ale'
Plugin 'cespare/vim-toml'
Plugin 'rust-lang/rust.vim'

" Golang
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on

" Gruvbox
" autocmd VimEnter * colorscheme gruvbox

" Live-Preview-conf
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'zathura'
let g:livepreview_cursorhold_recompile = 0

" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-lualatex',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
    endif
au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme

" VimWiki
let g:vimwiki_list = [{'path': '~/Documents', 'syntax': 'markdown'}]

" ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardsTrigger = '<s-tab>'

" RustFmt
let g:rustfmt_autosave = 1

" ALE conf

highlight ALEError ctermbg=none cterm=underline
highlight ALEWarning ctermbg=none cterm=underline
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = "✗"
let g:ale_sign_warning = ""
" let g:ale_linters = {'rust': ['rustc', 'rls']}
" let g:ale_linters = {'rust': ['cargo', 'rls']}
" Rust specific
let g:ale_linters = {'rust': ['analyzer']}
let g:ale_rust_rls_toolchain = 'stable'

" Rust conf
" autocmd Filetype rust setlocal ts=4 sw=4 expandtab

"{{{ keybinding
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
"}}}

