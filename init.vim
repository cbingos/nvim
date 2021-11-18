" PackerSync + treesitter + nvim-lspconfig + completion-nvim
" ******************vim基础***************
" 快速移动行:6m0 第6行移至第1行[range]m[range] -->move
" 快速复制行:6c0 复制6行至第1行[range]c[range] -->copy
" 快速删除行:5,6d 第5行至6行[range]d -->delete
" 多行变一行：J (前面可以加数字代表几行)
" 缩进行：>5> （缩进5行:包含光标所在行）
" 反缩进：<5< 
" 批量修改：control+v --> j/h 上下选择；然后shift+i插入，d删除、r修改
" 插入行首：shift+i
" 插入行尾：shift+a
" 跳转至末尾：G
" 文件跳转至开头：gg
" 搜索/word  使用n下一个，N上一个
" 快捷键：:%s/key/key/g
" 当前行：:s/foo/bar/g
" 当前行+2：:.,+2s/foo/bar/g
" 指定行：:5,12s/foo/bar/g
" 全文：:%s/foo/bar/g
" ******************多文件***************
" 打开多文件：vim file1 file2 / :e file file2
" ******************窗口***************
" 水平窗口：:sp 
" 垂直窗口：:vsp 
" 关闭窗口：:clo[se]
" 切换窗口：Ctrl+w +h,j,k,l
" ******************## [python miniforge环境设置](https://github.com/conda-forge/miniforge)
" ### download miniforge
" 1. for mac:
" > bash: curl -fsSLo Miniforge3.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-$(uname -m).sh
" 2. for linux 
" > curl -o Miniforge3-linux-x86_64.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
" ### install miniforge
" > bash Miniforge3-xxx.sh -b
" > $HOME/miniforge3
" > conda env list (for fish shell: conda init fish)
" ### settings miniforge
" > conda create -n optornado python
" > conda activate optornado
" > conda deactivate optornado
" > conda配置清华源
" > conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
" > conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
" > conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
" > conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
" > conda config --set show_channel_urls yes
" > pip install neovim flake8 jedi-language-server # lspconfig配置需要绝对路径，记得修改境设置***************
let g:coq_settings = { 'auto_start': v:true } " coq 自动启动 
" ******************nvim treesitter语法高亮设置***************
" 真彩色,修复终端和gui显示不同配色问题
if has("termguicolors")
    " fix bug for vim
    " set t_8f=^[[38;2;%lu;%lu;%lum
    " set t_8b=^[[48;2;%lu;%lu;%lum
    " enable true color
    set termguicolors
    set guioptions-=e
endif
lua <<EOF
-- automatically ensure that packer.nvim is installed on any machine
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end
vim.cmd [[packadd packer.nvim]]
require('packer').startup({function()
    -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
    use {'dstein64/vim-startuptime'} -- 启动插件时间：StartupTime
    use {'lifepillar/vim-cheat40'} -- vim 备忘录 ;h
    -- using packer.nvim
    -- 模糊查找
    use {'Yggdroot/LeaderF', run=':LeaderfInstallCExtension' }
    -- 删除the delimiters entirely, press ds"
    use 'tpope/vim-surround' -- 修改包裹符号 'string' 按下: cs'": string" 
    -- https://github.com/terryma/vim-multiple-cursors/wiki/Keystrokes-for-example-gifs
    -- use 'terryma/vim-multiple-cursors' -- 快速编辑c+v c+n,c,c+return回车 
    use 'danilamihailov/beacon.nvim' --大跳转时分屏切换高亮显示
    use 'rhysd/accelerated-jk' -- 加快j、k 速度
    use 'mbbill/undotree' -- 显示撤消历史 ;u
    use {'phaazon/hop.nvim',as = 'hop',
        config = function()
        -- Hop 快捷单词跳转 ;j 行跳转;l （比vim-easymotion更好用) :h hop-config 
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
    use {'norcalli/nvim-colorizer.lua', -- color: #8080ff; 十六进制颜色实时显示
    }
    use 'scrooloose/nerdcommenter' --注释 ;cc 取消注释;cu
    use 'mhinz/vim-startify' -- 在启动窗口显示最近打开的文件 :Startify
    use 'jiangmiao/auto-pairs' -- 括号自动补全
    use 'godlygeek/tabular' -- Text 对齐符号、对齐方式 :Tabularized /,
    use 'itchyny/lightline.vim' -- 状态栏美化
    use 'Yggdroot/indentLine' -- 缩进线
    use 'itchyny/vim-cursorword' -- 光标下划线和高亮
    -- neovim theme onehalf theme install after execute cmd
    -- cp -r ~/.local/share/nvim/site/pack/packer/start/onehalf/vim/* \
    -- ~/.local/share/nvim/site/pack/packer/start/onehalf/
    use {'sonph/onehalf',rtp='vim/'} -- theme onehalf
    -- python 相关
    use {'kkoomen/vim-doge', run=':call doge#install()' } -- 自动生成文档noral模式下 <Leader>d
    use 'sbdchd/neoformat'  -- 代码格式化 call:F8 call :Neoformat /:Neoformat! python yapf 
    -- ln -s /Users/xuanxuan/miniconda3/envs/optornado/bin/yapf /usr/local/bin/yapf
    use 'neomake/neomake' -- python 代码检查
    use 'neovim/nvim-lspconfig' -- lsp config
    use {'ms-jpq/coq_nvim', branch='coq'} -- COQdeps COQnow COQhelp
    use {'ms-jpq/coq.artifacts', branch='artifacts'}
    use {'ms-jpq/coq.thirdparty', branch='3p'}
    --" 代码高亮显示:TSInstall python css html javascript scss typescript
    use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'}
    use 'romgrk/nvim-treesitter-context' --  类和函数超屏显示
    use 'nvim-treesitter/nvim-treesitter-refactor' -- 变量与函数跳转 
    use 'liuchengxu/vim-which-key' -- 快捷键提示
    use 'alvan/vim-closetag'
    -- ******************vim输入法自动切换***************
    -- $ curl -o /usr/local/bin/xkbswitch https://raw.githubusercontent.com/myshov/xkbswitch-macosx/master/bin/xkbswitch
    -- sudo chmod 777 /usr/local/bin/xkbswitch
    -- curl -o /usr/local/lib/libxkbswitch.dylib https://github.com/myshov/libxkbswitch-macosx/raw/master/bin/libxkbswitch.dylib
    -- sudo chmod 777 /usr/local/lib/libxkbswitch.dylib
    use 'lyokha/vim-xkbswitch'
end,
    config = {
        display = {open_fn = require('packer.util').float,}
    }
})
local coq = require "coq"
-- nvim-colorizer.lua: #8080ff; 十六进制颜色实时显示
require'colorizer'.setup{
        'css';
        'javascript';
        -- 'python';
        html = {
            mode = 'foreground';
        }
}
-- jedi_language_server 速度好像更快：cmd只支持绝对路径
require'lspconfig'.jedi_language_server.setup{
cmd = {'/Users/xuanxuan/miniconda3/envs/optornado/bin/jedi-language-server'},
    coq.lsp_ensure_capabilities()
}
-- dart flutter
require'lspconfig'.dartls.setup{coq.lsp_ensure_capabilities()}
-- coq_3p
require("coq_3p") {
  { src = "nvimlua", short_name = "nLUA" },
  { src = "vimtex", short_name = "vTEX" },
  { src = "copilot", short_name = "COP", tmp_accept_key = "<c-r>" },
  { src = "bc", short_name = "MATH", precision = 6 },
}
require'nvim-treesitter.configs'.setup {
    -- run :TSInstall python html css dart javascript lua typescript
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    ignore_install = {
        "javascript", "beancount", "bibtex", "c_sharp", "clojure", "comment",
        "commonlisp", "cuda", "dart", "devicetree", "elixir", "erlang",
        "fennel", "Godot", "glimmer", "graphql", "java", "jsdoc", "julia",
        "kotlin", "ledger", "nix", "ocaml", "ocaml_interface", "php", "ql",
        "query", "r", "rst", "ruby", "scss", "sparql", "supercollider",
        "svelte", "teal", "tsx", "typescript", "turtle", "verilog", "vue", "zig",
        "python","css",'html'
        
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {"beancount", "bibtex", "c_sharp", "clojure", "comment",
        "commonlisp", "cuda", "devicetree", "elixir", "erlang",
        "fennel", "Godot", "glimmer", "graphql", "java", "julia",
        "kotlin", "ledger", "nix", "ocaml", "ocaml_interface", "php", "ql",
        "r", "rst", "ruby", "sparql", "supercollider", "query",
        "svelte", "teal", "turtle", "verilog", "zig",
        } -- list of language that will be disable
    },
    indent = {
            enable = true,
    },
    refactor = {
        highlight_definitions = { enable = true },
        -- highlight_current_scope = { enable = true }, 
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "fr", --重命名
                },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "fd", -- 跳转到定义
                list_definitions = "fD", -- 显示定义
                list_definitions_toc = "fl", -- 显示所有定义
                goto_next_usage = "fj", -- 跳转至下一个引用
                goto_previous_usage = "fk", -- 跳转至上一个引用
            },
        },
    },
}
require'treesitter-context.config'.setup{
    enable = true, -- 函数或类太长时，上方显示该前所属
}
EOF
" ******************python path设置***************
let g:python3_host_prog = "/Users/xuanxuan/miniconda3/envs/optornado/bin/python"
" ******************accelerated_jk 加快j、k速度设置***************
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" ******************coq-nvim lsp异步补全设置***************
" Use completion-nvim in every buffer
" " Use <Tab> and <S-Tab> to navigate through popup menu
let g:coq_settings = { 'display.icons.mode': 'none' }
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
set shortmess+=c
" ******************leader键设置***************
" 定义本地leader 键;
let g:mapleader = ";"
let g:maplocalleader=';'
" ******************文件树Netrw 设置***************
" Vex左侧 :Sex
" 水平 :Vex!右侧
let g:netrw_banner = 0
let g:netrw_liststyle = 3
" 定义Netrw文件树打开方式：0当前窗口,1水平,2垂直,3新标签,4新窗口
let g:netrw_browse_split = 3
" 文件浏览器的宽度，为窗口的25%
let g:netrw_winsize = 25
" ******************leaderF 设置***************
" 弹窗显示结果
let g:Lf_WindowPosition = 'popup'
" brew install ctags 安装ctags 以便支持;:LeaderfFunction
" 列出所有LeaderF的可执行命令, 供用户检索, 可以不用记忆所有其他命令
noremap <silent> <Localleader>fh :LeaderfSelf<cr>
" 搜索most recently used file, 默认显示100个, 可以配置数量
noremap <silent> <Localleader>fm :LeaderfMru<cr>
" 搜索当前目录most recently used file, 默认显示100个, 可以配置数量
noremap <silent> <Localleader>fmm :LeaderfMruCwd<cr>
" 查找当前文件的函数或者方法, 这个基本可以用来替代tarbar
noremap <silent> <Localleader>ff :LeaderfFunction!<cr>
" 检索当前buffer的tags
noremap <silent> <Localleader>ft :LeaderfBufTag!<cr>
" 但查找所有listed buffers的tags
noremap <silent> <Localleader>fb :LeaderfBufTagAll!<cr>
" 在当前文件单词搜索行, 可以用来替代/和?
noremap <silent> <Localleader>fl :LeaderfLine<cr>
" 在所有vim的windows里检索
noremap <silent> <Localleader>fw :LeaderfWindow<cr>
" Hop 快捷单词跳转 ;j 行跳转;l 
noremap <silent> <Localleader>j <cmd>lua require'hop'.hint_words()<cr>
noremap <silent> <Localleader>l :HopLine<cr>

" ******************vim-startify启动页***************
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 1
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction
" vim-startify 首页显示参数
let g:startify_lists = [
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': 'files',     'header': ['   Files']            },
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]
let g:startify_bookmarks = ['~/Google 云端硬盘/tornadoProject/ichingshifa','~/Public/']
" ******************theme 设置***************
" let g:gruvbox_italic=1
" theme gui&command模式配置
" " use a slightly darker background, like GitHub inline code blocks
if has("gui_running")
    set background=light
    " set background=dark
    colorscheme onehalflight
else
    set background=light
    colorscheme onehalflight
    " colorscheme everforest 
    " set background=dark
endif
" ******************lightline状态栏设置***************
let g:lightline = {'colorscheme': 'one',}
set showtabline=2
" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
" ******************neoformat 设置***************
let g:neoformat_enabled_python = ['yapf',]
" let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']
autocmd FileType python noremap <buffer> <F8> :Neoformat! python yapf<CR>
" save files with auto format
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
" ******************neomake 设置***************
let g:neomake_python_enabled_makers = ['flake8'] "['pylint']
" neomake启动自动检查 normal mode (after 500ms; no delay when writing)
call neomake#configure#automake('nrwi', 500)
" ****************** 代码注释插件 nerdcomment设置***************
let g:NERDSpaceDelims=1
" ******************vim基本设置***************
" 设置分割线 ┊,│,
set fillchars=vert:┊,stl:\ ,stlnc:\ 
set list lcs=tab:\ \ ,conceal:\|
" 保持缩进
augroup remember_folds
  autocmd!
  autocmd BufWritePre * mkview
  autocmd BufWritePost * silent! loadview
augroup END
" 行号：插入模式显示绝对否则显示相对行号
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" 减少重绘次数
set lazyredraw
" 设置历史操作记录为1000条
set history=1000
" 共享系统剪切板
set clipboard=unnamed
" 命令模式下，在底部显示，当前键入的指令。键入指令是2y3d，底部显示2y3，键入d的时候，显示消失
set showcmd
" 保留撤销历史
" set undofile
" 最后的状态
set laststatus=1
" 正则匹配除了 $ . * ^ 之外其他元字符都要加反斜杠
set magic
" 光标所在的当前行高亮
set cursorline
" 设置行宽，即一行显示多少个字符。
set textwidth=108
" 自动折行，即太长的行分成几行显示。
" 关闭自动折行
" set nowrap
set wrap
" 只有遇到指定的符号（比如空格、连词号和其他标点符号），才发生折行。
set linebreak
" 支持使用鼠标。
set mouse=a
" set guioptions的缩写,gvim里可以通过设置 guioptions 来达到显示或隐藏某些gui组件
" set guioptions=m 可以隐藏菜单栏
set go=
" 在vi中输入），}时，光标会暂时的回到相匹配的（，{（如果没有相匹配的就发出错误信息的铃声），编程时很有用
set showmatch
" 自动载入被修改的文件
set autoread
au FocusGained,BufEnter * checktime
" 短暂跳转到匹配括号的时间
set matchtime=1
" 不创建备份文件。默认情况下，文件保存时，会额外创建一个备份文件，它的文件名是在原文件名的末尾，再添加一个波浪号（〜）。
set nobackup
" 表示不创建临时交换文件
set noswapfile
" 表示编辑的时候不需要备份文件
set nowritebackup
" 表示不创建撤销文件
set noundofile
" 没有保存或文件只读时弹出确认
set confirm
" 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set autoindent
" 智能选择对齐方式,类似C语言.换行时自动学会缩进
set smartindent
" #很聪明的查找,输入一个字符马上自动匹配,而不是输入完再查找
set incsearch
" 搜索时支持大小写
set ignorecase
set smartcase
" 按下 Tab 键时，Vim 显示的空格数。
set tabstop=4
" 在文本上按下>>（增加一级缩进）、<<（取消一级缩进）或者==（取消全部缩进）时，每一级的字符数
set shiftwidth=4
" 由于 Tab 键在不同的编辑器缩进不一致，该设置自动将 Tab 转为空格。
set expandtab
set backspace=indent,eol,start
" set smarttab
set nocompatible
" 命令模式下，底部操作指令按下 Tab 键自动补全。
set wildmenu
set wildmode=longest:list,full
set fo=cqrt
" 是否显示状态栏。0 表示不显示，1 表示只在多窗口时显示，2 表示显示。
set laststatus=2
" 在状态栏显示光标的当前位置（位于哪一行哪一列）
set ruler
" 对退格键提供更好帮助
set backspace=indent,eol,start
" 出错时，发出视觉提示，通常是屏幕闪烁。
set noeb visualbell
"侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 打开语法高亮。自动识别代码，使用多种颜色显示。
syntax on
syntax enable
" 自动切换工作目录，Vim会话之中打开多个文件情况
set autochdir
" encoding
set fencs=utf-8,usc-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
" 使用 utf-8 编码
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set foldmethod=indent
set foldlevel=99
" ******************vim输入法自动切换***************
let g:XkbSwitchEnabled = 1
" ******************neovim自带高亮复制显示设置***************
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup END
" ******************pythonF9自动运行设置***************
map <F9> :call CompileRunGcc()<CR>
nnoremap <silent> <leader>r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'python'
        exec '!time ~/miniconda3/envs/optornado/bin/python3 %'
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'dart'
        :!time dart %
    endif
endfunc
" ******************python自动插入文件标题***************
autocmd BufNewFile *py exec ":call SetPythonTitle()"
func SetPythonTitle()
  call setline(1,"# Copyright (c) All Rights Reserved.")
  call append(line("."), "\# File Name: ".("%"))
  call append(line(".")+1, "\# Author: ")
  call append(line(".")+2, "\# mail: ")
  call append(line(".")+5, "\# Created Time: ".strftime("%Y-%m-%d",localtime()))
endfunc
" 新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G o
" ******************vim-which-key设置***************
" ******************session设置***************
" 默认超时是 1000 ms,超时提示对应的快捷键
set timeoutlen=500
nnoremap <silent> <leader>sl :SLoad<CR>
nnoremap <silent> <leader>ss :SSave<CR>
nnoremap <silent> <leader>sd :SDelete<CR>
nnoremap <silent> <leader>sc :SClose<CR>
nnoremap <silent> <leader>u :UndotreeToggle<CR>
" ******************window窗口设置***************
nnoremap <silent> <leader>wh :wincmd h<CR>
nnoremap <silent> <leader>wj :wincmd j<CR>
nnoremap <silent> <leader>wk :wincmd k<CR>
nnoremap <silent> <leader>wl :wincmd l<CR>
" ******************vim 显示快捷键帮助文档***************
nnoremap <silent> <leader>h :Cheat40<CR>
" ******************lsp-key设置***************
" 查看函数声明
" nnoremap <silent> <Localleader>gD <cmd>lua vim.lsp.buf.declaration()<CR>
" " 查看函数定义
nnoremap <silent> <Localleader>gd <cmd>tab split \| lua vim.lsp.buf.definition()<CR> " new tab
" " 查看函数帮助文档
" nnoremap <silent> <Localleader>gh <cmd>lua vim.lsp.buf.hover()<CR>
" " 查看函数相关引用
nnoremap <silent> <Localleader>ge <cmd>lua vim.lsp.buf.references()<CR>
" " 变量重命名
" nnoremap <silent> <Localleader>gr <cmd>lua vim.lsp.buf.rename()<CR>
" " 查看前一处语法错误
" nnoremap <silent> <Localleader>gj <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
" " 查看后一处语法错误
" nnoremap <silent> <Localleader>gk <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" " go to definition lsp_finder/ preview_definition
" " formatting coding 
" nnoremap <silent> <Localleader>gf <cmd>lua vim.lsp.buf.formatting()<CR>
" ******************Leader***************
let g:which_key_map_localleader =  {
            \'b' : 'LeaderF 缓冲区文件',
            \'fb' : 'LeaderF 缓冲区tags所有',
            \'ft' : 'LeaderF 缓冲区tags当前',
            \'fh' : 'LeaderF 帮助',
            \'f' : 'LeaderF 文件打开',
            \'fm' : 'LeaderF 使用最多文件所有',
            \'fmm' : 'LeaderF 使用最多文件当前',
            \'ff' : 'LeaderF 文件函数',
            \'fl' : 'LeaderF 搜索单词',
            \'fw' : 'LeaderF 搜索窗口',
            \'gd' : 'lsp跳转定义',
            \'gp' : 'lsp查看定义',
            \'gj' : 'lsp查看前一处错误',
            \'gr' : 'lsp变量重命名',
            \'gh' : 'lsp查看帮助文档',
            \'ge' : 'lsp查看相关引用',
            \'gk' : 'lsp查看后一处错误',
            \'cc' : '代码注释',
            \'cu' : '代码取消注释',
            \'sl' : 'session 打开',
            \'ss' : 'session 保存',
            \'sd' : 'session 删除',
            \'sc' : 'session 关闭',
            \'u' : '撤消历史管理',
            \'h' : '帮助文档',
            \}
call which_key#register(';', "g:which_key_map_localleader")
" ******************treesitter-refactor***************
" 模版补全：ctrl+k , ctrl+j
let g:which_key_map_treesitter_refactor =  {
            \'r' : 'treesitter变量重命名',
            \'d' : 'treesitter跳转至定义',
            \'D' : 'treesitter查看函数声明',
            \'l' : 'treesitter显示所有定义',
            \'j' : 'treesitter跳转至下一个引用',
            \'k' : 'treesitter跳转至上一个引用',
            \'v' : ['Vex','文件树水平窗口'],
            \'s' : ['Sex','文件树水平窗口'],
            \'wh' : 'window左边',
            \'wj' : 'window下一个',
            \'wk' : 'window上一个',
            \'wl' : 'window右边',
            \'x' : '忽略NetrwBrowseX',
            \'%' : '忽略MatchitOperationBackward',
            \}
call which_key#register('f', "g:which_key_map_treesitter_refactor")
" ******************tab切换***************
" 切换tab：gt gT
" 新建tab：:tabnew
" 关闭当前tab：:tabc
" 关闭所有其他的tab：:tabo
" 查看所有打开的tab：:tabs
" 前一个tab：:tabp      
" 后一个tab：:tabn      
let g:which_key_map_tab = {
            \'j' : ['tabn','tab下一个'],
            \'k' : ['tabp','tab前一个'],
            \'c' : ['tabc','tab关闭当前'],
            \'o' : ['tabo','tab关闭所有其它'],
            \'s' : ['tabs','tab查看所有打开'],
            \'n' : ['tabnew','tab新建'],
            \}
call which_key#register('t', "g:which_key_map_tab")
nnoremap <silent> <leader> :WhichKey ';'<CR>
nnoremap <silent> <localleader> :WhichKey ';'<CR>
nnoremap <silent> t :<c-u>WhichKey 't'<CR>
nnoremap <silent> f :<c-u>WhichKey 'f'<CR>
" ******************startify hide status***************
" 根据不同文件设定编辑参数
" * shiftwidth,sw: 缩进宽度
" * softtabstop, sts: Tab 的宽度，软设置，并不改变 tabstop 的设定
" * expandtab, et: 把 tab 键展开成空格
" * autoindent, ai: 自动缩进
" * smartindent, si: 智能缩进 
" * textwidth: 自动格式化时假设的文本最大宽度（列数）
" autocmd BufEnter *.inc,*.php set filetype=php expandtab tabstop=4 shiftwidth=4 autoindent smartindent softtabstop=4
" autocmd BufEnter *.java,*.jsp set shiftwidth=4 expandtab tabstop=4 softtabstop=4 autoindent smartindent
" autocmd FileType c,cpp  set noexpandtab shiftwidth=4 softtabstop=4
" autocmd FileType dot  set shiftwidth=4 expandtab softtabstop=4
" autocmd FileType sh set expandtab tabstop=4 shiftwidth=4 expandtab softtabstop=4 autoindent smartindent
" autocmd FileType java,jsp set shiftwidth=4 expandtab softtabstop=4 autoindent smartindent
" autocmd BufEnter *.html,*.xml set shiftwidth=4 expandtab softtabstop=4 autoindent smartindent
" autocmd FileType html,xml set shiftwidth=4 expandtab softtabstop=4 autoindent smartindent
" autocmd FileType javascript,css set shiftwidth=4 expandtab softtabstop=4 autoindent smartindent
" autocmd FileType python set shiftwidth=4 expandtab softtabstop=4
" autocmd FileType *.conf set shiftwidth=4 expandtab softtabstop=4
" autocmd FileType yaml set shiftwidth=4 expandtab softtabstop=4
" 所有buffer关闭时打开首页,使用命令:bd (buffer-delete) 
" autocmd BufEnter * if len(tabpagebuflist()) == 1 | Startify | endif
" 打开文件时，自动跳到上次打开时的位置。如果该位置有错，则不做跳转
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   execute "normal g`\"" |
            \ endif
" 保存init.vim时自动重载，可以直接调用：PackerInstall进行安装
autocmd! BufWritePost $MYVIMRC source $MYVIMRC
