require_relative "tile.rb"

class Board
    attr_reader :grid

    def initialize(size)
        @grid = Array.new(size) { Array.new(size) }
        @size = size
        self.populate(grid)
    end

    def populate(grid)
        bombs = []
        until bombs.count == 10
            pos = [rand(0..8), rand(0..8)]
            bombs << pos if !bombs.include?(pos)
        end

        # seed grid with bombs
        (0..8).each do |row|
            (0..8).each do |col|
                pos = [row,col]
                if bombs.include?(pos)
                    grid[row][col] = Tile.new(true, pos, self)
                else
                    grid[row][col] = Tile.new(false, pos, self)
                end
            end
        end
    end

    def render
        system "clear"

        puts "  #{(0..8).to_a.join(" ")}"
        grid.each_with_index do |row, i|
            print "#{i}"
            row.each do |tile|
                print " #{tile.value}"
            end
            puts
        end
    end

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        grid[row][col] = val
    end

    def solved?
        grid.all? do |row|
            row.all? { |tile| tile.revealed? || tile.bombed? }
        end
    end
end
