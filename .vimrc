set rtp+=/usr/local/go/misc/vim
filetype plugin indent on

"" Colorscheme
let &t_Co=256
colorscheme Tomorrow-Night
syntax on

let mapleader = "\<Space>"

"" Pathogen
execute pathogen#infect()

"" NERDTree
autocmd vimenter * NERDTree
map <C-m> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"" nerdcommenter
filetype plugin on

"" ==========  Leader commands  ==========

"" escape keys
imap jk <Esc>
imap kj <Esc>

map <Leader>w :w<CR>
map <Leader>q :q<CR>
map <Leader>z :sp<CR>

"" system yank, paste, delete
map <Leader>y "+y
map <Leader>p "+p
map <Leader>d "+d

"" leader-i to properly indent lines depending on filetype
map <Leader>i mzgg=G`z

"" debugging
map <Leader>ll oconsole.log('');<ESC>hhi
map <Leader>dg odebugger;<ESC>
nmap <Leader>x orequire "pry"<CR>binding.pry<ESC>;
nmap <Leader>b orequire "byebug"<CR>byebug<ESC>;

"" misc
noremap <Leader>o :CtrlP<CR>
map <Leader>db :e db/schema.rb<cr>
map <Leader>rn :set relativenumber<cr>
map <Leader>nn :set number<cr>
map <Leader>nu :set nu!<cr>
map <Leader>sp :set paste<cr>
map <Leader>np :set nopaste<cr>

"" tmux commands
map <Leader>rs :w %<cr>:call VimuxRunCommand("clear; bundle exec rspec")<CR>
map <Leader>rj :w %<cr>:call VimuxRunCommand("clear; jasmine-node --verbose " . bufname("%"))<cr>

"" ==========  These come from Mislav (http://mislav.uniqpath.com/2011/12/vim-revisited/)  ==========
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching

"" ==========  From Josh Cheek (I think)  ==========
set nobackup                                        " no backup files
set nowritebackup                                   " only in case you don't want a backup file while editing
set noswapfile                                      " no swap files
set scrolloff=4                                     " adds top/bottom buffer between cursor and window
set cursorline                                      " colours the line the cursor is on
set relativenumber                                  " line numbers
vnoremap . :norm.<CR>                               " in visual mode, "." will for each line, go into normal mode and execute the "."

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Emacs/Readline keybindings for commandline mode
cnoremap <C-A> <Home>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>

"" strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" replaces %/ with current directory, and %% with current file
cmap %/ <C-R>=expand("%:p:h")."/"<CR>
cmap %% <C-R>=expand("%")<CR>

" ========== Pathogen plugins ==========
"
" ZoomWin                     https://github.com/vim-scripts/ZoomWin.git
" nerdtree                    https://github.com/scrooloose/nerdtree.git
" supertab                    https://github.com/ervandew/supertab.git
" unite.vim                   https://github.com/Shougo/unite.vim.git
" vim-coffee-script           https://github.com/kchmck/vim-coffee-script.git
" vim-commentary              https://github.com/tpope/vim-commentary.git
" vim-cucumber                https://github.com/tpope/vim-cucumber.git
" vim-elixir                  https://github.com/elixir-lang/vim-elixir.git
" vim-endwise                 https://github.com/tpope/vim-endwise.git
" vim-fish                    https://github.com/dag/vim-fish.git
" vim-fugitive                https://github.com/tpope/vim-fugitive.git
" vim-haml                    https://github.com/tpope/vim-haml.git
" hdevtools                   https://github.com/bitc/hdevtools.git
" vim-javascript              https://github.com/pangloss/vim-javascript.git
" vim-markdown                https://github.com/tpope/vim-markdown.git
" vim-powerline               https://github.com/Lokaltog/vim-powerline.git
" vim-repeat                  https://github.com/tpope/vim-repeat.git
" vim-rspec                   https://github.com/skwp/vim-rspec.git
" vim-ruby                    https://github.com/vim-ruby/vim-ruby.git
" vim-surround                https://github.com/tpope/vim-surround.git
" vim-textobj-rubyblock       https://github.com/nelstrom/vim-textobj-rubyblock.git
" vim-textobj-user            https://github.com/kana/vim-textobj-user.git
