#!/bin/bash
# Kill server processes
kill -9 $(ps aux | grep vscode-server | grep $USER | grep -v grep | awk '{print $2}')
# Delete related files and folder
rm -rf $HOME/.vscode-server # Or ~/.vscode-server-insiders
