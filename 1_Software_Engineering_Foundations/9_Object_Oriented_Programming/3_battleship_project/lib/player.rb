class Player
    def get_move
        print 'enter a position with coordinates separated with a space like `4 7`: '
        pos_string = gets.chomp.split(" ")
        pos = pos_string.map(&:to_i)
    end
end
