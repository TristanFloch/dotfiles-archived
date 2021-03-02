" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" gcc pour commenter une ligne
Plug 'tpope/vim-commentary'

" auto pairing
Plug 'jiangmiao/auto-pairs'

" File searching
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" custom bottom status bar
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Clang format on save
Plug 'rhysd/vim-clang-format'

" Machine learning powered completion
Plug 'codota/tabnine-vim'

" Initialize plugin system
call plug#end()

filetype on          " Détection du type de fichier 
syntax on            " Coloration syntaxique
set background=dark  " Adapte les couleurs pour un fond noir
set visualbell       " Utilisation du clignotement à la place du 'beep'
set showmatch        " Show matching brackets
set mouse=a          " Active la souris, dans tous les modes
set ttymouse=sgr         " mouse in Alacritty
set nu rnu              " Relative number
set wmnu             " Completion dans la barre de commandes
" set colorcolumn=80   " Colonne des 80 char
set listchars=tab:\ \ ,eol:$    " Keep EOF and delete ^I
set splitbelow splitright       " Make split more intuitive
set novisualbell     " Desactive le flash de l'ecran (ex sur echap + echap)
set scrolloff=22     " Arret du scroll n lignes avant le debut/fin du fichier
set list             " End of line $ char
set showmode         " Show mode
" set cursorline       " Highlight the current line
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

" Makes saving case insensitive
command WQ wq
command Wq wq
command W w
command Q q

" Abreviation in C
ab #i #include
ab #d #define
ab #a assert_eq!(

" File search on space space
map <Space><Space> <Esc><Esc>:GFiles<CR>

" clang-format on save
autocmd Filetype c ClangFormatAutoEnable
autocmd Filetype cpp ClangFormatAutoEnable

" GDB in vim
let g:termdebug_popup = 0
let g:termdebug_wide = 163
