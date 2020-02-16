class User
    include Clear::Model
  
    column id : Int64, primary: true, presence: false
  
    column username : String
  
    column password : Crypto::Bcrypt::Password

    column user_type : Int64
  
    def encrypt_password(password : String)
      self.password = Crypto::Bcrypt::Password.create(password)
    end

    def validate
      if username_column.defined?
        add_error("username", "Must not be empty!") if username == ""
      end

      if password_column.defined?
        add_error("password", "Must not be empty!") if password.verify ""
        # add_error("password", "Must be above 8 charactors!") if password.verify < 8
      end
    end

end
