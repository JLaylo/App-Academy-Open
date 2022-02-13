require_relative "board.rb"
require 'yaml'

class Minesweeper
    attr_reader :board

    def initialize(board)
        @board = board
    end

    def run
        game_over = false

        until game_over || board.solved?
            board.render
            action = self.get_action
            
            if action == "r" || action == "f"
                pos = self.get_pos 
            end

            case action
            when "r"
                board[pos].reveal
                game_over = true if board[pos].revealed? && board[pos].bombed?
            when "f"
                board[pos].flag
            when "s"
                saved_board = board.to_yaml
                File.open("./save_file.yml", "w") { |file| file.write(saved_board) }
                puts "Saving game..."
                sleep(1)
            when "l"
                saved_board = YAML.load(File.read("./save_file.yml"))
                @board = saved_board
                puts "Loading saved game..."
                sleep(1)
            else
                next
            end
        end

        board.render
        if game_over
            puts "GAME OVER!"
        else
            puts "YOU WIN!"
        end
    end

    def get_action
        print "Please enter an action (r = reveal, f = flag, s = save, l = load)"
        puts

        action = nil
        until action && valid_action?(action)
            print "> "
            action = gets.chomp
        end
        action
    end

    def valid_action?(user_input)
        # reveal, flag, save, load
        commands = ["r", "f", "s", "l"]
        commands.include?(user_input)
    end

    def get_pos
        print "Please enter a position on the board (e.g., '3,4')"
        puts

        pos = nil
        until pos && valid_pos?(pos)
            print "> "
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
end

# new board
board_size = 9
board = Board.new(board_size)

game = Minesweeper.new(board)
game.run
