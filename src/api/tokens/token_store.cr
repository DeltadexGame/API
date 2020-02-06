class TokenStore

    def initialize
        @tokens = {} of String => Token
    end

    def create_token(user_id : Int64)
        new_token = Token.new user_id
        token = new_token.token
        @tokens[token] = new_token
        token
    end

    def get_id_token(token : String)
        token_object = @token[token]
        token.object.user_id
    end

end