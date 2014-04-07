#!/bin/sh

export GOPATH=`pwd`/go

go get

go build exec.go

rm -fr ./go