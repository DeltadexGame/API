require "kemal"
require "dotenv"
require "pg"


require "./api/views/*"
require "./api/models/*"
require "./api/db/*"
require "./api/*"

	
Dotenv.load

# Run Kamel
Kemal.run
