require_relative 'display'
require_relative 'board'
require_relative 'humanplayer'

class Chess_Game
    attr_reader :board, :display, :player1, :player2, :current_player

    def initialize
        @board = Board.new
        @display = Display.new(@board)
        @player1 = HumanPlayer.new(:white, display)
        @player2 = HumanPlayer.new(:black, display)
        @current_player = player1
    end

    def play
        until board.checkmate?(current_player.color)
            system('clear')            
            @display.render
            notify_players

            begin
                current_player.make_move(board)
            rescue StandardError => e
                display.cursor.toggle_selected(false)
                puts e.message
                sleep(1)
                retry
            end

            swap_turn!
        end

        puts "Game has ended! #{current_player.color} is in checkmate!"
    end

    private

    def notify_players
        puts "#{current_player.color}'s turn to move."

        if board.in_check?(current_player)
            puts "Check!"
        end

        sleep(1)
    end

    def swap_turn!
        @current_player = current_player == player1 ? player2: player1
    end
end

if $PROGRAM_NAME == __FILE__
    Chess_Game.new.play
end