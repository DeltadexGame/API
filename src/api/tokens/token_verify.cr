# get_user returns a `user_id` for the user who
# owns a verified token
def get_user(request)
    begin
        token = request.params.json["token"].as(String)
        user_id = TOKENS.get_id_token token
        User.find(user_id)
    rescue
        nil
    end
end

# authenticated returns a True or False response if 
# the user in authenicated
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
