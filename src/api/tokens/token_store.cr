# TokenStore acts like an object shelf for storing
# objects, it has one parameter
# :tokens: a hashmap of tokens
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
        token_object = @tokens[token]
        token_object.user_id
    end

end