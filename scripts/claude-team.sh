#!/bin/zsh

# Gather inputs before launching tmux
echo "Task description:"
read -r TASK

echo "Number of agents:"
read -r NUM_AGENTS

ROLES=()
for i in $(seq 1 $NUM_AGENTS); do
    echo "Role for agent $i:"
    read -r ROLE
    ROLES+=("$ROLE")
done

# Build the spawn prompt
ROLE_LIST=""
for i in $(seq 1 $NUM_AGENTS); do
    ROLE_LIST+="- ${ROLES[$i]}"$'\n'
done

PROMPT="Spawn $NUM_AGENTS teammates using claude-sonnet-4-6 for the following task: $TASK

Roles:
$ROLE_LIST"

# Kill existing session if present
SESSION="team"
tmux kill-session -t "$SESSION" 2>/dev/null

# Start tmux session and launch claude
tmux new-session -d -s "$SESSION"
tmux send-keys -t "$SESSION" "claude" Enter

# Wait for claude to initialize then send the prompt
sleep 5
tmux send-keys -t "$SESSION" "$PROMPT" Enter

# Attach
tmux attach-session -t "$SESSION"
