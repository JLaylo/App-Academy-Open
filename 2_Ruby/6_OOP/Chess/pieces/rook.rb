require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable
    
    def symbol
        "R"
    end

    private

    def move_dirs
        HORIZONTAL_DIRS
    end
 
end