if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'thaerkh/vim-workspace'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ap/vim-buftabline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-airline/vim-airline' " status bar

" Code snippets (Optional)
" Plug 'honza/vim-snippets'
" Plug 'SirVer/ultisnips'
" Plug 'epilande/vim-es2015-snippets'
" Plug 'epilande/vim-react-snippets'

"  --------------
"  Highlighting, syntax
"  --------------
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'alvan/vim-closetag'
" Plug 'jiangmiao/auto-pairs'
" Plug 'sheerun/vim-polyglot'
" Plug 'tomtom/tcomment_vim' " comment
"

" typescript syntax
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
" Plug 'pangloss/vim-javascript'

" react syntax (jsx/tsx)
Plug 'maxmellon/vim-jsx-pretty'

" git status column near line
Plug 'airblade/vim-gitgutter'

" Themes
"
"
Plug 'jacoborus/tender.vim'
" Plug 'nightsense/carbonized'
" Plug 'crusoexia/vim-monokai'

"


" Initialize plugin system
call plug#end()

" Themes settings
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let macvim_skip_colorscheme=1
let g:rehash256 = 1
colorscheme tender
set guifont=Menlo\ Regular:h16
set hlsearch
set bs=2
set ai
set ruler

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

" Buffer as tabs
set hidden
" nnoremap <leader> n :bnext<CR>
" nnoremap <leader> p :bprev<CR>

"" autocmd VimEnter * NERDTree
" COC
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" COC END


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
" inoremap " ""<left>
" inoremap ' ''<left>
" inoremap ( ()<left>
" inoremap [ []<left>
" inoremap { {}<left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O
map <C-t> :tabnew <CR>
map <C-p> :GFiles<CR>
map <C-S-e> :NERDTreeToggle<CR>
inoremap <silent><expr> <c-space> coc#refresh()
set backspace=indent,eol,start
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.erb,*.jsx,*.tsx"


" " Automatically save the session when leaving Vim
" autocmd! VimLeave * mksession
" " Automatically load the session when entering vim
" autocmd! VimEnter * source ~/Session.vim

" for command mode
nnoremap <S-Tab> <<
" for insert mode
inoremap <S-Tab> <C-d>


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
" "autocmd BufEnter * call SyncTree()
" "autocmd BufWinEnter * NERDTreeMirrorOpen
