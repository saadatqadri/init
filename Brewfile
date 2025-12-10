# Brewfile - AI Development Environment
# Run: brew bundle --file Brewfile

# =============================================================================
# TAPS
# =============================================================================
tap "homebrew/cask-fonts"      # For Nerd Fonts

# =============================================================================
# CORE (install order matters for some dependencies)
# =============================================================================
brew "zsh"
brew "git"
brew "gh"                      # GitHub CLI - essential for Claude Code workflows
brew "gnupg"
brew "mas"                     # Mac App Store CLI

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
cask "1password-cli"               # CLI for automation (op command)

# =============================================================================
# APPLICATIONS - AI & Development
# =============================================================================
cask "zed"                     # AI-native code editor
cask "visual-studio-code"      # VS Code
cask "warp"                    # AI-powered terminal
cask "iterm2"
cask "sublime-text"
cask "docker"
cask "ollama"                  # Local LLM runner
cask "chatgpt"                 # OpenAI desktop app
cask "postman"
cask "ngrok"
cask "postico"                 # PostgreSQL GUI
cask "redis-insight"           # Redis GUI

# =============================================================================
# APPLICATIONS - Browsers
# =============================================================================
cask "google-chrome"
cask "firefox"

# =============================================================================
# APPLICATIONS - Productivity
# =============================================================================
cask "raycast"                 # Launcher with AI features
cask "cleanshot"               # Screenshot tool (better than built-in)
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

# =============================================================================
# FONTS (Nerd Fonts for terminal icons - required for powerlevel10k)
# =============================================================================
cask "font-meslo-lg-nerd-font"        # Recommended for p10k
cask "font-fira-code-nerd-font"       # Popular coding font with ligatures
cask "font-jetbrains-mono-nerd-font"  # JetBrains Mono with icons
cask "font-hack-nerd-font"            # Clean monospace font

# =============================================================================
# MAC APP STORE APPS (requires: mas signin)
# Use `mas search <app>` to find IDs, `mas list` to see installed
# =============================================================================
mas "Xcode", id: 497799835
mas "1Password for Safari", id: 1569813296
mas "Kindle", id: 302584613
mas "Okta Extension App", id: 1439967473
# mas "Slack", id: 803453959          # Using browser/desktop app instead?
# mas "Things 3", id: 904280696       # Uncomment if you use Things
# mas "Magnet", id: 441258766         # Window manager (Raycast has this built-in)
# mas "Bear", id: 1091189122          # Note-taking app

