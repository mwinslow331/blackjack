class Game
  attr_reader :deck, :player, :dealer
  # require 'pry'
  def initialize(deck, player, dealer)
    @deck = deck
    @player = player
    @dealer = dealer
  end

  def start
    puts "Player Card #{@dealer.deal_card(@player)}"
    puts "Dealer Card #{@dealer.deal_card(@dealer)}"
    puts "Player Card #{@dealer.deal_card(@player)}"
    puts "Dealer Card #{@dealer.deal_card(@dealer)}"
    report_score
    player_interaction_loop
    if is_game_over?
      report_winner
    else
      dealer_interaction_loop
      report_winner
    end
  end

  def report_winner
    puts "I win"
  end

  def report_score
    @player.report_score
    @dealer.report_score
  end

  def is_game_over?
    player_total = @player.hand.total
    dealer_total = @dealer.hand.total
    if player_total == 21 || dealer_total == 21
      puts "BlackJack"
      return true
    elsif player_total > 21 || dealer_total > 21
      puts "BUST"
      return true
    end
  end

  def player_interaction_loop
    input = @dealer.ask_player
    while input == "h"
      @dealer.deal_card(@player)
      report_score
      break if is_game_over?
      input = @dealer.ask_player
    end
  end

  def dealer_interaction_loop
    while @dealer.hit?(@player.hand.total)
      @dealer.deal_card(@dealer)
      break if is_game_over?
      report_score
      break if @dealer.hit?(@player.hand.total)
    end
  end
end
