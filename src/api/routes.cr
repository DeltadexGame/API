get "/" do 
	index
end
  	
post "/auth/login" do |env|
	auth_login(env)
end
