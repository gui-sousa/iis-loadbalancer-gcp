package main

import (
	"fmt"
	"net/http"
)

var link = "34.95.251.121"

func main() {

	site := ("https://" + link)
	resposta, _ := http.Get(site)

	if resposta.StatusCode == 200 {
		fmt.Println("Acesso está OK! \n --- \n", resposta)
	} else {
		fmt.Println("Falha ao acessar: \n --- \n", resposta)
	}

}
