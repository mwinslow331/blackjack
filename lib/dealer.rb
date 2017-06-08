require_relative 'hand'

class Dealer
  attr_reader :deck
  attr_accessor :hand

  def initialize(deck)
    @deck = deck
    @hand = Hand.new
  end

  def deal_card(person)
    card = @deck.collection.pop(1)
    person.hand.cards.push(card)
    "card: #{card[0].name}#{card[0].suit} #{person.hand.calculate_hand}"
  end

  def report_score
    puts "Dealer score: #{@hand.total}"
  end

  def ask_player
    puts "Hit or Stay (h/s)?"
    gets.chomp
  end

  def hit?(player_score)
    if @hand.total < 17
      true
    else
      false
    end

  end

end
