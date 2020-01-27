def auth_login(env)
    username = env.params.json["username"].as(String)
    password = env.params.json["password"].as(String)
    env.response.content_type = "application/json"
    {content: {username: username, password: password}}.to_json
end
