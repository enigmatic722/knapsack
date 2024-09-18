"set nocompatible
let g:mapleader = " "
syntax on
filetype on
filetype plugin indent on

set shellcmdflag=-command
set autochdir
set splitright
set splitbelow
set matchpairs+=<:>
set omnifunc=syntaxcomplete#Complete
set suffixesadd=.java
set path+=**
set nu rnu
set tabstop=4
set shiftwidth=4
set expandtab
"set smartindent

set formatoptions-=cro
autocmd VimEnter * set formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead * set formatoptions-=cro
autocmd BufRead,BufNewFile *.jsp set filetype=html
autocmd BufRead *.class set syntax=java
autocmd! FileType json set filetype=jsonc
autocmd! BufNewFile *.java exe "normal ipublic class " . expand('%:t:r') . " {\n\n}\<Esc>gg"
autocmd! BufRead *.java if getfsize(expand('%'))==0|exe "normal ipublic class " . expand('%:t:r') . " {\n\n}\<Esc>gg"|endif

autocmd FileType autohotkey setlocal commentstring=;\ %s
autocmd FileType dosbatch setlocal commentstring=@REM\ %s

nnoremap <C-n> :set rnu!<cr>
nnoremap - 3<C-w><
nnoremap = 3<C-w>>
nnoremap + 3<C-w>+
nnoremap _ 3<C-w>-
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <leader>; :tabe $MYVIMRC<cr>
nnoremap <leader>' ``
nnoremap <leader>h :noh<cr>
nnoremap <leader>z :source $MYVIMRC<cr>
nnoremap <enter> %
vnoremap <enter> %
noremap <C-z> <Esc>
nnoremap <home> ^
inoremap <home> <c-o>^
nnoremap <leader>v :vs 
nnoremap <leader>1 :tabr<CR>
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 :tabl<CR>
nnoremap <leader>t :tabnew 
nnoremap <A-left> <C-o>
nnoremap <A-right> <C-i>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

set encoding=utf-8
set ignorecase
set smartcase
set tabstop=4 softtabstop=4 shiftwidth=4
set laststatus=2
set autoread
set nowrap
set ai
set hlsearch
set background=dark
set termguicolors
set iskeyword+=\$
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

nnoremap <leader>w :set nowrap!<CR>
nnoremap o o<Space><BS><Esc>
nnoremap O O<Space><BS><Esc>
nnoremap y "*y
nnoremap Y "*y$ 
nnoremap y" "*yi"
nnoremap y( "*yi(
nnoremap y' "*yi'
nnoremap y< "*yi<
nnoremap y{ "*yi{
nnoremap y[ "*yi[
nnoremap gp cw<C-r>*<Esc>b
nnoremap dl ^"_D
nnoremap <leader>x "*x
nnoremap <leader>d "*d
nnoremap <leader>D "*D
nnoremap <leader>c "*c
nnoremap <leader>C "*C
nnoremap <leader>/ /\<\>/<Left><Left><Left>

noremap p "*p
noremap P "*P

inoremap <C-o>o <Esc>o
inoremap <C-o>O <Esc>O

vnoremap x "*x
vnoremap y "*y
vnoremap v( vi(
vnoremap v' vi'
vnoremap v{ vi{
vnoremap v[ vi[
vnoremap " c""<Esc>P
vnoremap ' c''<Esc>P
vnoremap ( c()<Esc>P
vnoremap { c{}<Esc>P
vnoremap [ c[]<Esc>P
vnoremap < <gv
vnoremap > >gv
vnoremap <End> g_

"" vimgrep
" nnoremap <leader>g :vimgrep /<c-r><c-w>/j **/*.{c,h,txt} <bar> :copen <CR>
nnoremap <leader>g :vimgrep /<c-r><c-w>/j **/*.{c,h,txt} <bar> :copen <CR>
noremap <C-k> :cp<cr>
nnoremap <C-j> :cn<cr>
nnoremap <C-l> :.cc<cr>
nnoremap <space> :.cc<cr><C-w>w
noremap <A-S-j> :cn<cr>
noremap <A-S-k> :cp<cr>
command! -nargs=1 Gp vimgrep <q-args> % | copen

nnoremap  <A-h> :tabm -1 <CR>
nnoremap  <A-l> :tabm +1 <CR>

nnoremap <A-j> ]m
nnoremap <A-k> [m

""Replace Commands
vnoremap <C-r> "hy:%s/<C-r>h//gcI<left><left><left>
"nnoremap cpq ggw"*yt;o.<c-r>=expand('%:r')<Cr><Esc>^P^"*y$u
nnoremap cpq gg^w"*yt;:let @+ .= ".".expand("%:r")<cr>
nnoremap cpp i<space><c-r>=expand('%:r')<Cr><space>
nnoremap cpd :let @+ = expand("%:p:h")<cr>
nnoremap cpf :let @+ = expand("%:p")<cr>
nnoremap cpn :let @+ = expand("%")<cr>
command! Cpf normal! :let @+ = expand("%")<cr>
command! Cpd normal! :let @+ = expand("%:p")<cr>
command! Pd normal! i<c-r>=expand('%:p')<Cr>
command! Pn normal! i<c-r>=expand('%:r')<Cr>
command! Pf normal! i<c-r>=expand('%')<Cr>
command! Grp %s/.*\n.*\n/\0\r/g
command! Bs %s/\\/\//g "reverse backslash
command! -range=% Dbl :<line1>,<line2>g/^\s*$/d  "delete blank line
command! -range=% Dd :<line1>,<line2>s/^\d*//g  "delete blank line
command! -range=% Trl :<line1>,<line2>s/\s\+$//e "delete blank 
command! -range=% Trh :<line1>,<line2>s/^\s\+//e "delete blank 
command! -range=% B :<line1>,<line2>s/\S\s\zs\s\+//e " 第一個非空白後的第一個空白後(\zh)，開始把空白刪除
command! -range=% B1 :<line1>,<line2>s/\S\zs\s\+/  /e " 第一個非空白後的第一個空白後(\zh)，開始把空白刪除
command! Edq %s/\"/\\\"/g "escape double quote
command! -nargs=1 Lh %s/^\w\@=/<args>/g 
command! -nargs=1 Ll %s/$/<args>/g
command! -nargs=1 Ss let @/ = escape(<q-args>, '/')|normal! /<C-R>/<CR>
command! -nargs=1 Hh normal! /.*<args>/g<CR>
command! -nargs=1 Ht normal! /<args>.*/g<CR>
command! -nargs=1 Hl normal! /.*<args>/g<CR>
command! -nargs=1 Ha normal! /<args>\S\+/<CR>
command! -nargs=1 Hb normal! /\S\+<args>/<CR>
command! -nargs=1 Hc normal! /\S\+<args>\S*/<CR>
"command! -nargs=+ Hcc /\%>0c\%<split(<q-args>, ' ')[0]c 
command! -nargs=+ Hcc call Hcc (<f-args>)
function! Hcc(...)
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
		let pattern = '\%>'. arg1 . 'c' . '\%<' . arg2 . 'c'   
		let @/ = pattern
		call feedkeys("/\<CR>")
       " execute printf("normal /\\%%>%sc\\%%<%sc\<CR>", arg1, arg2)
    else
        let pattern = '\%>'. arg1 . 'c' 
		let @/ = pattern
		call feedkeys("/\<CR>")
    endif
endfunction

vnoremap r :s///g<left><left><left>
nnoremap <leader>r :%s///gcI<left><left><left><left>
nnoremap <leader><leader>r :%s///gI<left><left><left>

""""""""""Close Tabs
command! BufCurOnly silent! execute '%bd|e#|bd#'
function! OnlyAndNerdtree()
    let currentWindowID = win_getid()
    windo if win_getid() != currentWindowID && &filetype != 'nerdtree' | close | endif
endfunction
command! Only call OnlyAndNerdtree()
nnoremap <A-w> :BufCurOnly<cr>
nnoremap <A-e> :Tcl<cr>
nnoremap <A-q> :Tcr<cr>

function! TabCloseRight(bang)
    let cur=tabpagenr()
    while cur < tabpagenr('$')
        exe 'tabclose' . a:bang . ' ' . (cur + 1)
    endwhile
endfunction

function! TabCloseLeft(bang)
    while tabpagenr() > 1
        exe 'tabclose' . a:bang . ' 1'
    endwhile
endfunction

command! -bang Tcl call TabCloseRight('<bang>')
command! -bang Tcr call TabCloseLeft('<bang>')

function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
function! s:VSetSearch()
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

cnoremap <C-e> <C-r>=escape('','\')<left><left><left><left><left><left>
inoremap <C-e> <C-r>=escape('','\')<left><left><left><left><left><left>

"""vim file"""
:so $HOME\AppData\Local\nvim\plugs.vim
:so $HOME\AppData\Local\nvim\lang.vim


"""manual plugin"""
" set runtimepath^=~/.vim/bundle/java-syntax.vim


