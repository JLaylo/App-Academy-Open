module Slideable
    HORIZONTAL_DIRS = [
        [1,0],
        [-1,0],
        [0,1],
        [0,-1]
    ].freeze

    DIAGONAL_DIRS = [
        [1,1],
        [-1,1],
        [1,-1],
        [-1,-1]
    ].freeze 
    #freeze ensures constants cannot be changed

    #accessors to direction constants
    def horizontal_dirs
        HORIZONTAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    # creates list of valid moves
    def moves
        moves = []
        move_dirs.each do |dx,dy|
            moves.concat(grow_unblocked_moves_in_dir(dx,dy))
        end
        moves
    end

    private 

    def move_dirs
        #overwritten by subclass
        raise NotImplementedError
    end

    # checks for unblocked spaces in given dir
    def grow_unblocked_moves_in_dir(dx, dy)
        cur_x, cur_y = pos
        moves = []

        loop do
            cur_x, cur_y = cur_x + dx, cur_y + dy
            pos = [cur_x, cur_y]

            break unless board.valid_pos?(pos)

            if board[pos].empty?
                moves << pos
            else
                # can take an opponent's piece
                moves << pos if board[pos].color != color

                # can't move past blocking piece
                break
            end
        end
        moves
    end
end