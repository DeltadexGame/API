class Cards
    include Clear::Model
  
    column id : Int64, primary: true
  
    column name : String
  
    column healt : Int?
    column attack : Int?
    column ability : String?

end
