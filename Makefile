NAME=ifconfigd

all: deps test install

deps:
	go get -d -v

fmt:
	go fmt ./...

test:
	go test ./...

install:
	go install

get-geoip-db:
	curl -s http://167.88.160.44/~k0nsl/misc/GeoLite2-Country_20210309.tar.gz | gunzip > GeoLite2-Country.mmdb
