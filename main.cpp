#include <iostream>
#include <mysql/mysql.h>
#include <cstdlib>
using namespace std;
int main()
{
 MYSQL* conn;
    conn = mysql_init(nullptr);

    const char* host = std::getenv("DB_HOST");
    const char* user = std::getenv("DB_USER");
    const char* pass = std::getenv("DB_PASSWORD");
    const char* db   = std::getenv("DB_NAME");

    if (!mysql_real_connect(conn, host, user, pass, db, 3306, NULL, 0)) {
        std::cerr << "Connection failed: " << mysql_error(conn) << std::endl;
        return 1;
    }

    std::cout << "Connected to MySQL successfully!" << std::endl;
    mysql_close(conn);
    return 0;
}