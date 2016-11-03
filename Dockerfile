FROM golang:1.7

# Copy the local package files to the container's workspace.
ADD . /go

RUN go get github.com/tools/godep

WORKDIR /go/src/vishnu

RUN /go/bin/godep restore

EXPOSE 8080

ENTRYPOINT go run main.go 
