FROM golang:1.14.6-alpine3.12 AS build

#LABEL MAINTAINER="Nícolas Aigner (nicolas.aigner@gmail.com)"

WORKDIR /go/src/app

COPY . .

RUN CGO_ENABLED=0 go build -o /app app.go

FROM scratch

COPY --from=build /app /app

CMD ["/app"]
