# Stage 1: Build the Go binary
FROM golang:1.22.3-alpine AS builder

# Set the working directory inside the builder container
WORKDIR /app

# Copy the source code to the container
COPY main.go .

# Build the Go binary
RUN CGO_ENABLED=0 GOOS=linux go build -o main main.go

# Stage 2: Create the final image
FROM alpine:latest

# Install necessary packages
RUN apk --no-cache add ca-certificates

# Set the working directory inside the final container
WORKDIR /root/

# Copy the built binary from the builder stage
COPY --from=builder /app/main .

# Ensure the binary is executable
RUN chmod +x ./main

# Expose the port the application runs on
EXPOSE 80

# Command to run the executable
CMD ["./main"]

