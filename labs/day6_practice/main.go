package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		hostname, err := os.Hostname()
		if err != nil {
			hostname = "unknown"
		}
		fmt.Fprintf(w, "Container Active!\nUTS Hostname: %s\nProcess PID: %d\n", hostname, os.Getpid())
	})

	http.HandleFunc("/healthz", func(w http.ResponseWriter, r *http.Request) {
		w.WriteHeader(http.StatusOK)
		w.Write([]byte("OK"))
	})

	port := ":8080"
	fmt.Printf("Server listening on port %s as PID %d...\n", port, os.Getpid())
	if err := http.ListenAndServe(port, nil); err != nil {
		fmt.Printf("Server error: %s\n", err)
		os.Exit(1)
	}
}
