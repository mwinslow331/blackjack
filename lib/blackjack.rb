require_relative "card"
require_relative "deck"
require_relative "hand"
require_relative "player"
require_relative "dealer"
require_relative "game"

deck = Deck.new
player = Player.new #(deck)
dealer = Dealer.new(deck)
game = Game.new(deck, player, dealer)

game.start
