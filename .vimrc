call plug#begin('~/.vim/plugged')

" Plug 'junegunn/vim-easy-align'
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'fatih/vim-go', { 'tag': '*' }

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-airline/vim-airline'
" Initialize plugin system
call plug#end()
" Disable virtualenv in Pymode
let g:pymode_virtualenv = 0
" Disable pymode init and lint because of #897
let g:pymode_init = 0
let g:pymode_lint = 0
autocmd VimEnter * NERDTree

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

map <C-n> :NERDTreeToggle<CR>
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)


" Visual
if has("gui_running")
  syntax on
  set guifont=Menlo\ Regular:h14
  set hlsearch
  colorscheme evening
  set bs=2
  set ai
  set ruler
endif
