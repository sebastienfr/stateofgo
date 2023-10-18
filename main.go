package main

import (
	"fmt"
	"log/slog"
	"net/http"
	_ "net/http/pprof"
	"os"
)

func main() {
	fmt.Println("Hello 🌍")

	http.HandleFunc("/", hello)

	err := http.ListenAndServe(":8080", nil)

	if err != nil {
		slog.Error("Error starting web server on port :8080", "error", err)
		os.Exit(-1)
	}
}

func hello(writer http.ResponseWriter, request *http.Request) {
	_, err := fmt.Fprintf(writer, "Hello 🌍")
	if err != nil {
		slog.Error("Error greetings", "error", err)
		return
	}
}
