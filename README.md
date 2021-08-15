# nvim-config
## github rsa key config
    cd ~/.ssh/
    ssh-keygen -t rsa -b 4096 -C "githubusername" # default file id_rsa.pub id_rsa
    ssh -vT git@github.com # test ssh
## github config
    git init
    git add *
    git commit -m "first commit nvim config init.vim"
    git remote add origin git@github.com:cbingos/nvim.git
    git branch -M main
    git push origin HEAD:master # first
    git push -u origin master

