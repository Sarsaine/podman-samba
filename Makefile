TAG = "localhost/alzundaz/samba:latest"
NAME = "alzundaz_samba"

all: build run

build:
	rm -rf ./cache
	mkdir -p ./cache
	cp ./files/* ./cache/
	cp ./local/* ./cache/
	podman build -t $(TAG) .

run:
#	podman run --rm --name $(NAME) -d -w /data/share -p 139:139 -p 445:445 -p 137:137/udp -p 138:138/udp --volume /data/share:/data/share:z $(TAG)
	podman run --rm --name $(NAME) -d -w /data/share --volume /data/share:/data/share:z $(TAG)

remove:
	podman rmi -f $(TAG)

.PHONY: build run remove
