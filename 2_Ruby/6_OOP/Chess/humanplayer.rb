require_relative 'player'

class HumanPlayer < Player

    def make_move(board)
        start_pos = get_pos

        if board[start_pos].color != color
            raise "Not player's piece!"
        end

        end_pos = get_pos
        board.move_piece(color, start_pos, end_pos)
    end

    def get_pos
        input = nil
        until input
            system('clear')
            display.render
            input = display.cursor.get_input
        end
        input
    end
end