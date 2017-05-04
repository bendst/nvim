set tabstop=4 softtabstop=0 shiftwidth=4
autocmd FileType rust :setlocal expandtab
autocmd FileType python :setlocal expandtab
autocmd FileType c :setlocal expandtab

set wrap
set nu
set rnu
"set laststatus=2
set hlsearch!
set hidden
set mouse=a

nnoremap <F3> :set hlsearch! <CR>
inoremap ( ()<Esc>i
nnoremap , $
inoremap [ []<Esc>i
inoremap { {}
autocmd BufNewFile,BufRead *.cpp,*.rs,*.c,*.h,*.hpp,*.py,*.elm,*.hs inoremap " ""<Esc>i

"Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

"set omnifunc=syntaxcomplete#Complete

"colorscheme github

im jj (
map <C-s> <Esc>:w<Enter>
im <C-s> <Esc>:w<Enter>
im kk {<Esc>i<Enter><Esc>O
map fj <Esc>f(
map fk <Esc>f{o

nm ff /

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'rust-lang/rust.vim', {'for': 'rust'}
Plug 'racer-rust/vim-racer', {'for': 'rust'}
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neopairs.vim'
Plug 'cespare/vim-toml', {'for': 'toml'}
Plug 'ompugao/uncrustify-vim', {'for': ['c', 'cpp', 'h']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'xavierchow/vim-sequence-diagram'
Plug 'Conque-GDB', {'for': ['c', 'cpp', 'rust']}
Plug 'Valloric/YouCompleteMe', {'for':['c', 'cpp', 'h', 'hpp', 'python'], 'do': 'cd $HOME/.config/nvim/plugged/YouCompleteMe; ./install.py --clang-completer'}
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'rhysd/open-pdf.vim'
Plug 'antoyo/vim-licenses'
Plug 'Shougo/echodoc.vim'
call plug#end()

let g:LanguageClient_serverCommands = { 'rust': ['rustup', 'run', 'nightly', 'rls'], }

let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F3> :call LanguageClient_textDocument_rename()<CR>

inoremap <expr><tab> pumvisible()? "\<C-n>" : "\<Tab>"
let g:airline_theme = 'light'

let g:racer_experimental_completer = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 15
let g:uncrustify_cfg_file_path = "~/uncrustify/defaults.cfg"
let g:rustfmt_autosave = 0

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

nmap <unique> _t <Plug>GenerateDiagram
let g:generate_diagram_theme_hand = 0

smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

nm <silent><F7> :Gstatus <CR>
nm <silent><F8> :Gcommit <CR>
nm <silent><F12> :terminal <CR>

"let g:licenses_copyright_holders_name = 'Ben Stuart <mail@bstuart.de>'
"let g:licenses_authors_name = 'Ben Stuart'
let g:licenses_copyright_holders_name = 'Ben Stuart <mail@bstuart.de>'
let g:licenses_authors_name = 'Ben Stuart<mail@bstuart.de>'

let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1

set noshowmode 

