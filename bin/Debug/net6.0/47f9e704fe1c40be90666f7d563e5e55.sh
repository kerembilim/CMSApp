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

ps 4086;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 4086 > /dev/null;
done;

for child in $(list_child_processes 4389);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/kerem/Desktop/CMSApp/bin/Debug/net6.0/47f9e704fe1c40be90666f7d563e5e55.sh;
