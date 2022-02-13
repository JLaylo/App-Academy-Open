class Card
  ALPHABET = ("A".."Z").to_a

  def self.shuffled_pairs(board_size)
    values = ALPHABET
    card_values = []
    num_cards = board_size ** 2

    2.times do
      card_values += values[0...num_cards/2]
    end

    card_values.shuffle!
  end

  def initialize(value, revealed = false)
    @value = value
    @face_up = revealed
  end

  def value
    if @face_up
      return @value
    else
      return " "
    end
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def face_up?
    @face_up
  end
end
