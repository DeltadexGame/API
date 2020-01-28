def auth_register(env)
    username = env.params.json["username"].as(String)
    first_name = env.params.json["first_name"].as(String)
    last_name = env.params.json["last_name"].as(String)
    password = env.params.json["password"].as(String)
    user = User.new
    user.username = username
    user.first_name = first_name
    user.last_name = last_name
    # user.password(password)
    user.save
end

def auth_login(env)
    username = env.params.json["username"].as(String)
    password = env.params.json["password"].as(String)
    # user : User? = User.query.find{ username == username }
    # if user
    #     env.response.content_type = "application/json"
    #     {content: {username: username, password: password}}.to_json
    # end
end
