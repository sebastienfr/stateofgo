# Share State of Go 2023

## Build
    GOOS=windows GOARCH=amd64 go build main.go
    docker build -f Dockerfile -t sebastienfr/helllogo:latest .

## Run
    ./main
    docker run -p8080:8080 sebastienfr/helllogo:latest

## Clean
    go clean
    docker image prune -a

## Deploy
    gcloud run deploy

## Monitor
    // get profiles
    open http://localhost:8080/debug/pprof

    // get profiles par tools
    go tool pprof -png http://localhost:8080/debug/pprof/heap > out.png
    go tool pprof -raw -output=cpu.txt http://localhost:8080/debug/pprof/profile?seconds=20
    
    // launch laod test
    ab -k -c 35 -n 200000 http://127.0.0.1:8080/
