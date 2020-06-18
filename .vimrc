call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'maxmellon/vim-jsx-pretty'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-airline/vim-airline' " status bar

" ES2015 code snippets (Optional)
" Plug 'honza/vim-snippets'
Plug 'mlaursen/vim-react-snippets'
Plug 'mlaursen/rmd-vim-snippets'

"  --------------
"  Highlighting, syntax
"  --------------
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'alvan/vim-closetag'

Plug 'tomtom/tcomment_vim' " comment

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
noremap <C-1> gt
noremap <C-2> 2gt
noremap <C-3> 3gt
noremap <C-4> 4gt
noremap <C-5> 5gt
noremap <C-6> 6gt
noremap <C-7> 7gt
noremap <C-8> 8gt
noremap <C-9> 9gt
" complete brackets:
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
map <C-t> :tabnew <CR>
map <C-p> :Files<CR>
map <C-b> :NERDTreeToggle<CR>
inoremap <silent><expr> <c-space> coc#refresh()

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"

" " Automatically save the session when leaving Vim
" autocmd! VimLeave * mksession
" " Automatically load the session when entering vim
" autocmd! VimEnter * source ~/Session.vim


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
set expandtab ts=4 sw=4 ai
set relativenumber
set mouse=a
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

" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()
