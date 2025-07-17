FROM gcc:13

RUN apt-get update && apt-get install -y \
    libmysqlclient-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN mkdir -p extern && \
    curl -L -o extern/catch.hpp https://raw.githubusercontent.com/catchorg/Catch2/devel/single_include/catch2/catch.hpp

RUN g++ main.cpp -o hellodocker -I/usr/include/mysql -L/usr/lib/x86_64-linux-gnu -lmysqlclient

CMD ["./hellodocker"]
