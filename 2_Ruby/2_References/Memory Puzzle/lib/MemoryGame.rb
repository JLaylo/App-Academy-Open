require_relative "./Board.rb"
require_relative "./Card.rb"
require_relative "./HumanPlayer.rb"
require_relative "./ComputerPlayer.rb"

class Game
    def initialize(size)
        @board = Board.new(size)
        @board.populate
        @previous_guess = []
        # @player = HumanPlayer.new(size)
        @player = ComputerPlayer.new(size)
    end

    def make_guess(pos)
        if @board[pos].face_up? == true && pos == @previous_guess
            @board.hide(pos)
            @board.render
            puts "Chose the same card!"
        elsif @board[pos].face_up? == true && pos != @previous_guesss
            @board.hide(@previous_guess)
            @board.render
            puts "Card is already flipped!"
        elsif
            @board.reveal(@previous_guess) == @board.reveal(pos)
            @board.render
            @player.receive_match(@previous_guess, pos)
            puts "It's a match!"
        else
            # show the board for a second
            @board.reveal(@previous_guess)
            val = @board.reveal(pos)
            @player.receive_revealed_card(pos, val)
            @board.render
            puts "Not a match!"
            sleep(1)
            @board.hide(@previous_guess)
            @board.hide(pos)
            @board.render
        end

        sleep(1)
        @previous_guess = []
    end

    def play
        while @board.won? == false
            @board.render
            @player.prompt("Please enter the first card position (eg. '2,3')")
            pos = nil
            until pos && valid_input?(pos)
                pos = @player.get_input(1)
            end

            # check if card is already flipped - refactor
            if @board[pos].face_up? == true
                @board.render
                @player.prompt("Card is already flipped!")
                sleep(1)
                next
            elsif @previous_guess == []
                val = @board.reveal(pos)
                @player.receive_revealed_card(pos, val)
                @previous_guess = pos
            end

            @board.render
            @player.prompt("Please enter the second card position (eg. '2,3')")
            pos = nil
            until pos && valid_input?(pos)
                pos = @player.get_input(2)
            end

            make_guess(pos)
        end

        puts "YOU WIN!!"
    end

    def valid_input?(pos)
        pos.is_a?(Array) && pos.count == 2
        pos.all? { |n| n.between?(0,@board.size-1) }
    end
end

# Run the game
matching_game = Game.new(6)
matching_game.play
