require "pg"

DB_NAME = "member_api"
PG_PATH = "postgres://postgres:password@localhost"

# Creates connection with the default postgres db
conn = PG.connect("#{PG_PATH}/postgres")

# Creates the member_api database with UTF8 encoding and close the connection
puts "Creating database: #{DB_NAME}..."
conn.exec("DROP DATABASE IF EXISTS #{DB_NAME};")
conn.exec("CREATE DATABASE #{DB_NAME} ENCODING 'UTF8';")
conn.close

# Creates connection with the newly created db
puts "Connecting database: #{DB_NAME}..."
conn = PG.connect("#{PG_PATH}/#{DB_NAME}")

# Creates the users table in the newly created database
puts "Creating users table in #{DB_NAME}..."
conn.exec(%{
    CREATE TABLE users (
        id                   SERIAL PRIMARY KEY,
        username             TEXT NOT NULL,
        password   TEXT NOT NULL
    );
})
puts "Process finished succesfully"

puts "Closing connection..."
conn.close
