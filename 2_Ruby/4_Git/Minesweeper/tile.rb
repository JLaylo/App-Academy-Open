class Tile
    attr_reader :pos

    def initialize(bombed, pos, board)
        @bombed = bombed
        @flagged = false
        @value = 0
        @revealed = false
        @pos = pos
        @board = board
    end

    def value
        if @revealed
            if @bombed
                return "X"
            elsif @value == 0
                return " "
            else
                return @value
            end
        elsif @flagged
            return "F"
        else
            return "*"
        end
    end
    
    def reveal
        if @flagged == false && @revealed == false
            @revealed = true
            @value = neighbour_bomb_count

            # recursion
            if @value == 0 && !@bombed
                self.neighbours.each do |neighbour|
                    @board[neighbour].reveal
                end
            end
        end
    end

    def flag
        if !@revealed
            if !@flagged
                @flagged = true
            else
                @flagged = false
            end
        end 
    end

    def bombed?
        @bombed
    end

    def revealed?
        @revealed
    end

    def neighbours
        neighbours = []
        (pos[0]-1..pos[0]+1).each do |row|
            (pos[1]-1..pos[1]+1).each do |col|
                if [row,col] != pos && inside_board?([row,col])
                    neighbours << [row,col]
                end
            end
        end
        neighbours
    end

    def inside_board?(new_pos)
        new_pos[0].between?(0,8) &&
        new_pos[1].between?(0,8)
    end

    def neighbour_bomb_count
        bomb_count = 0
        self.neighbours.each do |neighbour|
            bomb_count += 1 if @board[neighbour].bombed?
        end
        bomb_count
    end
end