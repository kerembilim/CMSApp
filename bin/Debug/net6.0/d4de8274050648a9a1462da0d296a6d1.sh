function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 7271;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 7271 > /dev/null;
done;

for child in $(list_child_processes 7319);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/kerem/Desktop/cms2/cms/bin/Debug/net6.0/d4de8274050648a9a1462da0d296a6d1.sh;
