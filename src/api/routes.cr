get "/" do 
	index
end
  	
post "/auth/login" do |env|
	auth_login(env)
end

post "/auth/register" do |env|
	auth_register(env)
end