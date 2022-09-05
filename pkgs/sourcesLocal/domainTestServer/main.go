package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
)

var port = os.Args[1]
var addr = ":" + port

func main() {
	http.HandleFunc("/", respondJSON)
	fmt.Println(addr)
	err := http.ListenAndServe(addr, nil)
	if err != nil {
		log.Fatal("ListenAndServe: ", err)
		fmt.Println(err)
	}
}

func respondJSON(w http.ResponseWriter, r *http.Request) {
	data := struct {
		Port   string      `json:"port"`
		Host   string      `json:"host"`
		Uri    string      `json:"uri"`
		Header http.Header `json:"header"`
		// URL  *url.URL `json:"url"`
	}{
		Port:   port,
		Host:   r.Host,
		Uri:    r.URL.RequestURI(),
		Header: r.Header,
		// URL:  r.URL,
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusCreated)
	json.NewEncoder(w).Encode(data)
}
