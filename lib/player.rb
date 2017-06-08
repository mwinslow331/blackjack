require_relative 'hand'

class Player
  # attr_reader :deck
  attr_accessor :hand

  def initialize #(deck)
    # @deck = deck
    @hand = Hand.new
  end

  def report_score
    puts "Player score: #{@hand.total}"
  end

end
