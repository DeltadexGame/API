# Libs

require "kemal"
require "pg"
require "clear"

# Local

require "./api/views/*"
require "./api/models/*"
require "./api/db/*"
require "./api/tokens/*"
require "./api/*"

# Dotenv.load

TOKENS = TokenStore.new

# Database Details

DB_USER = "postgres"
DB_PASS = "password"
DB_HOST = "localhost"
DB_NAME = "member_api"

# Postgres

PG_PATH = "postgres://#{DB_USER}:#{DB_PASS}@#{DB_HOST}"

# DB connection

Clear::SQL.init(
    "#{PG_PATH}/#{DB_NAME}",
    connection_pool_size: 5,
)

# Run Kamel

Kemal.run
