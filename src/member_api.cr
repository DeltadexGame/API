require "kemal"
# require "dotenv"
require "pg"
require "clear"

require "./api/views/*"
require "./api/models/*"
require "./api/db/*"
require "./api/tokens/*"
require "./api/*"

# Dotenv.load

TOKENS = TokenStore.new

Clear::SQL.init(
    "postgres://postgres:password@localhost/member_api",
    connection_pool_size: 5,
)

# Run Kamel
Kemal.run
