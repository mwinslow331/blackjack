class Hand
  attr_accessor :cards, :total
  # require 'pry'
  def initialize
    @cards = []
    @total = 0
  end

  def calculate_hand
    # binding.pry
    new_total = 0
    has_ace = false
    # binding.pry
    @cards.each do |card|
      # binding.pry
      if card[0].name != "A"
        new_total += card[0].real_value
      else
        has_ace = true
      end
    end
    if has_ace == true
    @cards.each do |card|
        # binding.pry
        if card[0].name == "A"
          if new_total < 11
            new_total += 11
          else
            # binding.pry
            new_total += 1
          end
        end
      end
    end
    @total = new_total
  end
end
