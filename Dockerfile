# Given build
# I'm not going to make you all fight with compiling go
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod download
COPY . .
RUN go build -o server .

# Step 2: Run
FROM alpine:3.20
# TODO: 
# set WORKDIR to the /app directory
WORKDIR /app

# Copy compiled binary from builder stage to /app/server
COPY --from=builder /app/server /app/server

# Expose port 8080
EXPOSE 8080

# Run the server
CMD ["./server"]
