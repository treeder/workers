package main

import (
	"fmt"
	"launchpad.net/goamz/aws"
)

func main() {

	fmt.Printf("%v\n", "foo bar")

	_, err := aws.EnvAuth()

	if err != nil {
		panic(err.Error())
	}

}
