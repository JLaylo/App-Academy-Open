require_relative "./tile.rb"

class Board
    def self.from_file(file)
        board_file = File.open(file)
        grid = self.parse(board_file)
        self.new(grid)
    end

    def self.parse(file)
        file_data = file.readlines.map(&:chomp)
        grid = Array.new(9) { Array.new(9) }

        (0..8).each do |row|
            (0..8).each do |col|
                value = file_data[row][col].to_i
                tile = Tile.new(value)
                grid[row][col] = tile
            end
        end

        grid
    end

    attr_reader :grid

    def initialize(grid)
        @grid = grid
    end

    def position(pos, val)
        board[pos].value = val
    end

    def render
        system "clear"
        puts "  #{(0..8).to_a.join(" ")}"

        grid.each_with_index { |row, i| puts "#{i} #{row.join(" ")}" }
    end

    def [](pos)
        row, col = pos
        self.grid[row][col]
    end

    def []=(pos, val)
        self[pos].value = val
    end

    def solved?
        self.squares_solved? &&
            self.cols_solved? &&
            self.rows_solved?
    end

    def rows_solved?
        self.grid.all? { |row| good_set?(row) }
    end

    def cols_solved?
        grid_transpose = self.grid.transpose
        grid_transpose.all? { |col| good_set?(col) }
    end

    def squares_solved?
        solved = true

        (1..3).each do |square_y|
            (1..3).each do |square_x|
                ix = (square_x * 3) - 3
                iy = (square_y * 3) - 3
                solved = false if !good_square?(iy, ix)
            end
        end

        solved
    end

    def good_square?(iy, ix)
        square_vals = []
        (iy...iy+3).each do |row|
            (ix...ix+3).each do |col|
                square_vals << self[[row,col]]
            end
        end

        good_set?(square_vals)
    end

    def good_set?(arr)
        nums = arr.map { |el| el.value }
        nums.sort == (1..9).to_a
    end
end