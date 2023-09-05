FROM golang:bullseye as builder

WORKDIR /src/app

COPY . .

RUN go build -o app.bin

FROM scratch

WORKDIR /src/app

COPY --from=builder /src/app/app.bin .

CMD [ "./app.bin" ]