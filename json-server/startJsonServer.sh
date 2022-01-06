CURRENT_DIR=$PWD
PORT=4000 # default port
DELAY=0 # default dealy in ms

function help {
    echo "USAGE:"
    echo "this-script [optional parameters] filename.json"
    echo ""
    echo "EXAMPLE:"
    echo "this-script -p 3333 -d 500 db.json"
    echo ""
    echo "PARAMETERS:"
    echo "-p | --port : port of json server (default = $PORT)"
    echo "-d | --delay: response delay from json server in millisecond (default = $DELAY)"
}

if [ $# -lt 1 ]; then
    echo "must specify at least json filename"
    help
    exit
fi


while [[ $# -gt 1  ]]
do
    case "$1" in
        -p|--port)
            PORT=$2
            shift 2
            ;;
        -d|--delay)
            DELAY=$2
            shift 2
            ;;
        *)
            echo "unknown parameter: $1"
            help
            exit 1
            ;;
    esac
done

FILENAME=$1

# run the server
echo "JSON server running at localhost:$PORT with file $FILENAME and delay $DELAY ms"

docker run -it --init -p $PORT:$PORT -v "$CURRENT_DIR:/server" -e db=$FILENAME -e port=$PORT -e delay=$DELAY --name json-server --rm  ntanvinh/customizable-json-server
