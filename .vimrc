call plug#begin('~/.vim/plugged')

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" gcc pour commenter une ligne
Plug 'tpope/vim-commentary'

" nerdtree
Plug 'preservim/nerdtree'

" marquage des indentations
Plug 'Yggdroot/indentLine'

" many options for changing surrounding
Plug 'tpope/vim-surround'

" auto pairing
Plug 'jiangmiao/auto-pairs'

" File searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Chewie's colorscheme
Plug 'nanotech/jellybeans.vim'

" Other colorschemes
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" custom bottom status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Transparency for every theme
"Plug 'kjwon15/vim-transparent'

" Git integration
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Colors to hex codes
Plug 'ap/vim-css-color'

call plug#end()


filetype on          " Détection du type de fichier 
syntax on            " Coloration syntaxique
set background=dark  " Adapte les couleurs pour un fond noir
set visualbell       " Utilisation du clignotement à la place du 'beep'
set showmatch        " Show matching brackets
set mouse=a          " Active la souris, dans tous les modes (note il faudra alors d'appuyer sur 'shift' pour faire les sélections de copier-coller dans l'éditeur)
set ttymouse=sgr         " mouse in Alacritty
set nu rnu              " Relative number
set wmnu             " Completion dans la barre de commandes
set colorcolumn=80   " Colonne des 80 char
set listchars=tab:\ \ ,eol:$    " Keep EOF and delete ^I
set splitbelow splitright       " Make split more intuitive
set novisualbell     " Desactive le flash de l'ecran (ex sur echap + echap)
set scrolloff=22     " Arret du scroll n lignes avant le debut/fin du fichier
set list             " End of line $ char
set showmode         " Show mode
set cursorline       " Highlight the current line
set wildmenu         " Enhance command line completion


" Wrapping
set nowrap           " Ne va pas a la ligne pour les longues lignes
set linebreak        " Coupe les lignes au dernier mot et pas au caractère (requier Wrap lines, actif par défaut)

" Tabs
set expandtab        " Remplace les 'Tabulation' par des espaces
set autoindent       " Auto-indentation des nouvelles lignes
set smartindent      " Active 'smart-indent' (améliore l'auto-indentation, notamment en collant du texte déjà indenté)
set smarttab         " Active 'smart-tabs' (améliore l'auto-indentation, Gestion des espaces en début de ligne pour l'auto-indentation)
set shiftwidth=4     " (auto) Indentation de 4 espaces
filetype indent on   " Load indent file for specific file type

" Search
"set hlsearch        " Surligne tous les résultats de la recherche
set incsearch        " Recherche en live
set ignorecase       " Ignore case when searching
set smartcase        " Don't ignore case if an uppercase char is present

" Tags
set tags=tags,./tags;/home/tristan/tags     " Searches tag file in current folder up to the $HOME (it should)

" Makes saving case insensitive
command WQ wq
command Wq wq
command W w
command Q q

" Abreviation in C
ab #i #include
ab #d #define
ab #a assert_eq!(

if !exists("autocommands_loaded")
  let autocommands_loaded = 1
  au Filetype javascript,html,css setlocal shiftwidth=2 softtabstop=2 expandtab
  " au Filetype javascript,html,css colorscheme onehalfdark
endif

" File search on space space
map <Space><Space> <Esc><Esc>:Files<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
" Theming
""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable colorscheme custom bg color and changing default color
" TabLine = inactive tab
let g:jellybeans_overrides = {
\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
\    'ColorColumn': { 'guibg': '1c1c1c' },
\    'VertSplit': { 'guifg': 'ffffff', 'guibg': 'none' },
\}
if has('termguicolors') && &termguicolors
    let g:jellybeans_overrides['background']['guibg'] = 'none'
endif

let g:material_theme_style = 'darker-community'
" Colorscheme
colorscheme jellybeans


"""""""""""""""""""""""""""""""""""""""""""""""""i
" Airline bar
""""""""""""""""""""""""""""""""""""""""""""""""""

" no extension with airline for better perfomance
" let g:airline_extensions = [ 'branch', 'tabline' ]
" custom tabs onglets
let g:airline#extensions#tabline#enabled = 1
" No path on tabs
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Fix powerline icons in the airline bar
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = ''
let g:airline_symbols.maxlinenr = ' '
let g:airline_symbols.readonly = ''




"""""""""""""""""""""""""""""""""""""""""""""""""""
" Persistence options
""""""""""""""""""""""""""""""""""""""""""""""""""

" Set location of the viminfo file
set viminfo='20,\"50,<100,n~/.vimtmp/viminfo

" See :h last-position-jump
augroup last_position_jump
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Persistent undo
if version >= 703
    set undofile
    set undodir=~/.vimtmp/undo
    silent !mkdir -p ~/.vimtmp/undo
endif



" Insert Line in normal mode
nnoremap <silent> <C-h> :<C-u>call append(line("."),   repeat([""], v:count1))<CR>j
nnoremap <silent> <C-H> :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>k

" Set up vertical vs block cursor for insert/normal mode
if &term =~ "screen."
    let &t_ti.="\eP\e[1 q\e\\"
    let &t_SI.="\eP\e[5 q\e\\"
    let &t_EI.="\eP\e[1 q\e\\"
    let &t_te.="\eP\e[0 q\e\\"
else
    let &t_ti.="\<Esc>[1 q"
    let &t_SI.="\<Esc>[5 q"
    let &t_EI.="\<Esc>[1 q"
    let &t_te.="\<Esc>[0 q"
endif

" Toggle NerdTree
map <C-n> :NERDTreeToggle<CR>

" Close NerdTree on when closing the last file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" GDB in vim
let g:termdebug_popup = 0
let g:termdebug_wide = 163

" auto clang-format -i on save
" autocmd BufWritePost *.c ! clang-format -i %
" autocmd BufWritePost *.h ! clang-format -i %

" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ ]

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Coc snippets 
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

"#############################################################
"coc.nvim readme setup
"#############################################################

" TextEdit might fail if hidden is not set
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
"   " Recently vim can merge signcolumn and number column into one
"   set signcolumn=number
" else
set signcolumn=yes
" endif

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
inoremap <silent><expr> <c-@> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocActionAsync('doHover')
"   endif
" endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
