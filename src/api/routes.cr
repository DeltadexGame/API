include Index
include Auth

##-------------## Index ##-------------##

# Index page for API
get "/" do 
	index
end

##-------------## Auth ##-------------##

# Token Verify Endpoint
post "/auth"  do |request|
	verify_token(request)
end

# User Register
post "/auth/register" do |request|
	register(request)
end

# User Login
post "/auth/login" do |request|
	login(request)
end

##-------------## Statistics ##-------------##
