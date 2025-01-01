#!/bin/bash

open_ui() {
    local URL="$1"
    local OS="$(uname -s)"

    case "$OS" in
        Linux*)
            echo "Detected Linux, using xdg-open..."
            xdg-open "$URL"
            ;;
        Darwin*)
            echo "Detected macOS, using open..."
            open "$URL"
            ;;
        CYGWIN*|MINGW32*|MSYS*|MINGW*)
            echo "Detected Windows, using start..."
            start "$URL"
            ;;
        *)
            echo "Unsupported operating system: $OS"
            exit 1
            ;;
    esac
}

URL="http://localhost:5173"


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

cd ..

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

cd ..

echo "Starting the React project and Bun HTTP server..."
cd "$REACT_PROJECT_DIR"
bun dev &
REACT_PID=$!

cd ..

cd "$BUN_SERVER_DIR"
bun run index.ts &
BUN_PID=$!

open_ui "$URL"

# Trap to kill both processes when the script exits
trap "kill $REACT_PID $BUN_PID" EXIT


# Wait for both processes to finish
wait $REACT_PID
wait $BUN_PID
