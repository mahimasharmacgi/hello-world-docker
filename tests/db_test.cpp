#define CATCH_CONFIG_MAIN
#include "../extern/catch.hpp"
#include <mysql/mysql.h>
#include <cstdlib>

TEST_CASE("MySQL connection works", "[database]") {
    MYSQL* conn = mysql_init(nullptr);
    REQUIRE(conn != nullptr);

    const char* host = std::getenv("DB_HOST");
    const char* user = std::getenv("DB_USER");
    const char* pass = std::getenv("DB_PASSWORD");
    const char* db   = std::getenv("DB_NAME");

    REQUIRE(mysql_real_connect(conn, host, user, pass, db, 3306, NULL, 0) != nullptr);

    mysql_close(conn);
}