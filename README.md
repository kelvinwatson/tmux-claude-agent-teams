# tmux-claude-agent-teams

Launch Claude Code agent teams in tmux split panes via an interactive prompt.

## Prerequisites

- [tmux](https://github.com/tmux/tmux/wiki/Installing)
- [Claude Code](https://claude.ai/code) CLI installed
- `~/.claude/settings.json` configured with:
  ```json
  {
    "env": {
      "CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS": "1"
    },
    "teammateMode": "tmux"
  }
  ```

## Install

```bash
./install.sh
source ~/.zshrc
```

## Usage

**General (any directory):**
```bash
ct
```

Both scripts prompt for:
1. Task description
2. Number of agents
3. Role for each agent

Claude Code then spawns the agents in tmux split panes automatically.
