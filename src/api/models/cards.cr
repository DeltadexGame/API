class Cards
    include Clear::Model
  
    column id : Int64, primary: true
  
    column name : String
  
    column healt : Int64?
    column attack : Int64?
    column ability : String?

end
