# Install Packer.nvim
echo "Installing packer..."
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install vim-plug
echo "\nInstalling vim-plug..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Run PackerSync and PlugInstall
echo "\nRunning PackerSync and PlugInstall..."
mv ./after ./after-bak
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
nvim --headless -c 'PlugInstall' -c 'qall'
mv ./after-bak ./after

echo "Complete"
