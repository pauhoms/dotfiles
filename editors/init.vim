syntax on

set guicursor=
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set cmdheight=2
set updatetime=50
set shortmess+=c
set omnifunc=syntaxcomplete#Complete
set shiftwidth=4
set nofixendofline
let NERDTreeShowHidden=1


call plug#begin('~/.vim/plugged')

" Themes
Plug 'gruvbox-community/gruvbox'

"IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do' : { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-rooter'

" PHP
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'yaegassy/coc-intelephense', {'do': 'npm install --frozen-lockfile'}

" JS
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }

" TS
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-tslint'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc-css'
Plug 'neoclide/coc-eslint'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'

call plug#end()

" Theme
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_invert_tabline=1
let g:gruvbox_transparent_bg=1

highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

" Tree
nnoremap <silent><A-1> :NERDTreeToggle<CR> 
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if &filetype == "typescript" || &filetype == "typescriptreact"
        \|   set shiftwidth=2
        \| endif
augroup END

" Search
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']
noremap <silent>fs :Files<cr> 
noremap <silent>fd :History<cr> 
noremap <silent>fa :Ag<cr> 

" Git
nnoremap <silent>ga :G<CR> 
nnoremap <silent>gc :Gcommit<CR> 
nnoremap <silent>gp :Git push origin HEAD<CR>
nnoremap <silent>gu :Gpull<CR>

" Lightline
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" GoTo navigation
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>rr <Plug>(coc-rename)
nmap <silent>gr <Plug>(coc-references)

" Identation
let g:indentLine_char_list = ['┊']
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '·'


" Windows
nnoremap <silent>mn :vertical resize +20<CR>
nnoremap <silent>mb :vertical resize -20<CR>


" TypeScript
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

let g:coc_global_extensions = [ 'coc-tsserver' ]
if &filetype == "typescript" || &filetype == "typescriptreact" || &filetype == "javascript" || &filetype == "javascriptreact"
    set shiftwidth=2
endif


" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
