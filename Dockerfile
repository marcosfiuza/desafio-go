FROM golang:alpine AS builder
RUN mkdir /hello-world && cd /hello-world
WORKDIR /hello-world
COPY ./hello-world.go .
RUN go build hello-world.go


FROM scratch
COPY --from=builder /hello-world/hello-world /usr/bin/hello-world
ENTRYPOINT ["/usr/bin/hello-world"]
