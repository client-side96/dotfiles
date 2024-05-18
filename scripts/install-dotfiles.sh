#!/usr/bin/env sh

os=MacOS
package_manager=brew

# NOTE: Extend this list with more packages.
# Be aware that not all package managers hold
# the same packages in their upstream.
packages=(
    "curl" # Download stuff
    "git" # Version everything
    "zsh" # Better than the default shell
    "exa" # List files in a nice way
    "vim" # <3
    "emacs" # <3 <3
    "kitty" # The best terminal emulator
    "ttfautohint" # Dependency to build 'My Iosevka'
    "yazi" # File Manager
)

echo "Starting installation on your $os system..."
echo ""

echo "Packages are installed via $package_manager: $joined_packages"
echo ""

joined_packages=$(IFS=" " ; echo "${packages[*]}") # join array of packages to string
sudo $package_manager install $joined_packages

echo "Installing some packages manually..."
echo ""
# TODO: Packages
# * antigen (Package manager for zsh)
# * starship (Awesome shell)
# * nvm (Node version manager)
# * pnpm (Better js package manager)
# * doom (MY IDE)
echo "Installing antigen"
curl -L git.io/antigen > $HOME/.config/antigen/antigen.zsh
echo "Installing starship"
curl -sS https://starship.rs/install.sh | sh
echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
