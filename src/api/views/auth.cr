module Auth

    # Verify_tokens is an endpoint that is called using a
    # POST request to `/auth` with one parameter `token` which is
    # the token that you receive when you successfully login
    def verify_token(request)
        if authenticated request
            request.response.status_code = 200
        else
            request.response.status_code = 403
        end  
    end

    # Register is an endpoing called when sending a POST request to
    # `/auth/register` with two parameters `username` and `password`
    def register(request)
        username = request.params.json["username"].as(String)
        password = request.params.json["password"].as(String)
        user = User.new
        user.username = username
        user.encrypt_password(password)
        user.user_type = 1
        unless user.valid?
            request.response.status_code = 400
            errors = {} of String? => String
            user.errors.each do |err|
                errors[err.column] = err.reason
            end
            {errors: errors}.to_json
        else
            user.save
        end
    end

    # Login is an endpoint called when sending a POST request to
    # `/auth/login` with two parameters `username` and `password`
    def login(request)
        username = request.params.json["username"].as(String)
        password = request.params.json["password"].as(String)
        request.response.content_type = "application/json"

        begin
            user = User.query.find!({username: username})
            # Verify if password matchs esle return 403
            if user.password.verify password
                token = TOKENS.create_token user.id
                {content: {username: user.username, token: token}}.to_json
            else
                raise "403"
            end
        rescue
            request.response.status_code = 403
        end

    end

end