" Tell Vim as early as possible not to try to emulate vi                                                                   
set nocompatible

let mapleader=" "
set background=dark       "make sure vim knows bg is dark
set showmode              "display current mode
set showcmd               "display partially typed commands
set nowrap                "dont wrap long lines
set tabstop=4
set shiftwidth=4          "indent two spaces
set shiftround            "Round indent to multiple of 'shiftwidth'
set expandtab             "insert spaces instead of tab
set ruler                 "turn of position on bottom
set number                "turn on line numbers
set showmatch             "highlight matching brackets

set softtabstop=4   " number of spaces in tab when editing
set cursorline          " highlight current line

set backspace=2           "notepad style backspacing
set title                 "set the terminal title to the filename
set scrolloff=9           "start scrolling when hits this many lines from edge
set showtabline=2         "always show tab bar
                                
"colors                         
filetype plugin indent on       
syntax on                                            

"calls sudo and asks for password if necessary
cmap w!! %!sudo tee > /dev/null %
set expandtab "insert spaces instead of tab


set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
 nnoremap <leader><space> :nohlsearch<CR>
" set foldenable          " enable folding
" set foldlevelstart=10   " open most folds by default
" set foldnestmax=10      " 10 nested fold max
"" " space open/closes folds
" "nnoremap <space> za
" set foldmethod=indent   " fold based on indent level
 " allows cursor change in tmux mode
 if exists('$TMUX')
         let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
         let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
 else
         let &t_SI = "\<Esc>]50;CursorShape=1\x7"
         let &t_EI = "\<Esc>]50;CursorShape=0\x7"
 endif



set number "turn on line numbers

" auto brackets, braces and parens
"inoremap ( ()<Esc>:let leavechar=")"<CR>i
"inoremap ' ''<Esc>:let leavechar="'"<CR>i
"inoremap " ""<Esc>:let leavechar="\""<CR>i
"inoremap { {}<Esc>:let leavechar="}"<CR>i
"inoremap [ []<Esc>:let leavechar="]"<CR>i

" Disable arrow keys:
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

inoremap jk <ESC>
inoremap kj <ESC>
" imap <Tab> <Enter>

filetype plugin indent on
colorscheme candystripe


" autocmd FileType python set omnifunc=pythoncomplete#Complete
" autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS
" autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
" autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType c set omnifunc=ccomplete#Complete

" Removes trailing spaces
" function! TrimWhiteSpace()
"     %s/\s\+$//e
"     endfunction
"
"     nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>
"
if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif

    " Remove trailing whitespace from code files on save
    function StripTrailingWhitespace()
        " store current cursor location
        silent exe "normal ma<CR>"
        " delete the whitespace (e means don't warn if pattern not found)
        %s/\s\+$//e
        " restore old cursor location
        silent exe "normal `a<CR>"
    endfunction
    autocmd BufWritePre *  call StripTrailingWhitespace()

endif

augroup remember_folds
    autocmd!
    autocmd BufWinLeave *.* mkview
    
"NERD TREE settings
autocmd vimenter * NERDTree

 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif      

 let NERDTreeShowHidden=1

    autocmd BufWinEnter *.* loadview
augroup END

"updating vim update time to improve vim-gitgutter refresh
set updatetime=100                                           
