package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
)

var port = os.Args[1]
var addr = ":" + port
var scheme = ""

func main() {

	//// allow serving via https from cli ("sec")
	if len(os.Args) > 2 {
		scheme = os.Args[2]
	}

	//// if port ends with 443 serve via https
	if strings.HasSuffix(addr, "443") {
		scheme = "sec"
	}

	http.HandleFunc("/", respondJSON)
	fmt.Println(addr)

	var err error
	if scheme == "sec" {
		// err = http.ListenAndServeTLS(addr, "cert/server/server.crt", "cert/server/server.key", nil)
		err = http.ListenAndServeTLS(addr, "/etc/pki/tls/certs/domainTestServer.crt", "/etc/pki/tls/private/domainTestServer.key", nil)
	} else {
		err = http.ListenAndServe(addr, nil)
	}

	if err != nil {
		log.Fatal("ListenAndServe: ", err)
		fmt.Println(err)
	}
}

func respondJSON(w http.ResponseWriter, r *http.Request) {
	data := struct {
		Port string `json:"port"`
		Host string `json:"host"`
		Uri  string `json:"uri"`
		// Header http.Header `json:"header"`
		// URL  *url.URL `json:"url"`
	}{
		Port: port,
		Host: r.Host,
		Uri:  r.URL.RequestURI(),
		// Header: r.Header,
		// URL:  r.URL,
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(data)
	log.Printf("%+v", data)
}
