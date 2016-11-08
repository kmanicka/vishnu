FROM golang:1.7

# Copy the local package files to the container's workspace.
ADD . /go

RUN go get github.com/tools/godep

WORKDIR /go/src/vishnu

RUN /go/bin/godep restore

EXPOSE 8080

# TODO make this configurable later.
ENV KUBERNETES_NAMESPACE kman

ENTRYPOINT go run main.go 
