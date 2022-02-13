class ComputerPlayer
    def initialize(board_size)
        @known_cards = {}
        @matched_cards = []
        @board_size = board_size
    end

    def get_input(guess_number)
        pos = []
        encountered = {}
        match_found = false

        # check for matched cards @known_cards
        @known_cards.each do |k,v|
            if encountered.key(v)
                # found duplicate
                if guess_number == 1
                    pos = encountered.key(v)
                elsif guess_number = 2
                    pos = k
                end
                match_found = true
            else
                encountered[k] = v
            end
        end

        if !match_found
            # guess randomly
            (0...@board_size).each do |row|
                (0...@board_size).each do |col|
                    pos = [row, col]
                    if !@known_cards.has_key?(pos) && !@matched_cards.include?(pos)
                        return pos
                    end
                end
            end
        end

        return pos
    end

    def receive_revealed_card(pos, value)
        @known_cards[pos] = value
    end

    def receive_match(pos1, pos2)
        @matched_cards += [pos1, pos2]
        @known_cards.delete(pos1)
        @known_cards.delete(pos2)
    end

    def prompt(method)
        # dummy method to match human player
    end
end