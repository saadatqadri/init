#!/bin/bash
# Legacy wrapper - use 'task' commands instead
# See: task --list

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Check if go-task is installed
if ! command -v task &> /dev/null; then
    echo "go-task not found. Installing via Homebrew..."

    # Install Homebrew if needed
    if ! command -v brew &> /dev/null; then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        if [[ $(uname -m) == "arm64" ]]; then
            eval "$(/opt/homebrew/bin/brew shellenv)"
        fi
    fi

    brew install go-task
fi

# Run the full setup
task all
