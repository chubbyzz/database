FROM golang:1.21-alpine

# Install dependencies
RUN apk add --no-cache git

# Install goose
RUN go install github.com/pressly/goose/v3/cmd/goose@latest

# Create app directory
WORKDIR /app

# Copy go mod files first (for better caching)
COPY go.mod go.sum ./
RUN go mod download

# Copy the rest of the project
COPY . .

# Expose goose in PATH
ENV PATH="/go/bin:${PATH}"

# Default command (override if needed)
CMD ["/bin/sh"]