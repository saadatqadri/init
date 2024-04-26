#!/bin/bash

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Path to the Brewfile in the same directory as the script
BREWFILE_PATH="${SCRIPT_DIR}/Brewfile"

# Update Homebrew and all formulas.
echo "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae.
echo "Upgrading installed formulae..."
brew upgrade

# Install or check dependencies from the Brewfile located at the user's home directory.
echo "Checking for new applications or mismatches..."
brew bundle --file "${BREWFILE_PATH}"

# Cleanup anything that is not listed in the Brewfile.
echo "Cleaning up unlisted applications..."
brew bundle cleanup --force --file "${BREWFILE_PATH}"

# Check if everything is in sync.
echo "Verifying Brewfile state..."
# Run brew bundle check with the specified Brewfile
brew bundle check --file "${BREWFILE_PATH}"

echo "Initialization complete."

# oh-my-zsh (not really idempotent)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# git setup

git config --global user.name "Saadat Qadri"
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
git config --global credential.helper cache
git config --global user.signingkey 3CD5D6A0B9B8F207
git config --global commit.gpgsign true


