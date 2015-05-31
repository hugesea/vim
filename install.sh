echo '
set runtimepath=~/.vim_runtime,~/.vim_runtime/after,\$VIMRUNTIME
source ~/.vim_runtime/vimrc
helptags ~/.vim_runtime/doc' > ~/.vimrc
echo "Installed hugesea's vim configuration successfully! Enjoy :)"

cp default_bashrc ~/.bashrc

cp git/gitconfig ~/.gitconfig
cp git/gitignore ~/.gitignore
