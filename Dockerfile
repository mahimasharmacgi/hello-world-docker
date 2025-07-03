# Stage 1: Build the executable
FROM ubuntu:22.04 AS builder

# Install build tools (g++)
RUN apt-get update && apt-get install -y build-essential

WORKDIR /app

# Copy source code to container
COPY main.cpp .

# Compile your C++ code to an executable named hellodocker
RUN g++ main.cpp -o hellodocker


# Stage 2: Create smaller final image only with executable
FROM ubuntu:22.04

WORKDIR /app

# Copy the compiled executable from builder stage
COPY --from=builder /app/hellodocker .

# Run the executable when container starts
CMD ["./hellodocker"]
