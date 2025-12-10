#!/bin/bash
# macOS Defaults - Sensible defaults for a development machine
# Run: ./scripts/macos-defaults.sh
# Some changes require logout/restart to take effect

set -e

echo "Setting macOS defaults..."

# Close System Preferences to prevent overriding changes
osascript -e 'tell application "System Preferences" to quit' 2>/dev/null || true

# ==============================================================================
# KEYBOARD (your current: KeyRepeat=2, InitialKeyRepeat=15 - very fast!)
# ==============================================================================
echo "Configuring keyboard..."

# Fast key repeat (lower = faster, yours is already at 2 which is great)
defaults write NSGlobalDomain KeyRepeat -int 2

# Short delay before repeat starts (lower = shorter, yours is 15)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Disable press-and-hold for accented characters (enables key repeat everywhere)
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# ==============================================================================
# DOCK (your current: autohide=1, tilesize=50)
# ==============================================================================
echo "Configuring Dock..."

# Enable auto-hide
defaults write com.apple.dock autohide -bool true

# Remove auto-hide delay
defaults write com.apple.dock autohide-delay -float 0

# Faster auto-hide animation
defaults write com.apple.dock autohide-time-modifier -float 0.3

# Set dock icon size
defaults write com.apple.dock tilesize -int 50

# Don't show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Don't animate opening applications
defaults write com.apple.dock launchanim -bool false

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.1

# ==============================================================================
# FINDER (your current: AppleShowAllFiles=1)
# ==============================================================================
echo "Configuring Finder..."

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show path bar at bottom
defaults write com.apple.finder ShowPathbar -bool true

# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Search current folder by default (not entire Mac)
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Avoid creating .DS_Store on USB volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Show icons for hard drives, servers, and removable media on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Use list view in all Finder windows by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# ==============================================================================
# SCREENSHOTS
# ==============================================================================
echo "Configuring screenshots..."

# Create screenshots directory
mkdir -p ~/Screenshots

# Save screenshots to ~/Screenshots
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

# Save screenshots as PNG
defaults write com.apple.screencapture type -string "png"

# Disable shadow in screenshots
defaults write com.apple.screencapture disable-shadow -bool true

# ==============================================================================
# TRACKPAD & MOUSE
# ==============================================================================
echo "Configuring trackpad..."

# Enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable three finger drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true

# Increase tracking speed (1-3, higher = faster)
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.0

# ==============================================================================
# SAFARI (if you use it)
# ==============================================================================
echo "Configuring Safari..."

# Don't open "safe" files automatically
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Enable developer menu and web inspector
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true

# ==============================================================================
# TERMINAL
# ==============================================================================
echo "Configuring Terminal..."

# Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Enable Secure Keyboard Entry in Terminal
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# ==============================================================================
# ACTIVITY MONITOR
# ==============================================================================
echo "Configuring Activity Monitor..."

# Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

# ==============================================================================
# TEXT EDIT
# ==============================================================================
echo "Configuring TextEdit..."

# Use plain text mode by default
defaults write com.apple.TextEdit RichText -int 0

# Open and save files as UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# ==============================================================================
# MISC SYSTEM PREFERENCES
# ==============================================================================
echo "Configuring system preferences..."

# Disable the "Are you sure you want to open this application?" dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable Resume system-wide
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false

# Disable automatic termination of inactive apps
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

# ==============================================================================
# ENERGY & PERFORMANCE
# ==============================================================================
echo "Configuring energy settings..."

# Never go into computer sleep mode (when on power adapter)
sudo pmset -c displaysleep 15 sleep 0 disksleep 0 2>/dev/null || true

# ==============================================================================
# RESTART AFFECTED APPLICATIONS
# ==============================================================================
echo ""
echo "Restarting affected applications..."

for app in "Activity Monitor" "Dock" "Finder" "Safari" "SystemUIServer"; do
  killall "${app}" &> /dev/null || true
done

echo ""
echo "Done! Some changes require logout/restart to take effect."
echo ""
echo "Key settings applied:"
echo "  - Fast key repeat (KeyRepeat=2, InitialKeyRepeat=15)"
echo "  - Dock: auto-hide, size 50, no recents"
echo "  - Finder: show hidden files, extensions, path bar"
echo "  - Screenshots saved to ~/Screenshots"
echo "  - Trackpad: tap to click, three finger drag"
