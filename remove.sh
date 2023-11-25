docker rm bind
docker images 2> /dev/null  | grep bind | awk '{print "podman image rm -f "$3}' | sh
