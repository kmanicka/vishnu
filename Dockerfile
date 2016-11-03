FROM golang:1.7

# Copy the local package files to the container's workspace.
ADD . /go

WORKDIR /go/src/vishnu

EXPOSE 8080

ENTRYPOINT go run main.go 
