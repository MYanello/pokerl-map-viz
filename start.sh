#!/bin/sh
set -e

# Start the WebSocket server in the background
node /app/ws-server/index.js &

# Start the static file server in the foreground
npx serve /app
