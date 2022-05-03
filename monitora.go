package main

import (
	"fmt"
	"net/http"
)

func main() {

	site := "https://www.bwg.com.br"
	resp, _ := http.Get(site)

	fmt.Println(resp)

}
