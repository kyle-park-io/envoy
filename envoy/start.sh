docker stop $(docker ps -q)
docker rm $(docker ps -a -q)

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
docker run -d --name envoy -p 8080:8080 -v $SCRIPT_DIR/envoy.yaml:/etc/envoy/envoy.yaml envoyproxy/envoy:v1.30-latest
