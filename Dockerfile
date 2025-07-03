# Use a lightweight Linux base image
FROM ubuntu:22.04

# Install dependencies (if needed)
RUN apt-get update && apt-get install -y libstdc++6

# Copy executable to container
COPY hellodocker /app/hellodocker

# Set working directory
WORKDIR /app

# Run the app by default
CMD ["./hellodocker"]
