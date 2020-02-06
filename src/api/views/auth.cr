def list_users
    users = User.query.to_a
    {content: users}.to_json
end

def register(request)
    username = request.params.json["username"].as(String)
    password = request.params.json["password"].as(String)
    user = User.new
    user.username = username
    user.encrypt_password(password)
    user.save
end

def login(request)
    username = request.params.json["username"].as(String)
    password = request.params.json["password"].as(String)
    request.response.content_type = "application/json"
    user = User.query.find!({username: username})
    if user.password == password
        token = TOKENS.create_token user.id
        {content: {username: user.username, token: token}}.to_json
    else
        request.response.status_code = 403
    end
end
