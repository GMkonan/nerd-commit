#!/bin/bash

REACT_PROJECT_DIR="./web"
if [ ! -d "$REACT_PROJECT_DIR" ]; then
  echo "React project directory not found. Please ensure the directory exists."
  exit 1
fi

echo "Setting up the React project..."
cd "$REACT_PROJECT_DIR"
bun install
if [ $? -ne 0 ]; then
  echo "Failed to install React project dependencies."
  exit 1
fi

BUN_SERVER_DIR="./server"
if [ ! -d "$BUN_SERVER_DIR" ]; then
  echo "Bun server project directory not found. Please ensure the directory exists."
  exit 1
fi

echo "Setting up the Bun HTTP server project..."
cd "$BUN_SERVER_DIR"
bun install
if [ $? -ne 0 ]; then
  echo "Failed to install Bun server dependencies."
  exit 1
fi

echo "Starting the React project and Bun HTTP server..."
cd "$REACT_PROJECT_DIR"
bun dev &
REACT_PID=$!

cd "$BUN_SERVER_DIR"
bun dev &
BUN_PID=$!

# Trap to kill both processes when the script exits
trap "kill $REACT_PID $BUN_PID" EXIT

# Wait for both processes to finish
wait $REACT_PID
wait $BUN_PID