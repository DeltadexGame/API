get "/" do 
	index
end

get "/auth"  do
	list_users
end

post "/auth/register" do |env|
	register(env)
end

post "/auth/login" do |env|
	login(env)
end