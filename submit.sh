#!/bin/bash
JUDGE_URL="https://contract-battle-judge.onrender.com/submit"
REPO_OWNER="Rohan-droid7341"
REPO_NAME="Contract-battle"

if ! command -v curl &> /dev/null; then
    echo "⚠️ Error: curl is required to transmit the payload."
    exit 1
fi

USERNAME=$(git config --get remote.origin.url | sed -E 's/.*github\.com[:\/]([^\/]+).*/\1/')
if [ -z "$USERNAME" ] || [[ "$USERNAME" == *"git@"* ]]; then
    USERNAME=$(git config user.name)
fi

if [[ -z "$USERNAME" ]]; then
    echo "🛑 Aborting: Could not detect GitHub Username from git config."
    exit 1
fi

LEVEL=$1
if [ -z "$LEVEL" ]; then
    LEVEL=$(ls src/Level*.sol 2>/dev/null | grep -o '[0-9]\+' | sort -nr | head -n1)
    if [ -z "$LEVEL" ]; then
        echo "🛑 Aborting: No src/LevelX.sol file found."
        exit 1
    fi
fi

TARGET_FILE="src/Level${LEVEL}.sol"

if [ ! -f "$TARGET_FILE" ]; then
    echo "🛑 Aborting: $TARGET_FILE not found."
    exit 1
fi

echo "🚀 Bundling Level $LEVEL module for User: $USERNAME..."
echo "📡 Transmitting module to remote server..."

RESPONSE=$(curl -s -X POST "$JUDGE_URL" \
    --data-urlencode "username=$USERNAME" \
    --data-urlencode "repoOwner=$REPO_OWNER" \
    --data-urlencode "repoName=$REPO_NAME" \
    --data-urlencode "level=$LEVEL" \
    --data-urlencode "code@$TARGET_FILE")

STATUS=$(echo "$RESPONSE" | grep "^STATUS=" | cut -d'=' -f2)

if [ "$STATUS" == "SUCCESS" ]; then
    echo "🟢 SUCCESS! You have passed the evaluation."
    echo "📦 Extracting Level $((LEVEL+1)) payload..."
    
    echo "$RESPONSE" | grep "^FILE_" | while IFS='=' read -r key val; do
        filename=$(echo "$key" | sed 's/^FILE_//' | tr '@' '/')
        mkdir -p "$(dirname "$filename")" 2>/dev/null || true
        
        if [[ "$OSTYPE" == "darwin"* ]]; then
            echo "$val" | base64 --decode > "$filename"
        else
            echo "$val" | base64 -d > "$filename"
        fi
        echo "   ✅ $filename installed."
    done
    
    echo "🏆 Check the official repository to see your name on the Leaderboard!"
    exit 0
else
    echo "🔴 ACCESS DENIED."
    MESSAGE=$(echo "$RESPONSE" | grep "^MESSAGE=" | cut -d'=' -f2-)
    echo "Reason: $MESSAGE"
    echo "Review your local logic carefully, run your own edge cases, and try again!"
    exit 1
fi
