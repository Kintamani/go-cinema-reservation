FROM golang:1.23-alpine AS builder

WORKDIR /app

RUN go install github.com/air-verse/air@v1.60.0
RUN go install -tags 'postgres' github.com/golang-migrate/migrate/v4/cmd/migrate@latest

COPY . .
RUN go mod download

CMD [ "air", "-c", ".air.toml" ]