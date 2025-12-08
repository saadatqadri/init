#!/bin/bash
set -e  # Exit on error

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE_PATH="${SCRIPT_DIR}/Brewfile"

# =============================================================================
# HOMEBREW
# =============================================================================

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for Apple Silicon
    if [[ $(uname -m) == "arm64" ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

echo "Updating Homebrew..."
brew update

echo "Upgrading installed formulae..."
brew upgrade

echo "Installing from Brewfile..."
brew bundle --file "${BREWFILE_PATH}"

echo "Cleaning up unlisted applications..."
brew bundle cleanup --force --file "${BREWFILE_PATH}"

echo "Verifying Brewfile state..."
brew bundle check --file "${BREWFILE_PATH}"

# =============================================================================
# OH-MY-ZSH (idempotent)
# =============================================================================

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
    echo "oh-my-zsh already installed, skipping..."
fi

# =============================================================================
# GIT CONFIGURATION
# =============================================================================

echo "Configuring git..."
git config --global user.name "Saadat Qadri"
git config --global user.email "saadat.qadri@gmail.com"
git config --global init.defaultBranch main
git config --global core.editor "code --wait"
git config --global credential.helper cache
git config --global user.signingkey 3CD5D6A0B9B8F207
git config --global commit.gpgsign true

# =============================================================================
# CLAUDE CODE (requires npm from node)
# =============================================================================

if ! command -v claude &> /dev/null; then
    echo "Installing Claude Code..."
    npm install -g @anthropic-ai/claude-code
else
    echo "Claude Code already installed, checking for updates..."
    npm update -g @anthropic-ai/claude-code
fi

# =============================================================================
# DONE
# =============================================================================

echo ""
echo "Initialization complete!"
echo ""
echo "Next steps:"
echo "  1. Open 1Password and sign in"
echo "  2. Run 'claude' to authenticate Claude Code with your Anthropic API key"
echo "  3. Import your GPG keys for git commit signing"
