FROM gcc:13

# Install dependencies
RUN apt-get update && apt-get install -y \
    libmysqlclient-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy all files into container
COPY . .

# Download Catch2 header-only version using curl (for tests, optional)
RUN mkdir -p extern && \
    curl -L -o extern/catch.hpp https://raw.githubusercontent.com/catchorg/Catch2/devel/single_include/catch2/catch.hpp

# Compile the application using g++ and link to mysqlclient
RUN g++ main.cpp -o hellodocker -lmysqlclient

# Default command: run the compiled app
CMD ["./hellodocker"]
