module Stepable
    
    def moves
        moves = []

        move_diffs.each do |dx,dy|
            cur_x, cur_y = pos
            cur_x, cur_y = cur_x + dx, cur_y + dy
            new_pos = [cur_x, cur_y]

            next unless board.valid_pos?(new_pos)

            if board[new_pos].empty?
                moves << new_pos
            else
                # can take an opponent's piece
                moves << new_pos if board[new_pos].color != color
            end
        end

        moves
    end

    private

    def move_diffs
        # overwritten by subclass
        raise NotImplementedError
    end 
end