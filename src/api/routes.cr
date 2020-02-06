get "/" do 
	index
end

# Auth
get "/auth"  do
	list_users
end

post "/auth/register" do |request|
	register(request)
end

post "/auth/login" do |request|
	login(request)
end

# Cards

# get "/cards" do
# 	list_cards
# end

# post "/cards/create" do |request|
# 	add_card(request)
# end