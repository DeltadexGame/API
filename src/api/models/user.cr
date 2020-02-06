class User
    include Clear::Model
  
    column id : Int64, primary: true, presence: false
  
    column username : String
  
    column password : Crypto::Bcrypt::Password
  
    def encrypt_password(password : String)
      self.password = Crypto::Bcrypt::Password.create(password)
    end

end
