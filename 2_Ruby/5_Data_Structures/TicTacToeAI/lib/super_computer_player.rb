require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    root_node = TicTacToeNode.new(game.board, mark)

    possible_moves = root_node.children.shuffle

    possible_moves.each do |child_node|
      return child_node.previous_move_pos if child_node.winning_node?(mark)
    end

    possible_moves.each do |child_node|
      return child_node.prev_move_pos if child_node.losing_node?(mark) == false
    end

    raise "no non-losing nodes"
  end 
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
