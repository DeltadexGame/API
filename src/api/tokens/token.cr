# Token is a class that depicts a `token` object
# with two parameters.
# :token: a randomly generated HEX32 string
# :user_id: the id of the authenticated user
class Token
    @token : String

    def initialize(user_id : Int64)
        @user_id = user_id
        @token = generate_token
    end

    def user_id
        @user_id
    end

    def token
        @token
    end
end

# generate_token generates a random HEX32 string to be
# used in a `token` object
def generate_token
    token = Random::Secure.hex(32)
    token.to_s
end 
