require_relative "./Card.rb"

class Board
    attr_reader :size

    def initialize(size)
        # assume size is even number
        @size = size
        @grid = Array.new(size) { Array.new(size) }
    end

    def populate
        card_values = Card.shuffled_pairs(@size)

        # assign values to cards and set to grid
        (0...@size).each do |row|
            (0...@size).each do |col|
                card = Card.new(card_values.pop)
                self[[row,col]] = card
            end
        end
    end

    def render
        system("clear")

        print " "
        (0...@size).each { |num| print num }
        puts

        (0...@size).each do |row|
            print row
            @grid[row].each do |card|
                print card.value         
            end
            puts
        end
    end

    def won?
        @grid.flatten.all? { |card| card.face_up? == true }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end

    def reveal(pos)
        card = self[pos]
        card.reveal
        return card.value
    end

    def hide(pos)
        card = self[pos]
        card.hide
        return card.value
    end
end
