def list_users(request)
    if authenticated request
        users = User.query.to_a
        {content: users}.to_json
    else
        request.response.status_code = 403
    end  
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

def get_user(request)
    begin
        token = request.params.json["token"].as(String)
        user_id = TOKENS.get_id_token token
        User.find(user_id)
    rescue
        nil
    end
end

def authenticated(request)
    begin
        token = request.params.json["token"].as(String)
        user_id = TOKENS.get_id_token token
        user = User.find(user_id)
        true
    rescue
        false
    end
end