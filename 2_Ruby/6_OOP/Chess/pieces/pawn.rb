require_relative "piece.rb"

class Pawn < Piece
    def symbol
        "P"
    end

    def moves
        forward_steps + side_attacks
    end

    private

    def at_start_row?
        pos[0] == (color == :white) ? 6 : 1
    end

    def forward_dir
        color == :black ? 1 : -1
    end

    def forward_steps
        #can only move 2 spaces on first move
        i, j = pos
        one_step = [i + forward_dir, j]
        return [] unless board.valid_pos?(one_step) && board[one_step].empty?
    
        steps = [one_step]
        two_step = [i + 2 * forward_dir, j]
        steps << two_step if at_start_row? && board[two_step].empty?
        steps
    end

    def side_attacks
        #can only move diagonal if attacking
        i, j = pos

        side_moves = [[i + forward_dir, j - 1], [i + forward_dir, j + 1]]
    
        side_moves.select do |new_pos|
          next false unless board.valid_pos?(new_pos)
          next false if board[new_pos].empty?
    
          threatened_piece = board[new_pos]
          #if threatened_piece is not nil and opposite color then return true
          threatened_piece && threatened_piece.color != color
        end
    end
end