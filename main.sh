#!/bin/bash
shopt -s extglob

tmux kill-server

ayungeeurl="https://raw.githubusercontent.com/ayunami2000/ayungee/main/target/ayungee-1.0-SNAPSHOT-jar-with-dependencies.jar"

status_code=$(curl -L --write-out %{http_code} --silent --output /dev/null "$ayungeeurl")

if [[ "$status_code" -eq 200 ]] ; then
  curl --output ayungee/ayungee.jar "$ayungeeurl"
fi

if [ -f "base.repl" ] && ! { [ "$REPL_OWNER" == "ayunami2000" ] && [ "$REPL_SLUG" == "ayungee-server" ]; };
then
  cd mcsrv
  rm !(server.properties|server.jar|eula.txt|run.sh|plugins)
  cd ..
else
  cd mcsrv
  rm -r logs world world_nether world_the_end usercache.json
  cd ..
fi

pkill java

cd ayungee
tmux new -d -s ayungee ./run.sh
cd ../mcsrv
./run.sh
cd ..
tmux send-keys -t ayungee BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace BSpace "stop" ENTER
sleep 2
tmux kill-session -t ayungee