require_relative "./board.rb"

class Sudoku
    attr_reader :board

    def initialize(board)
        @board = board
        self.play
    end

    def play
        until board.solved?
            board.render
            pos = self.get_pos
            val = self.get_val
            board[pos] = val
        end

        puts "YOU WIN!"
    end

    def get_pos
        print "Please enter a position on the board (e.g., '3,4')"
        puts
        print "> "

        pos = nil
        until pos && valid_pos?(pos)
            pos = parse_pos(gets.chomp)
        end
        pos
    end

    def parse_pos(user_input)
        pos = user_input.split(",").map(&:to_i)
    end

    def valid_pos?(pos)
        pos.is_a?(Array) && pos.count == 2 &&
            pos.all? { |n| n.between?(0,8) }
    end

    def get_val
        print "Please enter a value for the tile (1-9)"
        puts
        print "> "

        val = nil
        until val && val.between?(1,9)
            val = gets.chomp.to_i
        end
        val
    end
end

board = Board.from_file("../data/sudoku2.txt")
sudoku = Sudoku.new(board)