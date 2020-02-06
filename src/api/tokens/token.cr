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

def generate_token
    token = Random::Secure.hex(32)
    token.to_s
end