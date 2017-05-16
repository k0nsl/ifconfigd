# ifconfig.co: Simple IP address lookup service

[![Build Status](https://travis-ci.org/martinp/ifconfigd.svg)](https://travis-ci.org/martinp/ifconfigd)

A simple service for looking up your IP address. This is the code that powers
http://ifconfig.co

## Usage

Just the business, please:

```
$ curl ifconfig.co
127.0.0.1

$ wget -qO - ifconfig.co
127.0.0.1

$ fetch -qo - ifconfig.co
127.0.0.1
```

A specific header:

```
$ curl ifconfig.co/user-agent
curl/7.43.0

$ curl ifconfig.co/x-ifconfig-country
Norway
```

As JSON:

```
$ curl -H 'Accept: application/json' ifconfig.co
{
  "x-ifconfig-ip": "127.0.0.1"
}

$ curl ifconfig.co/x-config-ip.json
{
  "x-ifconfig-ip": "127.0.0.1"
}
```

Pass the appropriate flag (usually -4 and -6) to your tool to switch between
IPv4 and IPv6 lookup.

The subdomain http://v4.ifconfig.co can be used to force IPv4 lookup.

## Features

* Easy to remember domain name
* Supports IPv4 and IPv6
* Open source
* Fast
* Supports typical CLI tools (curl, wget and fetch)
* JSON output (optional)
* Country lookup for IP address through the MaxMind GeoIP2 database

## Why?

* To scratch an itch
* An excuse to use Go for something
* Faster than ifconfig.me and has IPv6 support

## Building

Compiling requires the [Golang compiler](https://golang.org/) to be installed.
This application can be installed by using `go get`:

`go get github.com/martinp/ifconfigd`

### Usage

```
ifconfigd -h
Usage:
  ifconfigd [OPTIONS]

Application Options:
  -f, --file=FILE      Path to GeoIP database
  -l, --listen=ADDR    Listening address (:8080)
  -x, --cors           Allow requests from other domains (false)
  -t, --template=      Path to template (index.html)

Help Options:
  -h, --help           Show this help message
```

### Installation and Example Usage
When you have built the package, copy the binary to `/usr/bin`. For example `cp /root/go/bin/ifconfigd /usr/bin/ifconfigd` or create a symlink.

Then run the application by issuing the following command (assuming paths are correct):
```
ifconfigd -t /home/k0nsl/ifconfigd/template.html -H X-Real-IP -c /home/k0nsl/geolite/GeoLite2-City.mmdb -f /home/k0nsl/geolite/GeoLite2-Country.mmdb
```
I run this on Alpine Linux and my copy can be found by visiting https://ifconfig.k0nsl.org (it looks horrible at the moment -- be warned)
