class Card
    include Clear::Model
  
    column id : Int64, primary: true
  
    column name : String
  
    column health : Int64?
    column attack : Int64?
    column ability : String?

end
