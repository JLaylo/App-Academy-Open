class Board
    attr_reader :size
    
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N) }
        @size = n * n
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def num_ships
        # num = 0
        # (0...@grid.length).each do |row|
        #     (0...@grid.length).each do |col|
        #         pos = [row,col]
        #         num += 1 if self[pos] == :S
        #     end
        # end
        # num

        @grid.flatten.count { |el| el == :S }
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts "you sunk my battleship!"
            return true
        else
            self[pos] = :X
            return false
        end
    end

    def place_random_ships
        num_to_place = self.size / 4

        while self.num_ships < num_to_place
            pos = [rand(0...@grid.length), rand(0...@grid.length)]
            if self[pos] != :S
                self[pos] = :S
            end
        end
    end

    def hidden_ships_grid
        @grid.map do |row|
            row.map do |el|
                if el == :S
                    :N
                else
                    el
                end
            end
        end
    end

    def self.print_grid(grid)
        grid.each do |row|
            puts row.join(" ")
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
