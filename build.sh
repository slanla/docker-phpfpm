#/bin/bash
SCRIPT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/src"
Docker_Name="phpfpm"
Container_Name="phpfpm"

case "$1" in
  clear)
    docker rm -f $Container_Name; 
    docker rmi -f $Docker_Name ; 
    exit 0
    ;;
  debug)
    docker rm -f $Container_Name; 
    docker run --name $Container_Name -it -p 9000:9000 -v /servers:/servers $Docker_Name /bin/sh
    exit 0
    ;;
  example)
    docker rm -f $Container_Name; 
    docker run --name $Container_Name -d -p 9000:9000 -v /servers:/servers $Docker_Name
    #顯示所有container
    docker ps
    #進入Container
    docker exec -it $Container_Name /bin/sh
    exit 0
    ;;
  build)
    docker rm -f $Container_Name ; 
    docker rmi -f $Docker_Name ; 
    docker build -t="$Docker_Name" $SCRIPT_PATH
    exit 0
    ;;
  *)
    echo "./build.sh {build|debug|example|clear}";
    exit 1
    ;;
esac
  
exit 0