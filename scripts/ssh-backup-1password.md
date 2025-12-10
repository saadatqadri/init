# SSH Key Backup with 1Password

## Why Back Up SSH Keys?

SSH keys are machine-specific credentials. You have two options when setting up a new Mac:

1. **Generate fresh keys (recommended)** - Better security, easier to revoke per-device
2. **Restore from backup** - Immediate access, no need to update GitHub/servers

## Quick Backup with 1Password CLI

The fastest way to back up your SSH keys:

```bash
# One-time setup: enable CLI integration in 1Password app
# Settings > Developer > "Integrate with 1Password CLI"

# Back up all SSH keys at once
task ssh:backup-1password

# Or manually back up a specific key
op item create \
  --category="Secure Note" \
  --title="SSH Key - Personal GitHub" \
  --vault="Private" \
  'private_key[password]'="$(cat ~/.ssh/id_ed25519)" \
  'public_key[text]'="$(cat ~/.ssh/id_ed25519.pub)" \
  'notes[text]'="Backed up from $(hostname) on $(date)"
```

## Restore from 1Password CLI

```bash
# List your SSH key backups
op item list --categories "Secure Note" | grep "SSH Key"

# Restore a key
op item get "SSH Key - Personal GitHub" --fields private_key > ~/.ssh/id_ed25519
op item get "SSH Key - Personal GitHub" --fields public_key > ~/.ssh/id_ed25519.pub
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
ssh-add ~/.ssh/id_ed25519
```

## Backing Up to 1Password

### Option 1: Using 1Password SSH Agent (Recommended)

1Password can generate and manage SSH keys directly, syncing them across devices:

1. Open 1Password > Settings > Developer
2. Enable "Use the SSH Agent"
3. Create a new SSH key in 1Password:
   - Click + > SSH Key
   - Name it (e.g., "Personal GitHub" or "Work SSH")
   - 1Password generates the key securely
4. Add public key to GitHub/servers as usual
5. Configure SSH to use 1Password agent:

```bash
# Add to ~/.ssh/config (this is already handled in the dotfiles)
Host *
    IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
```

### Option 2: Manual Backup (for existing keys)

Store your existing SSH keys in 1Password as secure notes or documents:

1. **For each key pair**, create a new Secure Note in 1Password:
   - Title: "SSH Key - [description]" (e.g., "SSH Key - Personal GitHub")
   - Add the private key content as a field or attachment
   - Add the public key content
   - Add passphrase if the key has one

2. **Backup commands**:
```bash
# View your public key (safe to share)
cat ~/.ssh/id_ed25519.pub

# View your private key (KEEP SECRET)
cat ~/.ssh/id_ed25519

# Copy private key to clipboard for pasting into 1Password
pbcopy < ~/.ssh/id_ed25519
```

3. **Your current keys to back up**:
   - `~/.ssh/id_ed25519` (personal)
   - `~/.ssh/id_ed25519_heyarchie` (work)
   - `~/.ssh/archie_id_ed25519` (archie)
   - `~/.ssh/id_rsa` (legacy RSA key)

## Restoring on a New Mac

### From 1Password SSH Agent

If using 1Password's SSH agent, keys sync automatically. Just:

1. Install 1Password
2. Sign in
3. Enable SSH Agent in Developer settings
4. Keys are available immediately

### From Manual Backup

```bash
# Create .ssh directory with correct permissions
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Paste private key from 1Password and save
# Then set correct permissions
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub

# Add to SSH agent
ssh-add ~/.ssh/id_ed25519
```

## Generating Fresh Keys (Alternative)

If you prefer fresh keys per machine:

```bash
# Generate new ed25519 key (recommended algorithm)
ssh-keygen -t ed25519 -C "saadat.qadri@gmail.com"

# Add to GitHub
gh ssh-key add ~/.ssh/id_ed25519.pub --title "MacBook Pro $(date +%Y)"

# Or copy and add manually
pbcopy < ~/.ssh/id_ed25519.pub
# Then go to https://github.com/settings/keys
```

## Security Best Practices

1. **Always use a passphrase** on your SSH keys
2. **Use ed25519 keys** (more secure than RSA)
3. **Don't commit keys to git** (they're in .gitignore)
4. **Regularly audit** which keys have access to your servers
5. **Revoke old keys** when decommissioning machines
