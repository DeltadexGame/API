class User
    include Clear::Model
  
    column id : Int64, primary: true
  
    column username : String
  
    column first_name : String?
    column last_name : String?
  
    column encrypted_password : Crypto::Bcrypt::Password
  
    def password=(x)
      self.encrypted_password = Crypto::Bcrypt::Password.create(password)
    end
end
