#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

chmod +x "$SCRIPT_DIR/scripts/claude-team.sh"
chmod +x "$SCRIPT_DIR/scripts/andr-team.sh"

echo 'alias ct="'"$SCRIPT_DIR"'/scripts/claude-team.sh"' >> ~/.zshrc
echo 'alias act="'"$SCRIPT_DIR"'/scripts/andr-team.sh"' >> ~/.zshrc

echo "Installed. Run: source ~/.zshrc"
