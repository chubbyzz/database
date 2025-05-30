FROM golang:1.23-alpine

# Install dependencies
RUN apk add --no-cache git postgresql-client

# Install goose
RUN go install github.com/pressly/goose/v3/cmd/goose@latest

# Create app directory
WORKDIR /app

# print current working directory

# Copy go mod files first (for better caching)
COPY ./database ./
RUN go mod download

# Expose goose in PATH
ENV PATH="/go/bin:${PATH}"

CMD ["tail", "-f", "/dev/null"]