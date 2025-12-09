# init

Declarative, idempotent Mac setup for AI development workflows.

## Quick Start

```bash
# Fresh Mac - run everything
./init.sh

# Or use individual tasks
task brew        # Install Homebrew packages
task dotfiles    # Symlink configuration files
task git         # Configure git
task claude      # Install Claude Code
```

## Requirements

- macOS (Apple Silicon or Intel)
- Internet connection

The script will install Homebrew and go-task automatically if needed.

## What's Included

### CLI Tools

| Tool | Purpose |
|------|---------|
| `uv` | Fast Python package manager |
| `node` / `nvm` | JavaScript runtime (required for Claude Code) |
| `gh` | GitHub CLI |
| `claude` | Claude Code AI assistant |
| `duckdb` | Analytics database |
| `awscli` / `gcloud` | Cloud CLIs |
| `terraform` | Infrastructure as code |

### Applications

| App | Purpose |
|-----|---------|
| 1Password | Password manager (install first) |
| Zed | AI-native code editor |
| Warp | AI-powered terminal |
| Ollama | Local LLM runner |
| ChatGPT | OpenAI desktop app |
| Raycast | Launcher with AI features |

### Dotfiles

Managed configuration files (symlinked from `dotfiles/`):

- `~/.zshrc` - Zsh configuration with oh-my-zsh
- `~/.p10k.zsh` - Powerlevel10k theme
- `~/.config/zed/settings.json` - Zed editor settings

## Tasks

```bash
task --list              # Show all available tasks

# Main tasks
task all                 # Full setup
task brew                # Homebrew packages only
task dotfiles            # Symlink dotfiles only
task git                 # Git config only
task claude              # Claude Code only

# Homebrew
task brew:bundle         # Install from Brewfile
task brew:cleanup        # Remove unlisted packages
task brew:dump           # Export current packages (caution)
task brew:lock           # Update lock file

# Dotfiles
task dotfiles:zsh        # Symlink zsh config
task dotfiles:zed        # Symlink Zed config
task dotfiles:backup     # Copy system dotfiles to repo

# Zsh plugins
task zsh-plugins         # Install all zsh plugins
task zsh-plugins:omz     # Install oh-my-zsh
task zsh-plugins:p10k    # Install powerlevel10k

# Utilities
task status              # Show current setup status
```

## Structure

```
init/
├── Brewfile              # Homebrew packages (formulae + casks)
├── Brewfile.lock.json    # Locked versions for reproducibility
├── Taskfile.yml          # Task definitions
├── init.sh               # Bootstrap script (installs task, runs all)
├── dotfiles/
│   ├── zsh/
│   │   ├── zshrc         # Main zsh config
│   │   └── p10k.zsh      # Powerlevel10k theme config
│   └── zed/
│       └── settings.json # Zed editor settings
└── .trunk/               # Code quality (shellcheck, shfmt)
```

## Customization

### Adding packages

Edit `Brewfile`:

```ruby
brew "your-formula"
cask "your-app"
```

Then run `task brew:bundle`.

### Modifying dotfiles

1. Edit files in `dotfiles/` directory
2. Run `task dotfiles` to re-symlink (or changes apply immediately since they're symlinked)

### Backing up current config

```bash
task dotfiles:backup    # Copies current system dotfiles to repo
```

## Notes

### Raycast

Raycast syncs settings via iCloud. Export/import manually via Raycast > Settings > Advanced > Export.

### GPG Keys

Import your GPG keys manually for commit signing:

```bash
gpg --import private-key.asc
```

### First Run on New Mac

1. Run `./init.sh`
2. Open 1Password, sign in
3. Run `claude` to authenticate with Anthropic API key
4. Import GPG keys
5. Configure Raycast (import from iCloud or previous export)

## Troubleshooting

### Dotfiles not updating

Check symlinks are correct:
```bash
task status
```

### Brew packages out of sync

```bash
task brew:cleanup
task brew:bundle
```

### Reset dotfiles to repo version

```bash
rm ~/.zshrc ~/.p10k.zsh
task dotfiles
source ~/.zshrc
```
