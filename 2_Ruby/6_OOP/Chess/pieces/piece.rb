class Piece
    attr_reader :color, :pos
    attr_accessor :board
    
    def initialize(color, board, pos)
        raise 'invalid color' unless %i(white black).include?(color)
        raise 'invalid pos' unless board.valid_pos?(pos)
        
        @color = color
        @board = board
        @pos = pos
    end

    def pos=(val)
        @pos = val
    end

    def empty?
        false
        #null == true
    end

    def valid_moves
        moves.select { |move| !move_into_check?(move) }
    end

    def symbol
        # subclass implements this with unicode chess char
        raise NotImplementedError
      end

    private

    def move_into_check?(end_pos)
        board_dup = board.dup
        board_dup.move_piece!(color, pos, end_pos)
        board_dup.in_check?(color)
    end

end