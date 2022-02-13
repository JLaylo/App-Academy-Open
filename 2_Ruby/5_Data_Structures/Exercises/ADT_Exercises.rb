class Stack
    def initialize
        # create ivar to store stack here!
        @vals = Array.new
    end

    def push(el)
        # adds an element to the stack
        @vals.push(el)
    end

    def pop
        # removes one element from the stack
        @vals.pop
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        @vals.last
    end
end

class Queue
    def initialize
        @vals = Array.new
    end

    def enqueue(el)
        @vals.push(el)
    end

    def dequeue
        @vals.shift
    end

    def peek
        @vals.first
    end
end

class Map
    def initialize
        @arr = Array.new
    end
  
    def set(key, value)
        @arr.each do |pair|
            if pair.first == key
                pair[1] = value
                return value
            end
        end

        @arr.push([key, value])
        value
    end

    def get(key)
        @arr.each { |pair| return pair.last if pair.first == key }
        # return nil if not found
        nil
    end

    def delete(key)
        value = get(key)
        @arr.reject! { |pair| pair.first  == key }
        value
    end

    def show
        # deep dup to retrict changing original pairs
        deep_dup(arr)
    end

    # recursive deep dup
    def deep_dup(arr)
        arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
    end

    private

    attr_reader :arr

end