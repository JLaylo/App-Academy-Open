require_relative 'board'
require_relative 'cursor'
require 'colorize'

class Display
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        @board.rows.each_with_index do |row, i|
            row.each_with_index do |piece, j| 
                color = pos_color(piece,i,j)
                print piece.symbol.colorize(color)
            end
            puts
        end
    end

    def pos_color(piece,i,j)
        color = piece.color == :white ? :red : :blue
        color = :white if piece.color == :none

        if @cursor.cursor_pos == [i,j] && @cursor.selected
            color = :yellow
        elsif @cursor.cursor_pos == [i,j] && !@cursor.selected
            color = :green
        end
    
        color
    end
end
