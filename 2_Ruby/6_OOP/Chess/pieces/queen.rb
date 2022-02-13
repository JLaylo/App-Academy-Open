require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable
    
    def symbol
        "Q"
    end

    private

    def move_dirs
        moves = []
        moves.concat(DIAGONAL_DIRS, HORIZONTAL_DIRS)
    end
 
end