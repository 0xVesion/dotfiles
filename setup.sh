# Update macOS
softwareupdate --all --install --force

# Install brew if not exists
if ! command -v brew &> /dev/null
then
   echo "Installing brew..."
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install brew apps
cd ~/.dotfiles/brew
brew bundle
brew cleanup
brew doctor

# Install oh my zsh if not exists
if [[ ! -e ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Symlink dotfiles
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/ssh/config ~/.ssh/config
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig

