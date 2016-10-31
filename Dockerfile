FROM golang:1.6

# Copy the local package files to the container's workspace.
ADD . /go

WORKDIR /go/src

ENTRYPOINT go run main.go 
