def list_users
    users = User.query.to_a
    {content: users}.to_json
end

def register(env)
    username = env.params.json["username"].as(String)
    password = env.params.json["password"].as(String)
    user = User.new
    user.username = username
    user.encrypt_password(password)
    user.save
end

def login(env)
    username = env.params.json["username"].as(String)
    password = env.params.json["password"].as(String)
    env.response.content_type = "application/json"
    user = User.query.find({username: username})
    encrypt_password = user.encrypt(password)
    if user.password == encrypt_password
        {content: {username: user.username}}.to_json
    else
        halt env, status_code: 403, response: "Forbidden"
    end
end
