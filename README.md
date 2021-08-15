# nvim-config --> 主要面向python开发环境
## [github rsa key config](https://docs.github.com/cn/github/authenticating-to-github/troubleshooting-ssh/error-permission-denied-publickey)
    cd ~/.ssh/
    ssh-keygen -t rsa -b 4096 -C "githubusername" # default file id_rsa.pub id_rsa
    ssh -vT git@github.com # test ssh
### github config
    git init
    git add *
    git commit -m "first commit nvim config init.vim"
    git remote add origin git@github.com:cbingos/nvim.git
    git branch -M main
    git push origin HEAD:master
## 使用PackerSync + treesitter + lsp + lsp补全
> ******************python miniforge环境设置***************
     https://github.com/conda-forge/miniforge
     for mac:
     bash: curl -fsSLo Miniforge3.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-MacOSX-$(uname -m).sh
     for linux 
     " curl -o Miniforge3-linux-x86_64.sh https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
     bash Miniforge3-xxx.sh -b
     $HOME/miniforge3
     conda env list
     for linux:
     for fish shell: conda init fish
     ******************conda setting
     conda create -n optornado python
     conda activate optornado
     conda deactivate optornado
     conda配置清华源
     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/pytorch/
     conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/cloud/conda-forge/
     conda config --set show_channel_urls yes
     conda install neovim flake8 jedi-language-server  lspconfig配置需要绝对路径，记得修改
     pip install neovim flake8 jedi-language-server 
