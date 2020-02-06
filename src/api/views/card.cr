def list_cards
    cards = Card.query.to_a
    {content: cards}.to_json
end

# def add_card(request)
#     name = request.params.json["name"].as(String)
#     health = request.params.json["health"].as(Int32)
#     attack = request.params.json["attack"].as(Int32)
#     ability = request.params.json["ability"].as(String)
#     card = Card.new
#     card.name = name
#     card.health = health
#     card.attack = attack
#     card.ability = ability
#     card.save
# end

# def delete_card(request)
#     name = request.params.json["name"].as(String)
#     card = Card.query.find!({name: name})
#     card.delete
# end
