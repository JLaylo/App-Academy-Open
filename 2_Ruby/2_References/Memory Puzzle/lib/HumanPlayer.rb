class HumanPlayer
  def initialize(size)
  end

  def get_input(guess_num)
    parse(STDIN.gets.chomp)
  end

  def prompt(message)
    puts message
    print "> "
  end

  def parse(string)
    string.split(",").map { |x| Integer(x) }
  end

  def receive_revealed_card(pos, value)
    # duck typing to match ComputerPlayer
  end

  def receive_match(pos1, pos2)
    # duck typing to match ComputerPlayer
  end
end
