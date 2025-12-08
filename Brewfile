# Brewfile - AI Development Environment
# Run: brew bundle --file Brewfile

# =============================================================================
# CORE (install order matters for some dependencies)
# =============================================================================
brew "zsh"
brew "git"
brew "gh"                      # GitHub CLI - essential for Claude Code workflows
brew "gnupg"

# =============================================================================
# NODE.JS (required for Claude Code: npm install -g @anthropic-ai/claude-code)
# =============================================================================
brew "node"
brew "nvm"                     # Node version manager

# =============================================================================
# PYTHON & AI/ML DEVELOPMENT
# =============================================================================
brew "python"                  # Latest Python
brew "python@3.12"             # Stable for most ML libraries
brew "uv"                      # Fast Python package manager (pip replacement)
brew "poetry"                  # Dependency management for projects

# =============================================================================
# DATA & DATABASES
# =============================================================================
brew "duckdb"                  # Fast analytics database
brew "postgresql@14"
brew "jq"                      # JSON processor (useful for API responses)

# =============================================================================
# CLOUD & INFRASTRUCTURE
# =============================================================================
brew "awscli"
brew "google-cloud-sdk"
brew "terraform"
brew "docker-compose"

# =============================================================================
# DEVELOPMENT TOOLS
# =============================================================================
brew "vercel-cli"
brew "hugo"
brew "go-task"                 # Task runner
brew "cmake"                   # Build tool (needed for some ML packages)
brew "wget"

# =============================================================================
# APPLICATIONS - Security (install first on new machine)
# =============================================================================
cask "1password"

# =============================================================================
# APPLICATIONS - AI & Development
# =============================================================================
cask "visual-studio-code"
cask "warp"                    # AI-powered terminal
cask "iterm2"
cask "sublime-text"
cask "docker"
cask "ollama"                  # Local LLM runner
cask "chatgpt"                 # OpenAI desktop app
cask "postman"
cask "ngrok"
cask "postico"                 # PostgreSQL GUI

# =============================================================================
# APPLICATIONS - Browsers
# =============================================================================
cask "google-chrome"
cask "firefox"

# =============================================================================
# APPLICATIONS - Productivity
# =============================================================================
cask "raycast"                 # Launcher with AI features
cask "linear-linear"
cask "zoom"
cask "loom"
cask "figma"
cask "logitech-options"

# =============================================================================
# APPLICATIONS - Other
# =============================================================================
cask "spotify"
cask "whatsapp"
cask "reader"
cask "kindle"
cask "perimeter81"

