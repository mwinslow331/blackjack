class Card
  attr_reader :name, :suit, :real_value

  def initialize(name, suit)
    @name = name
    @suit = suit
    @real_value = calculate_real_value
  end

  def calculate_real_value
    if "JQK".include?(name.to_s)
      10
    elsif @name == "A"
      "A"
    else
      @name
    end

  end

end
