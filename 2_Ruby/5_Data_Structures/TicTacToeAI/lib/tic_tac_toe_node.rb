require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @prev_move_pos = prev_move_pos
    @board = board
    @next_mover_mark = next_mover_mark
  end

  def losing_node?(evaluator)
    if board.over? 
      return board.won? && board.winner != evaluator
    end
    
    if evaluator == next_mover_mark
      # player's turn
      self.children.all? { |node| node.losing_node?(evaluator) }
    else
      # opponent's turn
      self.children.any? { |node| node.losing_node?(evaluator) }
    end
  end

  def winning_node?(evaluator)
    if board.over?
      return board.winner == evaluator
    end

    if evaluator == next_mover_mark
      self.children.any? { |node| node.winning_node?(evaluator) }
    else
      self.children.all? { |node| node.winning_node?(evaluator) }
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    
    children_nodes = []

    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]

        if board.empty?(pos)
          board_dup = board.dup
          board_dup[pos] = next_mover_mark  
          child_mover_mark = (self.next_mover_mark == :x ? :o : :x)
          children_nodes << TicTacToeNode.new(board_dup, child_mover_mark, pos)
        end

      end
    end

    children_nodes
  end
end
