require_relative 'checking_card'

class Card
  include CheckingCard
end

card1 = Card.new("4408 0412 3456 7893")

card2 = Card.new("4417 1234 5678 9112")

card1.set_type_if_card_valid
