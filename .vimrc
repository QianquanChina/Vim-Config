set rnu
set nu
syntax on
set foldmethod=marker
set guifont=DejaVu\ Sans\ Mono\ 12
set softtabstop=4
set shiftwidth=4
set expandtab
set guioptions-=T
set nobackup
set formatoptions=tcrqn
set cindent
set smartindent
set incsearch
set autoindent
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese

"Show matching bracets
set showmatch

""Get out of VI's compatible mode
set nocompatible

if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
         if filereadable("cscope.out")
             cs add cscope.out
    "             " else add database pointed to by
    "             environment
                     elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif
set csverb
set cscopetag
set cscopequickfix=s-,g-,c-,d-,t-,e-,f-,i-
nmap <C-c><C-s> :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-g> :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-c> :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-t> :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-e> :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-c><C-f> :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-c><C-i> :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-c><C-d> :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
"----------------------自己添加的----------------------------

" jj来代替ESC按键
inoremap jj <Esc>

" 通过F2显示或者关闭行号
nnoremap <F2> :set nu! nu?<CR>  


" 你在此设置运行时路径
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" 在这里面输入安装的插件
" Vundle 本身就是一个插件
Plugin 'dense-analysis/ale' 
Plugin 'gmarik/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Valloric/YouCompleteMe'
Plugin 'luochen1990/rainbow'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 所有插件都应该在这一行之前
call vundle#end()

"重新定义leader按键
let mapleader = "'"

" Ycm的相关配置
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>

" 为了解决下面这个错误(在打开Vim时候所提示的)
" 错误NoExtraConfDetected: No .ycm_extra_conf.py file detected ………………
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'

set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
"let g:ycm_error_symbol = '✗'
"let g:ycm_warning_symbol = '⚡'
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<c-z>'
let g:ycm_semantic_triggers =  {
                        \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
                        \ 'cs,lua,javascript': ['re!\w{2}'],
                        \ }
let g:ycm_filetype_whitelist = {
			\ "c":1,
			\ "cpp":1,
			\ "objc":1,
                        \ "python":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
" ale 代码检查工具配置

"始终开启标志列
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}

" 彩虹括号的相关配置
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" Vim代码颜色的主题
syntax enable
set t_Co=256
colorscheme molokai

" 用于提示代码补全 
noremap <c-z> <NOP>

" 实现补齐括号功能
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap ' ''<ESC>i
inoremap " ""<ESC>i

vnoremap < <gv
vnoremap > >gv

" 设置NerdTree
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>


" 状态栏永远显示
set laststatus=2 
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'

"按Ctrl+h 向左移动一个buffer
nnoremap <C-h> :bp<CR>
"按Ctrl+l 向右移动一个buffer
nnoremap <C-l> :bn<CR>
"按Ctrl+^ 关闭当前buffer
nnoremap <C-^> :bd<CR>


" space 行首行尾切换
nnoremap <silent> <space> :call <SID>move()<cr>
nnoremap 0 %
vnoremap 0 %
fun! s:move()
    let [l:first, l:head] = [1, len(getline('.')) - len(substitute(getline('.'), '^\s*', '', 'g')) + 1]
    let l:before = col('.')
    exe l:before == l:first && l:first != l:head ? 'norm! ^' : 'norm! $'
    let l:after = col('.')
    if l:before == l:after
        exe 'norm! 0'
    endif
endf
"------------------------------------------------------------

"Have the mouse enabled all the time
"set mouse=a
""Set to auto read when a file is changed from the outside
set autoread

"Enable filetype plugin
filetype plugin indent on
colo desert
set hlsearch

"高亮光标所在行
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE


"let Tlist_Ctags_Cmd = '/usr/bin/ctags-exuberant' 

nnoremap <silent> <F9> :TlistToggle<CR>
"let Tlist_Use_Right_Window=1
"colorscheme delek 
"colorscheme evening
set ruler
