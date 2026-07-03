#!/bin/bash
# sudo sh load-build-deploy.sh
REPO_URL="https://github.com/Ravvka/shvirtd-example-python.git"
TARGET_PATH="/opt/net-05-task-04-05"

if [ -d "$TARGET_PATH" ]; then
  cd "$TARGET_PATH"
  git pull
else
  git clone "$REPO_URL" "$TARGET_PATH"
  chown -R $USER:$USER "$TARGET_PATH"
  cd "$TARGET_PATH" && git pull
fi

docker compose down
docker compose up -d --build
