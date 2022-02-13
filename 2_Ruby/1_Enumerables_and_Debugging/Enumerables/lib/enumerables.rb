class Array
    def my_each(&prc)
        self.length.times { |idx| prc.call(self[idx]) }
        return self
    end

    def my_select(&prc)
        new_arr = []
        
        self.my_each do |el|
            if prc.call(el) == true
                new_arr << el
            end
        end
        
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        
        self.my_each do |el|
            if prc.call(el) == false
                new_arr << el
            end
        end
        
        new_arr
    end

    def my_any?(&prc)
        self.my_each { |el| return true if prc.call(el) == true }
        return false
    end

    def my_all?(&prc)
        self.my_each { |el| return false if prc.call(el) == false }
        return true
    end

    def my_flatten
        new_arr = []

        self.each do |el|
            if el.is_a?(Array) == false
                new_arr << el
            else
                new_arr += el.my_flatten
            end
        end

        new_arr
    end

    def my_zip(*arr)
        new_arr = [] 
        self.length.times do |idx|
            temp_arr = []
            
            temp_arr << self[idx]
            arr.each { |el| temp_arr << el[idx] }

            new_arr << temp_arr
        end
        new_arr
    end

    def my_rotate(num = 1)
        new_arr = []
        
        self.each_with_index do |el, idx|
            new_idx = (idx + num) % self.length
            new_arr << self[new_idx]
        end

        new_arr
    end

    def my_join(separator = "")
        new_str = self[0]

        (1...self.length).each do |idx|
            new_str += separator + self[idx]
        end

        new_str
    end

    def my_reverse
        new_arr = []
        self.each { |el| new_arr.unshift(el) }
        new_arr
    end
end

# return_value = [1, 2, 3].my_each do |num|
#     puts num
#   end.my_each do |num|
#     puts num
#   end
  
# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

a = [ "a", "b", "c", "d" ]
p a.my_join         # => "abcd"
p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]