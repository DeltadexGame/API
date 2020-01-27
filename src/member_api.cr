require "kemal"
require "dotenv"
require "pg"
require "clear"

require "./api/views/*"
require "./api/models/*"
require "./api/db/*"
require "./api/*"

Dotenv.load

Clear::SQL.init(
    "postgres://postgres@localhost/my_database", 
    connection_pool_size: 5,
)

# Run Kamel
Kemal.run
