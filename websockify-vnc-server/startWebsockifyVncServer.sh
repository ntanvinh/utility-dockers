VNC_PORT=5900
WS_PORT=7900

function help {
  echo "USAGE:"
  echo "this-script [optional parameters] vnc-server-ip"
  echo ""
  echo "EXAMPLE:"
  echo "this-script --vncPort 5000 --wsPort 5001 192.168.1.5"
  echo ""
  echo "OPTIONAL PARAMETERS:"
  echo "-vp | --vncPort : listening port of VNC server (default $VNC_PORT)"
  echo "-wp | --wsPort : listening port of websockifying (default $WS_PORT)"
}

if [ $# -lt 1 ]; then
  echo "must specify at least IP of VNC server!"
  help
  exit 1
fi

while [[ $# -gt 1 ]]
do
  case "$1" in
    -vp|--vncPort)
      VNC_PORT=$2
      shift 2
      ;;
    -wp|--wsPort)
      WS_PORT=$2
      shift 2
      ;;
    *)
      echo "unknown parameter $1"
      help
      exit 1
      ;;
  esac
done

VNC_IP=$1

if [[ $VNC_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "websockifying VNC server $VNC_IP:$VNC_PORT to localhost:$WS_PORT"
  docker run -it --init -p $WS_PORT:$WS_PORT -e vncIp=$VNC_IP -e vncPort=$VNC_PORT -e wsPort=$WS_PORT --name websockify-server --rm ntanvinh/websockify-vnc-server
else
  echo "VNC IP address is incorrect!"
  exit 1
fi
