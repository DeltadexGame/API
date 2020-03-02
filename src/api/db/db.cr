require "pg"

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
        id                   BIGSERIAL PRIMARY KEY,
        username             TEXT NOT NULL,
        password             TEXT NOT NULL,
        user_type            SERIAL NOT NULL
    );
})

conn.exec(%{
    CREATE TABLE dexs (
        id                   BIGSERIAL PRIMARY KEY,
        user_id              BIGINT NOT NULL,
        card_1               BIGINT,
        card_2               BIGINT,
        card_3               BIGINT,
        card_4               BIGINT,
        card_5               BIGINT,
        card_6               BIGINT,
        card_7               BIGINT,
        card_8               BIGINT,
        card_9               BIGINT,
        card_10              BIGINT,
        card_11              BIGINT,
        card_12              BIGINT,
        card_13              BIGINT,
        card_14              BIGINT,
        card_15              BIGINT,
        card_16              BIGINT,
        card_17              BIGINT,
        card_18              BIGINT,
        card_19              BIGINT,
        card_20              BIGINT,
        card_21              BIGINT,
        card_22              BIGINT,
        card_23              BIGINT,
        card_24              BIGINT,
        card_25              BIGINT,
        card_26              BIGINT,
        card_27              BIGINT,
        card_28              BIGINT,
        card_29              BIGINT,
        card_30              BIGINT
    );
})

conn.exec(%{
    CREATE TABLE scores (
        id                   BIGSERIAL PRIMARY KEY,
        time                 TIMESTAMP NOT NULL,
        game_id              TEXT NOT NULL,
        winner               BIGINT NOT NULL,
        looser               BIGINT NOT NULL
    );
})

puts "Process finished succesfully"

puts "Closing connection..."
conn.close
