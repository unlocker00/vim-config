set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
"设置无备份文件
set writebackup
set nobackup 

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"隐藏菜单
"Toggle Menu and Toolbar
set guioptions-=m " 关闭菜单栏
set guioptions-=T " 关闭工具栏
set guioptions-=l " 关闭左边滚动条
set guioptions-=L " 关闭垂直分隔窗口左边滚动条
set guioptions-=r " 关闭右边滚动条
set guioptions-=R " 关闭垂直分隔窗口右边滚动条

map <silent> <F2> :if &guioptions =~# 'T' <Bar>
      \set guioptions-=T <Bar>
      \set guioptions-=m <Bar>
      \else <Bar>
      \set guioptions+=T <Bar>
      \set guioptions+=m <Bar>
      \endif<CR>
"

"显示匹配括号
set showmatch
:set cursorline  
:set cursorcolumn
set gcr=a:block-blinkon0
"显示行号
set number
"自动缩进
set autoindent
"语法高亮
syntax on
syntax enable
colorscheme desert
" use 256 colors when possible
if &term =~? 'mlterm\|xterm\|screen-256'
	let &t_Co = 256
   " color
    colorscheme fisa
else
    " color
    colorscheme delek
endif

  set background=dark
    colorscheme solarized
" colors for gvim
"/ if has('gui_running')
"/   set background=light
"/ else
"/   set background=dark
"/ endif
set ruler "显示当前位置
" 打开vim时把已有的Tab全部转换成空格
retab
"不自动换行
set nowrap
"开启语法高亮设置
if !exists("syntax_on")
  syntax on
endif
" 使用鼠标
set mouse=a
" 输入的命令显示出来，看的清楚些。
set showcmd

"set list                       " 显示制表符
"set listchars = tab:>-,trail:- " 将制表符显示为'>---',将行尾空格显示为'-'
"set listchars=tab:.\ ,trail:.   " 将制表符显示为'.   '
hi SpecialKey guifg=#333333
set autochdir                   " 自动设置目录为正在编辑的文件所在的目录"关闭文件备份

"--------------------------------------------------------------------------------
" 状态栏相关的设置
"--------------------------------------------------------------------------------
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set laststatus=2    " always show the status line
set ruler           " 在编辑过程中，在右下角显示光标位置的状态行

set nobk
"设置默认语言为C
set filetype=c
"设置tab距离为2
set tabstop=2
"自动缩进
set softtabstop=2 
" 使用space代替tab. 
set expandtab
" 去掉 取消 自动换行 后的@@@
"set display=lastline
"换行时行间交错使用2个空格
set shiftwidth=2
"用空格代替Tab键
"set expandtab
"使用C语言的对齐方式
set cindent
"智能对齐方式
set smartindent
"自动对齐,使用上一行的对齐方式
set autoindent
"自动切换工作目录，以当前打开的文件所在目录为准
set autochdir
"设置自动缩进
set ai!
"当前行高亮
" set cursorline
"当前列高亮
" set cursorcolumn
" 设置编码
" set enc=utf-8
" 设置文件编码
 set fenc=utf-8
" 设置文字编码自动识别
"set fencs=utf-8,Unicode,gbk,ucs-bom,gb18030,gb2312,cp936
"set encoding=utf-8
" set fileencoding=gb18030

set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936 



"编辑vim配置文件
if has('unix')
  set fileformats=unix,dos,mac
  nmap <Leader>e :tabnew $HOME/.vimrc<CR>
  let $VIMFILES = $HOME.'/.vim'
else
  set fileformats=dos,unix,mac
  nmap <Leader>e :tabnew $VIM/_vimrc<CR>
  let $VIMFILES = $VIM.'/vimfiles'
endif

"设置匹配模式，类似当输入一个左括号时会匹配相应的那个右括号
"自动载入 _vimrc，修改后不需要重启
"autocmd! bufwritepost _vimrc source %
"set tags+=E:\code\project\PROJECT_TAGS
"set tags=C:\Program\ Files\ (x86)\Microsoft\ SDKs\tags
set tags=tags;
"set tags=C:\MinGW\include\tags;
set tags+=C:\Users\Administrator\FILES\administrator_data\code\program\program_dev\SDK\Microsoft_Visual_Studio_11.0\tags
set tags+=C:\Users\Administrator\FILES\administrator_data\code\program\program_dev\program\library\tags;

" 水平滚动条
" set guioptions+=b 
" map <c-w> :close<cr>
" map <c-q> :q<cr>
"状态栏标尺
set ru
"关闭vi兼容模式
set nocp
" 不要闪烁
set novisualbell
" 使用英文菜单,工具条及消息提示

set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 文件类型检测
filetype plugin on
filetype plugin indent on
map <C-F12> :!C:/Users/Administrator/FILES/tool/Vim/tool/ctags/ctags.exe -R --c++-kinds=+pl --fields=+iaS --extra=+q .<CR>
"默认路径
cd C:\Users\Administrator\FILES\administrator_data\code
"set makeprg=gcc\ -Wall\ -ohello\ test.cpp 

"开启VIM后，自动使用NeoComplete
" let g:NeoComplCache_EnableAtStartup = 1

" OmniCppComplete

set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
let OmniCpp_NamespaceSearch     = 2
"let OmniCpp_GlobalScopeSearch   = 0
"let OmniCpp_DisplayMode         = 1
"let OmniCpp_ShowScopeInAbbr     = 1 " do not show namespace in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 " show prototype in pop-up
"let OmniCpp_ShowAccess          = 1 " show access in pop-up
let OmniCpp_SelectFirstItem     = 2 " select first item in pop-up
let OmniCpp_MayCompleteDot      = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow    = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope    = 0 " autocomplete after ::
" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest,preview
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
set complete=.,w,b,u,t,i

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"let g:winManagerWindowLayout = "FileExplorer|TagList,BufExplorer"
"let g:winManagerWindowLayout = "NERDTree|TagList"
"let g:winManagerWidth = 30
"let g:defaultExplorer = 0
"let g:winManagerAutoOpen = 0
"set modifiable
""""""""""""""""""""""""""""""
" NERD Tree
""""""""""""""""""""""""""""""
let NERDChristmasTree=1 " 让树更好看,我是没看出来
let NERDTreeCaseSensitiveSort=1 " 让文件排列更有序
let NERDTreeChDirMode=0 " 改变tree目录的同时改变工程的目录
let NERDTreeHijackNetrw=1 " 当输入 [:e filename]不再显示netrw,而是显示nerdtree
let NERDTreeWinPos="left"
let NERDTreeBookmarksFile='c:/'
let NERDChristmasTree=1
let NERDTreeAutoCenter=1
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=0
let NERDTreeWinSize=31
let NERDTreeShowBookmarks = 0
let NERDTreeQuitOnOpen=1

"taglist
let Tlist_Ctags_Cmd="C:/Users/Administrator/FILES/tool/Vim/tool/ctags/ctags.exe" 
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 30
let Tlist_php_settings = 'php;c:class;i:interfaces;d:constant;f:function'
"进行Tlist的设置
"TlistUpdate可以更新tags
let Tlist_Ctags_Cmd='C:/Users/Administrator/FILES/tool/Vim/tool/ctags/ctags.exe' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=1 "让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=0 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=2 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=0 "不是一直实时更新tags，因为没有必要
let Tlist_Inc_Winwidth=0
"map <F3> :WMToggle<CR>
"autocmd VimEnter * WMToggle
""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
"let g:miniBufExplorerMoreThanOne=1  " Display when more than 2 buffers  
let g:miniBufExplMapWindowNavVim = 1  " map CTRL-[hjkl]  
"let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 " Dont change to unmodified buffer  
let g:miniBufExplSplitToEdge = 1  " Always at top  
let g:miniBufExplForceSyntaxEnable = 0 " force syntax on  if 1 powerline not show
"let g:miniBufExplMaxSize = 3 " The max height is 3 lines  

let g:bufExplorerDefaultHelp=0       " Do not show default help.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='mru'        " Sort by most recently used.
let g:bufExplorerSplitRight=0        " Split left.
let g:bufExplorerSplitVertical=1     " Split vertically.
let g:bufExplorerSplitVertSize = 30  " Split width
let g:bufExplorerMaxHeight=13        " Max height  
let g:bufExplorerUseCurrentWindow=0  " Open in new window.
autocmd BufWinEnter \[Buf\ List\] setl nonumber 

"""""""""""""""""
" vim-css-color plugin
" css_color.vim
""""""""""""""""""
"let g:cssColorVimDoNotMessMyUpdatetime = 1
"""""""""""""""""""""""""""""""""
"fencview.vim : Auto detect CJK and Unicode file encodings. 
"""""""""""""""""""""""""""""""""
"let g:fencview_autodetect = 0
"let g:fencview_checklines = 10
""""""""""""""""""""""""""""
"vim-plugin-powerline
"""""""""""""""""""""""""""
"let g:Powerline_symbols = 'fancy'

set nocompatible               " be iMproved
"filetype off                   " required!
"
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
" Better file browser
"Bundle 'scrooloose/nerdtree'
" Code commenter
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/solarized'
" Class/module browser
Bundle 'majutsushi/tagbar'
" Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'
" Zen coding
Bundle 'mattn/zencoding-vim'
" Git integration
Bundle 'motemen/git-vim'
" Tab list panel
Bundle 'kien/tabman.vim'
" Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Bundle 'rosenfeld/conque-term'
" Pending tasks lis
Bundle 'fisadev/FixedTaskList.vim'
" Surround
Bundle 'tpope/vim-surround'
" Autoclose
Bundle 'Townk/vim-autoclose'
" Indent text object
Bundle 'michaeljsmith/vim-indent-object'

Bundle 'benmills/vimux'
" Bundles from vim-scripts repos
" Autocompletion
Bundle 'AutoComplPop'
" Python code checker
Bundle 'pyflakes.vim'
" Search results counter
Bundle 'IndexedSearch'
" XML/HTML tags navigation
Bundle 'matchit.zip'
" Gvim colorscheme
Bundle 'Wombat'
" Yank history navigation
Bundle 'YankRing.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'tpope/vim-repeat'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Shougo/neosnippet'
Bundle 'groenewege/vim-less'
Bundle 'juvenn/mustache.vim'
Bundle 'roman/golden-ratio'
Bundle 'swaroopch/vim-markdown-preview'
Bundle 'tpope/vim-unimpaired'
"自动识别文件编码；
Bundle 'FencView.vim'
Bundle 'Shougo/neocomplcache.git'
Bundle 'Shougo/neosnippet.git'


" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" tabman shortcuts
"let g:tabman_toggle = 'tl'
"let g:tabman_focus  = 'tf'

"状态栏相关设置
"set statusline=[%F]%y%r%m%*%=[L:%l/%L,C:%c][%p%%]
"字体设置
if has("win32")
  set guifont=Consolas:h10:cANSI
  " set guifontwide=YaHei\ Consolas\ Hybrid:h10
  au GUIEnter * simalt ~x " 最大化窗口
endif
"Fast reloading of the .vimrc
map <silent> <leader>s :source $VIM/_vimrc<cr>
"Fast editing of .vimrc
map <silent> <leader>e :e $VIM/_vimrc<cr>

" Powerline ------------------------------------------------------------------
" Keep ^B from showing on Windows in Powerline
if has('win32') || has('win64')
  let g:Powerline_symbols = 'compatible'
elseif has('gui_macvim')
  let g:Powerline_symbols = 'fancy'
endif
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')
"let g:Powerline_theme       = 'long'
"let g:Powerline_colorscheme = 'solarized256'
"let g:Powerline_mode_v      = "VISUAL"
"let g:Powerline_mode_V      = "V:LINE"
"let g:Powerline_mode_cv     = "V:BLOCK"
"let g:Powerline_mode_s      = "SELECT"
"let g:Powerline_mode_S      = "S:LINE"
"let g:Powerline_mode_cs     = "S:BLOCK"
"let g:Powerline_mode_i      = "INSERT"
"let g:Powerline_mode_R      = "REPLACE"
"let g:Powerline_mode_n      = "NORMAL"
set laststatus=2
"set t_Co=256


"功能模块
" 生成英文的日期、时间字符串
function GetTimeInfo()
  language time en
  let tmpTimeInfo = strftime('%Y-%m-%d %A %H:%M:%S')
  language time chinese_china
  return tmpTimeInfo
endfunction
" 插入客户化添加注释
function InsertCustAddComment()
  call setline('.',"//CUST-BEGIN ADD BY LENIN IN ".GetTimeInfo())
  normal ==o
  call setline('.',"//CUST-END")
  normal ==O
  call setline('.',".")
  normal ==$x
  startinsert!
endfunction

" C++ temporary .cpp file in a new window
function! CSandBox()
  let tmpfile = tempname().'.cpp'
  exe 'new '.tmpfile
  call setline('.', '#include <windows.h>')
  normal o
  call setline('.', 'int WINAPI WinMain (HINSTANCE hInstance, HINSTANCE hPrevInst, LPSTR lpCmdLine, int nShowCmd) ')
  normal o
  call setline('.', '{ ')
  normal o
  call setline('.', '  \\ c++ temporary  ')
  normal o
  call setline('.', '  return 0; ')
  normal o
  call setline('.', '} ')
  normal 2k
  unlet tmpfile
  startinsert
endfunction


" Open a temporary PHP file in a new window
function! PHPSandBox()
  let tmpfile = tempname().'.php'
  exe 'new '.tmpfile
  call setline('.', '<?php')
  normal o
  normal o
  call setline('.', '?>')
  normal k
  unlet tmpfile
  startinsert
endfunction
" Open a temporary Python file in a new window
function! PySandBox()
  let tmpfile = tempname().'.py'
  exe 'new '.tmpfile
  call setline('.', '#!/usr/bin/python')
  normal o
  call setline('.', '# -*- coding: utf-8 -*-')
  normal o
  unlet tmpfile
  startinsert
endfunction



function! Person_C_Header()
  if( getline('.')[0] != '')
    normal O
  endif
  normal O
  normal O
  normal O
  normal O
  normal O
  normal O
  let s:line=line(".")
  call setline( s:line + 0, "/*------------------------------------------------")
  call setline( s:line + 1, " *  文件：".expand("%:t") ) 
  call setline( s:line + 2, " *  作者：Damon")
  call setline( s:line + 3, " *  时间：".strftime("%c"))
  call setline( s:line + 4, " *  描述：C++ code from vim tool!")
  call setline( s:line + 5, "-------------------------------------------------*/")
  call setline( s:line + 6, "")
  unlet s:line
  "startinsert 
  normal 6j
endfunction


function! Person_C_Time_Header()
  if( getline('.')[0] != '') 
    normal O
    normal O
  endif
  call setline(line(".") + 0, "//  mark--".strftime("%c"))
  call setline(line(".") + 1, "//  ")
  normal 2j
endfunction

function! Person_C_FunctionHeader()
  normal 3O
  normal 3k
  call setline(line(".") + 0, "/*-------------------------")
  call setline(line(".") + 1, "|-----------------------|")
  call setline(line(".") + 2, "-------------------------*/")
  normal j
  normal l
  startinsert
endfunction

function! FileHeader()
  normal $
  let end=line(".")  "末行的行号 ==〉变量 END，函数line的功能是取得指定行的行号，此处参数.表示当前行
  normal 1           "到文件的首行

  let num=1         " 1 ==〉计数器
  while num<=end
    let  line=getline(".")                 "取当前行的内容 ==〉变量 LINE
    let  line=substitute(line,$,num,"")    "在变量 LINE 的前面置入行号
    call setline(".",line)                 "将变量 LINE 的内容写回当前行
    +                                      "下移一行
    let  num=num+1                         "计数器加一
  endwhile                               "循环执行，直到文件结束
endfunction
func AddComment()
  if (getline('.')[0] == '/')
    normal ^xx
  else
    normal 0i//
  endif
endfunc

"nmap <F11> :call PHPSandBox()<CR>
"nmap <F10> :call PySandBox()<CR>
"nmap <F9> :call CSandBox()<CR>
"nmap <F8> :call Person_C_Header()<CR>
"nmap <F7> :call Person_C_Time_Header()<CR>
"nmap <F6> :call Person_C_FunctionHeader()<CR>
"nmap <F5> :call FileHeader()<CR>
" map <F4> :call AddComment()<CR>
" map <c-h> ,c<space>

nmap ,cadd :call InsertCustAddComment()<CR>
imap <C-B><C-B> <Esc>,cadd
"autocmd FileType c,cpp map <F9> :!gcc -o "%:p:r.out" "%:p" && "%:p:r.out"<CR>



"定义CompileRun函数，用来调用进行编译和运行
func CompileRun()
  exec "w"
  "C程序
  if &filetype == 'c'
    exec "!gcc -Wall -enable-auto-import % -g -o %<"
    "c++程序
  elseif &filetype == 'cpp'
    exec "!g++ % -g -o %<"
    "Java程序
  elseif &filetype == 'java'
    exec "!javac %"
  endif
endfunc
"结束定义CompileRun
"定义Run函数
func Run()
  if &filetype == 'c' || &filetype == 'cpp'
    exec "!./%<"
  elseif &filetype == 'java'
    exec "!java %<"
  endif
endfunc
"定义Debug函数，用来调试程序
func Debug()
  exec "w"
  "C程序
if &filetype == 'c'
exec "!gcc % -g -o %<"
exec "!gdb %<"
elseif &filetype == 'cpp'
exec "!g++ % -g -o %<"
exec "!gdb %<"
"Java程序
elseif &filetype == 'java'
exec "!javac %"
exec "!jdb %<"
endif
endfunc
"结束定义Debug
"设置程序的编译，运行,调试的快捷键F5,F6和F7
map <F5> :call CompileRun()<CR>
map <F6> :call Run()<CR>
map <F7> :call Debug()<CR>
"单选注释
:map <F11> <Esc>^i//<Esc>
"取消单选注释
:map <F12> <Esc>^df/<Esc>

"nnoremap <silent> <F3> :Grep<CR>
"日历插件
map <silent> <leader>a :Calendar<cr>

"双击J跳出
"imap jj			<Esc>
" Make <Backspace> act as <Delete> in Visual mode?
" vmap <BS> x

" Use CTRL-F for omni completion
 imap <C-F> <C-X><C-O>


""""""""""""""""""""""""""""""
" tabbar vim 
""""""""""""""""""""""""""""""
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
let g:Tb_MaxSize =1
let g:Tb_AutoUpdt = 1

"map lt :silent! Tlist<CR> 
map <F3> :exec("NERDTree ".expand('%:h'))<CR>



""""""""""""""""""""""""""""""""
"Ultimate auto-completion system
"
"""""""""""""""""""""""""""""""""

" Disable AutoComplPop. Comment out this line if AutoComplPop is not installed.
let g:acp_enableAtStartup = 0
" Launches neocomplcache automatically on vim startup.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underscore completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Sets minimum char length of syntax keyword.
"let g:neocomplcache_min_syntax_length = 3
"" buffer file name pattern that locks neocomplcache. e.g. ku.vim or fuzzyfinder 
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"" Define file-type dependent dictionaries.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"    \ }
"
"" Define keyword, for minor languages
"if !exists('g:neocomplcache_keyword_patterns')
"  let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"" Plugin key-mappings.
""imap <C-k>     <Plug>(neocomplcache_snippets_expand)
""smap <C-k>     <Plug>(neocomplcache_snippets_expand)
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"" SuperTab like snippets behavior.
""imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"" SuperTab like snippets behavior.
""imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
""smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"" For snippet_complete marker.
""if has('conceal')
"""  set conceallevel=2 concealcursor=i
""endif
"
"" Recommended key-mappings.
"" <CR>: close popup and save indent.
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y>  neocomplcache#close_popup()
"inoremap <expr><C-e>  neocomplcache#cancel_popup()
"
"" AutoComplPop like behavior.
""let g:neocomplcache_enable_auto_select = 1
"
"" Shell like behavior(not recommended).
""set completeopt+=longest
""let g:neocomplcache_enable_auto_select = 1
""let g:neocomplcache_disable_auto_complete = 1
""inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
""inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
"
"" Enable omni completion. Not required if they are already set elsewhere in .vimrc
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"" Enable heavy omni completion, which require computational power and may stall the vim. 
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
""autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
"let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
