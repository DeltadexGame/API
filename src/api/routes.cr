get "/" do 
	index
end

# Auth
post "/auth"  do |request|
	list_users(request)
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