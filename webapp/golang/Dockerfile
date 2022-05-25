FROM golang:1.18.1-bullseye

WORKDIR /app

RUN apt-get update && apt-get -y upgrade

COPY go.mod ./
COPY go.sum ./
RUN go mod download

CMD ["bash", "-c", "go build -o isucon ./... && ./isucon"]
