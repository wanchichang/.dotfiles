
" stored at ~/.config/nvim
" Make mouse available under any circumstances.
set mouse=a

" set relative numbers at the left in your vim editor but actual number on current line.
set relativenumber
set number 

" Map Ctrl+c to a yank shortcut, it could yank it to the clipboard BTW. 
noremap <C-c> "+y<CR>

" Map ctrl-p to search files. (by vim-plug fzf)
nnoremap <C-p> :Files<Cr>

" Map ctrl-o to toggle NERDTree. (close when open and open when closed)
nnoremap <C-o> :NERDTreeToggle<Cr>

" Press <esc> to close terminal in vim, and manually `:bd!` to close this buffer.
tnoremap <ESC> <C-\><C-n><CR>

" Press jj to leave insert mode 
inoremap jj <esc> 

" Start the Vim-Plug section
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" :CocInstall coc-pairs coc-clangd

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-commentary'

Plug 'pseewald/anyfold'

Plug 'scrooloose/nerdtree'

Plug 'projekt0n/github-nvim-theme'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" coc
" Disable the '<' autopairs
let b:coc_pairs_disabled = ['<']
" Press enter to add a new line between two parentheses
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" colorscheme
colorscheme github_dimmed

" fzf source file
source /opt/homebrew/opt/fzf/plugin/fzf.vim

" AnyFold plugin -> zo to open fold, zc to close fold.
autocmd Filetype * AnyFoldActivate
let g:anyfold_fold_comments=1
set foldlevel=99
