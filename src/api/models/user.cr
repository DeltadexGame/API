class User
    include Clear::Model
  
    column id : Int64, primary: true, presence: false
  
    column username : String
  
    column password : Crypto::Bcrypt::Password
  
    def encrypt_password(password : String)
      self.password = self.encrypt(password)
    end

    def encrypt(x : String)
      encrypt = Crypto::Bcrypt::Password.create(x)
      return encrypt
    end

end
