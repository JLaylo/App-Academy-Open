require_relative "pieces.rb"

class Board
    attr_reader :rows

    def initialize(fill_board = true)
        @null_piece = NullPiece.instance
        @rows = Array.new(8) { Array.new(8, @null_piece) }
        make_starting_grid if fill_board
    end

    def [](pos)
        raise 'invalid pos' unless valid_pos?(pos)

        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        raise 'invalid pos' unless valid_pos?(pos)

        row, col = pos
        @rows[row][col] = val
    end

    def move_piece(color, start_pos, end_pos)
        piece = self[start_pos]

        raise "No piece at start pos!" if self[start_pos].empty?

        if self[end_pos].empty? == false && self[end_pos].color == color
            raise "Piece cannot move to end pos!"
        end

        if piece.valid_moves.include?(end_pos)
            self[start_pos] = @null_piece
            piece.pos = end_pos
            self[end_pos] = piece
        else
            raise "Not valid move!"
        end
    end

    # moves piece without checking move is valid
    def move_piece!(color, start_pos, end_pos)
        piece = self[start_pos]

        raise "No piece at start pos!" if self[start_pos].empty?
        raise "Piece cannot move to end pos!" unless piece.moves.include?(end_pos)

        self[start_pos] = @null_piece
        piece.pos = end_pos
        self[end_pos] = piece
    end

    def valid_pos?(pos)
        pos[0].between?(0,7) && pos[1].between?(0,7)
    end

    def in_check?(color)
        king_pos = find_king(color)
        pieces.each do |piece|
            return true if piece.color != color && piece.moves.include?(king_pos)
        end
        false
    end

    def find_king(color)
        pieces.each do |piece|
            return piece.pos if piece.color == color && piece.is_a?(King)
        end
    end

    def pieces
        @rows.flatten.reject(&:empty?)
    end

    def dup
        board_dup = Board.new(false)

        @rows.each_with_index do |row, i|
            row.each_with_index do |piece, j|
                #copy each piece and update ref
                curr_pos = [i,j]

                if piece.is_a?(NullPiece) then
                    board_dup[curr_pos] = @null_piece
                else
                    board_dup[curr_pos] = piece.dup
                    board_dup[curr_pos].pos = curr_pos
                    board_dup[curr_pos].board = board_dup
                end
            end
        end

        # pieces.each do |piece|
        #     piece.class.new(piece.color, board_dup, piece.pos)
        # end

        board_dup
    end

    def checkmate?(color)
        return false unless in_check?(color)

        pieces.select { |p| p.color == color }.all? do |piece|
            piece.valid_moves.empty?
        end
    end

    private

    attr_reader :null_piece

    def fill_back_row(color)
        back_pieces = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        
        i = color == :white ? 7 : 0
        back_pieces.each_with_index do |piece_class, j|
            self[[i,j]] = piece_class.new(color, self, [i,j])
        end
    end

    def fill_pawns_row(color)
        i = color == :white ? 6 : 1
        8.times { |j| self[[i,j]] = Pawn.new(color, self, [i,j]) }
    end

    def make_starting_grid
        %i(white black).each do |color|
            fill_pawns_row(color)
            fill_back_row(color)
        end
    end
end
