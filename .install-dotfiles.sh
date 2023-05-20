#!/usr/bin/env sh

os=Fedora
package_manager=dnf

# NOTE: Extend this list with more packages.
# Be aware that not all package managers hold
# the same packages in their upstream.
packages=(
    "curl"
    "git"
    "zsh"
    "exa"
    "vim"
    "emacs"
    "kitty"
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
# * starship (Awesome shell)
# * nvm (Node version manager)
# * pnpm (Better js package manager)
# * doom (MY IDE)

# TODO: Setup
# Shell: chsh -S $(which zsh)

# TODO: Install doom environment
