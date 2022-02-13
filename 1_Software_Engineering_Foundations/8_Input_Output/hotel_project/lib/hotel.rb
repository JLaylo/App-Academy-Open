require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = {}
        rooms.each do |k,v|
            @rooms[k] = Room.new(v)
        end
    end

    def name
        split_name = @name.split(" ")
        new_name = split_name.map(&:capitalize)
        new_name.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(room)
        if @rooms.has_key?(room)
            true
        else
            false
        end
    end

    def check_in(person, room)
        if !room_exists?(room)
            print 'sorry room does not exist'
        else
            if rooms[room].add_occupant(person)
                print 'check in successful'
            else
                print 'sorry, room is full'
            end
        end
    end

    def has_vacancy?
        if rooms.values.all? { |el| el.full? }
            false
        else
            true
        end
    end

    def list_rooms
        rooms.each do |k,v|
            puts "#{k} : #{v.available_space}"
        end
    end

end
