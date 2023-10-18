## We'll choose the incredibly lightweight
## Go alpine image to work with
FROM golang:1.21 AS builder

## We create an /app directory in which
## we'll put all of our project code
RUN mkdir /app
ADD . /app
WORKDIR /app
## We want to build our application's binary executable
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./...

## the lightweight scratch image we'll
## run our application within
FROM alpine:latest AS production
RUN apk --no-cache add ca-certificates
## We have to copy the output from our
## builder stage to our production stage
COPY --from=builder /app .
## we can then kick off our newly compiled
## binary exectuable!!
EXPOSE 8080
ENTRYPOINT ["./main"]

