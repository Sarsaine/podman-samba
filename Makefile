all: build

build:
	podman build -t lc-samba-test .

run:	build
	podman run --rm --name samba -d -w /data/share -p 139:139 -p 445:445 -p 137:137/udp -p 138:138/udp --volume /data/share:/data/share:Z lc-samba-test
