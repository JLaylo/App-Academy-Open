class Board
  attr_accessor :cups
  attr_reader :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups = Array.new(14) { Array.new(4, :stone) }
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    if cups[start_pos-1] == []
      raise "Starting cup is empty"
    elsif !start_pos.between?(0,12)
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    stone_cnt = @cups[start_pos].length
    @cups[start_pos] = []
    idx = start_pos

    until stone_cnt == 0
      idx += 1
      idx = 0 if idx == 14

      if current_player_name == name1
        if idx != 13
          @cups[idx] += [:stone]
          stone_cnt -= 1
        end
      else
        if idx != 6
          @cups[idx] += [:stone]
          stone_cnt -= 1
        end
      end
    end
    
    render
    next_turn(idx, current_player_name)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if current_player_name == name1 && ending_cup_idx == 6
    return :prompt if current_player_name == name2 && ending_cup_idx == 13
    return :switch if cups[ending_cup_idx].length == 1
    return ending_cup_idx if cups[ending_cup_idx].length > 1
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? { |cup| cup.empty? } || cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    return :draw if cups[13].length == cups[6].length
    cups[6].length > cups[13].length ? name1 : name2
  end
end
