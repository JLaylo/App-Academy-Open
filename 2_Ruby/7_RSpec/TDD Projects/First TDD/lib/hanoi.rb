class HanoiGame
    COMPLETE_STACK = [3, 2, 1]
    
    def initialize
        @tower = Array.new(3) { Array.new }
        @tower[0] = COMPLETE_STACK.dup
    end

    def play
        until won?
            print render
            begin
                print "Enter tower to move from: "
                from = gets.chomp.to_i
                print "Enter tower to move to: "
                to  = gets.chomp.to_i
                move(from, to)
            rescue => e
                puts e.message
                retry
            end
        end

        puts "YOU WIN!"
    end

    def render 
        "Tower 0: " + @tower[0].join(' ') + "\n" +
        "Tower 1: " + @tower[1].join(' ') + "\n" +
        "Tower 2: " + @tower[2].join(' ') + "\n"
    end

    def move(from, to)
        raise "Invalid move!" if !valid_move?(from, to)
        @tower[to].push(@tower[from].pop)
    end

    def valid_move?(from, to)
        return false if @tower[from].empty?
        return false if !@tower[to].empty? && @tower[to].last < @tower[from].last
        true
    end

    def won?
        @tower[1] == COMPLETE_STACK.dup || @tower[2]==  COMPLETE_STACK
    end
end

if $PROGRAM_NAME == __FILE__
    HanoiGame.new.play
end