class Score
    include Clear::Model
  
    column id : Int64, primary: true, presence: false
  
    column time : Time

    column game_id : String

    belongs_to winner : User
  
    belongs_to looser : User

    column user_type : Int64
end