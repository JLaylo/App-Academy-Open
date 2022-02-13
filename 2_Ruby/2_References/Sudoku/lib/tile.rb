require 'colorize'

class Tile
    attr_reader :given, :value

    def initialize(value)
        @value = value
        @given = value == 0 ? false : true
    end

    def value=(value)
        if !given
            @value = value
        else
            puts "Cannot change a given tile!"
            sleep(1)
        end
    end

    def to_s
        if self.value == 0
            " "
        elsif self.given
            self.value.to_s.colorize(:red)
        else
            self.value.to_s.colorize(:blue)
        end
    end
end