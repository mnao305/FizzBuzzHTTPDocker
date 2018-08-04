FROM golang
WORKDIR /go/src/github.com/mnao305/FizzBuzzHTTP
COPY ./FizzBuzzHTTP/main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o fizzbuzzhttp main.go

FROM alpine
WORKDIR /fizzbuzz
COPY --from=0 /go/src/github.com/mnao305/FizzBuzzHTTP/fizzbuzzhttp .
EXPOSE 8080
ENTRYPOINT ["./fizzbuzzhttp"]