"leader
let g:mapleader = " "
" nnoremap , \
" nnoremap ' ,

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"set clipboard+=unnamedplus "for linux clipboard
"set shell=powershell

"set nocompatible
"filetype plugin on
"runtime macros/matchit.vim
set cursorline
set shellcmdflag=-command
set autochdir
set splitright
set splitbelow
set matchpairs+=<:>
set omnifunc=syntaxcomplete#Complete
set suffixesadd=.java
set path+=**
set nu rnu
"set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" nnoremap <leader>s :set smartcase!<cr>
set formatoptions-=cro
autocmd VimEnter * set formatoptions-=c formatoptions-=r formatoptions-=o
autocmd BufNewFile,BufRead * set formatoptions-=cro
autocmd BufRead,BufNewFile *.jsp set filetype=html
autocmd BufRead *.class set syntax=java
autocmd! FileType json set filetype=jsonc
autocmd! FileType vim setlocal commentstring=\"\ %s
autocmd! FileType dosini setlocal commentstring=#\ %s
autocmd! FileType sh setlocal commentstring=#\ %s
"autocmd! BufNewFile *.java exe \"normal Opublic class \" . expand('%:t:r')
autocmd! BufNewFile *.java exe "normal ipublic class " . expand('%:t:r') . " {\n\n}\<Esc>gg"
autocmd! BufRead *.java if getfsize(expand('%'))==0|exe "normal ipublic class " . expand('%:t:r') . " {\n\n}\<Esc>gg"|endif

nnoremap <C-n> :set rnu!<cr>
nnoremap - 3<C-w><
nnoremap = 3<C-w>>
nnoremap + 3<C-w>+
nnoremap _ 3<C-w>-
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <C-s> :tabe $MYVIMRC<cr>
nnoremap <leader>' ``
nnoremap <leader>z :source $MYVIMRC<cr>
nnoremap <enter> %
vnoremap <enter> %

" noremap <C-z> <Esc>
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
nnoremap <leader>; :tabl<CR>
nnoremap <A-left> <C-o>
nnoremap <A-right> <C-i>
nnoremap <leader>/ /\<\>/<Left><Left><Left>
" inoremap ;; ;
" inoremap ; <Esc>g_a;
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

"inoremap <leader>; ;
command! P normal! p

noremap <A-b> <C-b>

if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap gl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" noremap <A-o> :Gj 
nnoremap <leader>h :noh<cr>
noremap <A-S-j> :cn<cr>
noremap <A-S-k> :cp<cr>

set encoding=utf-8
set ignorecase
set smartcase
set tabstop=4 softtabstop=4 shiftwidth=4
set laststatus=2
set autoread
set nowrap
"set list listchars=tab:\:\ ,trail:·,extends:?,precedes:?,nbsp:×
set ai
"set ruler
set hlsearch
set background=dark
set termguicolors
set laststatus=2
"set virtualedit=block # visual block
set iskeyword+=\$
syntax on
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

nnoremap <C-w><PageUp> <C-w>k 
nnoremap <C-w><PageDown> <C-w>j
nnoremap <A-UP> :m-2<CR> 
nnoremap <A-DOWN> :m+1<CR> 
nnoremap <F3> :set nonumber!<CR>
nnoremap <leader>w :set nowrap!<CR>
nnoremap <F5> :set paste!<CR>
nnoremap o o<Space><BS><Esc>
nnoremap O O<Space><BS><Esc>
inoremap <C-o>o <Esc>o
inoremap <C-o>O <Esc>O
nnoremap dl ^"_D
nnoremap d "_d
nnoremap D "_D
nnoremap x "_x
nnoremap s "_s
nnoremap c "_c
vnoremap d "_d
vnoremap c "_c
nnoremap gp "_dwpb
nnoremap <leader>d d
nnoremap <leader>D D
nnoremap <leader>c c
nnoremap Y y$
"vnoremap v< vi<
vnoremap v{ vi{
vnoremap v[ vi[
vnoremap " c""<Esc>P
vnoremap ' c''<Esc>P
vnoremap ( c()<Esc>P
vnoremap { c{}<Esc>P
vnoremap [ c[]<Esc>P
vnoremap < c<><Esc>P
vnoremap < <gv
vnoremap > >gv

nnoremap <leader>g :vimgrep /<c-r><c-w>/j **/*.{c,h,txt} <bar> :copen <CR>
" inoremap jk <ESC>
nnoremap <Tab> :><CR>
nnoremap <S-Tab> :<<CR>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
noremap <C-k> :cp<cr>
nnoremap <C-j> :cn<cr>
nnoremap <C-l> :.cc<cr>
nnoremap <space> :.cc<cr><C-w>w
command! -nargs=1 Gp vimgrep <q-args> % | copen
" cursor move gseries in long line
vnoremap <End> g_
"
" tab series
"command T -nargs=1 :tabnew +<args>buf
"nnoremap T :tabnew\|0r!grep -n '' #<Left><Left><Left>
"command! -nargs=1 T :args <args> | tab all
nnoremap  <A-h> :tabm -1 <CR>
nnoremap  <A-l> :tabm +1 <CR>
"nnoremap tmi :tabm 0 <CR>
"nnoremap tm; :execute 'tabm' tabpagenr('$') <CR>

nnoremap <A-j> ]m
nnoremap <A-k> [m
nnoremap <leader>f /\<\>/<Left><Left><Left>
"xnoremap <leader>d "_d
"xnoremap <leader>p "_dP

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
"command! Dbl g/^\s*$/d "delete blank line
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


"nnoremap <S-s> :sort // r<CR> 
"nnoremap <C-s> :sort! // r<CR> 

command! -nargs=1 D %s/<args>//gcI
"command! -nargs=1 Db ,$s/<args>//gcI

vnoremap R :s///g<left><left><left>
nnoremap <leader>r :%s//<C-r><C-w>/gcI<left><left><left><left>
nnoremap R :R args 
command! -nargs=+ R call R (<f-args>)
function! R(arg0, ...)
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf('%%substitute/%s/%s/gcI', arg1, arg2)
    elseif a:0 == 1
        execute printf('%%substitute//%s/gcI', arg1)
	else
        execute printf('%%s///gcI')
    endif
endfunction

command! -nargs=+ Rb call Rb (<f-args>)
function! Rb(...)
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf(',$substitute/%s/%s/gcI', arg1, arg2)
    else
        execute printf(',$substitute//%s/gcI', arg1)
    endif
endfunction

command! -nargs=+ Rbw call Rbw (<f-args>)
function! Rbw(...)
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf(',$substitute/\<%s\>/%s/gcI', arg1, arg2)
    else
        execute printf(',$substitute//%s/gcI', arg1)
    endif
endfunction

command! -nargs=1 Rl s//<args>/gcI

command! -nargs=+ Rw call Rw (<f-args>)
function! Rw(...)
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf('%%substitute/\<%s\>/%s/gcI', arg1, arg2)
    else
        execute printf('%%substitute//%s/gcI', arg1)
    endif
endfunction

command! -nargs=+ Dh call Dh(<f-args>)
function! Dh( ... )
	let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
		execute printf('%%substitute/.*%s/%s/g', a:1, a:2)
    else
	    execute printf('%%substitute/.*%s//g', a:1)
    endif
endfunction

command! -nargs=+ Dbw call Dbw(<f-args>)
function! Dbw( ... )
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf('%%substitute/.*\<%s\>/%s/g', a:1, a:2)
    else
        execute printf('%%substitute/.*\<%s\>/%s/g', a:1, a:1)
    endif
endfunction

command! -nargs=+ Da call Da(<f-args>) 
function! Da( ... )
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
		execute printf('%%substitute/%s.*/%s/g', a:1, a:2)
    else
		execute printf('%%substitute/%s.*//g', a:1)
    endif	
endfunction

command! -nargs=+ Daw call Daw(<f-args>)
function! Daw( ... )
    let arg1 = get(a:, 1, 0)
    let arg2 = get(a:, 2, 0)
    if a:0 == 2
        execute printf('%%substitute/\<%s\>.*/%s/g', a:1, a:2)
    else
        execute printf('%%substitute/\<%s\>.*//g', a:1)
    endif
endfunction

command! -nargs=1 Fil v/.*<args>/d
command! -nargs=1 Filn g/.*<args>/d
command! -nargs=1 Filw v/.*\<<args>\>/d
command! -nargs=1 Filwn g/.*\<<args>\>/d

command! -nargs=1 Dg g/<args>/d
command! -nargs=1 Dv v/<args>/d

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
nnoremap tci :Tcr<cr>
nnoremap tc; :Tcl<cr>
nnoremap tca :tabc<cr>
nnoremap tco :BufCurOnly<cr>


":tabm[ove] 0 => 將當前 tab 視窗順序移動到順序 0
"
":tabc[lose] => 關閉該 tab 視窗
":.+1,$tabdo :tabc
":.-1,0tabdo :tabc
":tabo[nly] => 關閉其它 tab 視窗
""""""""""


function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction


"" plugin
set runtimepath^=~/.vim/bundle/commentary
set runtimepath^=~/.vim/bundle/delimitMate

let g:delimitMate_expand_cr=1
let g:delimitMate_expand_space=1

"let g:UltiSnipsExpandTrigger="<C-J>"
"let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

nnoremap <silent> <leader>e :NERDTreeToggle <CR>

if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark

"let g:dracula_colorterm = 0
"colorscheme dracula

"" sneak
"let g:sneak#label = 1
"nnoremap f <Plug>Sneak_f
"map F <Plug>Sneak_F
"map t <Plug>Sneak_t
"map T <Plug>Sneak_T

"" easy-motion
let g:EasyMotion_do_mapping = 0
"omap f <Plug>(easymotion-bd-f)
map gs <Plug>(easymotion-bd-f)
map S <Plug>(easymotion-s2)
omap T <Plug>(easymotion-bd-tl)

xmap <C-_> <Plug>Commentary
"nmap <C-_> <Plug>Commentary
imap <C-_> <C-o><Plug>CommentaryLine
omap <C-_> <Plug>Commentary
nmap <C-_> <Plug>CommentaryLine


"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_default_semantic_highlight_groups = 1

""" EasyMotion
"map  <A-n> <Plug>(easymotion-next)
"map  <A-N> <Plug>(easymotion-prev)

" map  J <Plug>(easymotion-next)
" map  K <Plug>(easymotion-prev)

"""CtrlP
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.class 
set wildignore+=**/target/**
set wildignore+=**/node_modules/**
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_custom_ignore = {
  \ 'dir':  'target',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
	\ 'AcceptSelection("h")': ['<a-x>', '<c-x>'],
	\ 'AcceptSelection("v")': ['<a-v>', '<c-v>', '<RightMouse>'],
    \ }

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_multiple_files = 'tj'
" let g:coc_start_at_startup = v:false

"""NerdTree
let g:NERDTreeRespectWildIgnore = 1

"""Emmet-Html
"let g:user_emmet_mode='n'
" let g:user_emmet_leader_key='<C-s>'

"""NvimTree
"lua require'nvim-tree'.setup()

"highlight link javaIdentifier NONE
"highlight link javaConstant NONE
"
let g:python_highlight_all=1
let g:java_highlight_all = 1


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


set tabline=%!MyTabLine()
function MyTabLine()
  let s = '' " complete tabline goes here
  " loop through each tab page
  for t in range(tabpagenr('$'))
    " select the highlighting for the buffer names
    if t + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    " empty space
    let s .= ' '
    " set the tab page number (for mouse clicks)
    let s .= '%' . (t + 1) . 'T'
    " set page number string
    let s .= t + 1 . ' '
    " get buffer names and statuses
    let n = ''  "temp string for buffer names while we loop and check buftype
    let m = 0 " &modified counter
    let bc = len(tabpagebuflist(t + 1))  "counter to avoid last ' '
    " loop through each buffer in a tab
    for b in tabpagebuflist(t + 1)
      " buffer types: quickfix gets a [Q], help gets [H]{base fname}
      " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
      if getbufvar( b, "&buftype" ) == 'help'
        let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
      elseif getbufvar( b, "&buftype" ) == 'quickfix'
        let n .= '[Q]'
      else
        "let n .= pathshorten(bufname(b))
        let n .= bufname(b)
      endif
      " check and ++ tab's &modified count
      if getbufvar( b, "&modified" )
        let m += 1
      endif
      " no final ' ' added...formatting looks better done later
      if bc > 1
        let n .= ' '
      endif
      let bc -= 1
    endfor
    " add modified label [n+] where n pages in tab are modified
    if m > 0
      "let s .= '[' . m . '+]'
      let s.= '+ '
    endif
    " add buffer names
    if n == ''
      let s .= '[No Name]'
    else
      "let s .= n
      let s .= fnamemodify(n, ":t") 
    endif
    " switch to no underlining and add final space to buffer list
    "let s .= '%#TabLineSel#' . ' '
    let s .= ' '
  endfor
  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'
  " right-align the label to close the current tab page
  if tabpagenr('$') > 1
    let s .= '%=%#TabLine#%999XX'
  endif
  return s
endfunction
