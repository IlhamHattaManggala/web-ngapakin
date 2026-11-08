# Multi-stage build untuk LarapakGo Web Ngapakin
FROM golang:1.24-alpine AS builder

WORKDIR /build
RUN apk add --no-cache git ca-certificates

# Clone repositori LarapakGo dan kompilasi binary mandiri
RUN git clone https://github.com/IlhamHattaManggala/LarapakGo.git .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o /usr/local/bin/larapak ./cmd/larapak

# Runtime stage ultra-ringan
FROM alpine:3.20

RUN apk add --no-cache ca-certificates tzdata

WORKDIR /app
COPY --from=builder /usr/local/bin/larapak /usr/local/bin/larapak
RUN ln -s /usr/local/bin/larapak /usr/local/bin/ngapakin

# Salin seluruh berkas proyek web-ngapakin
COPY . /app

EXPOSE 8000

ENV APP_ENV=production \
    APP_PORT=8000 \
    APP_DEBUG=salah \
    DB_CONNECTION=sqlite \
    DB_DATABASE=database.sqlite

CMD ["larapak", "serve", "8000"]

