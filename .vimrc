call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-airline/vim-airline'
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'

"  --------------
"  Highlighting, syntax
"  --------------
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'alvan/vim-closetag'

" Initialize plugin system
call plug#end()
" Disable virtualenv in Pymode
let g:pymode_virtualenv = 0
" Disable pymode init and lint because of #897
let g:pymode_init = 0
let g:pymode_lint = 0

"  --------------
"  Autoformat
"  --------------
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

autocmd VimEnter * NERDTree

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
noremap <D-1> gt
noremap <D-2> 2gt
noremap <D-3> 3gt
noremap <D-4> 4gt
noremap <D-5> 5gt
noremap <D-6> 6gt
noremap <D-7> 7gt
noremap <D-8> 8gt
noremap <D-9> 9gt

map <C-p> :Files<CR>
map <C-b> :NERDTreeToggle<CR>
inoremap <silent><expr> <c-space> coc#refresh()
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"


command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
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

set relativenumber
set ts=4 sw=4

" Visual
colorscheme molokai
if has("gui_running")
  syntax on
  set guifont=Menlo\ Regular:h14
  set hlsearch
  set bs=2
  set ai
  set ruler
endif
