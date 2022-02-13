class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = Array.new
  end

  def play
    until @game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if game_over == false
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    system("clear")
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the sequence by entering the first letter of each color on a new line"
    @seq.each do |color|
      user_color = gets.chomp
      if user_color != color[0]
        @game_over = true
        break
      end
    end
    sleep 0.5
  end

  def add_random_color
    rand_num = Random.new
    @seq << COLORS[rand_num.rand(0...4)]
  end

  def round_success_message
    puts "success"
    sleep 0.5
  end

  def game_over_message
    puts "Game over! You made it #{@sequence_length - 1} rounds"
  end

  def reset_game
    @sequence_length = 1
    @game_over =  false
    @seq = []
  end
end

simon_game = Simon.new
simon_game.play
