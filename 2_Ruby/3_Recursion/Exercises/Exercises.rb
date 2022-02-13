def sum_to(n)
    if n == 0
        return n
    elsif n < 0
        return nil
    end

    n + sum_to(n-1)
end

# puts sum_to(5)  # => returns 15
# puts sum_to(1)  # => returns 1
# puts sum_to(9)  # => returns 45
# puts sum_to(-8)  # => returns nil

def add_numbers(nums_array)
    if nums_array.length == 1
        return nums_array[0]
    elsif nums_array.empty?
        return nil
    end

    sum = nums_array[0] + add_numbers(nums_array.drop(1))
end

# puts add_numbers([1,2,3,4]) # => returns 10
# puts add_numbers([3]) # => returns 3
# puts add_numbers([-80,34,7]) # => returns -39
# puts add_numbers([]) # => returns nil

def gamma_fnc(num)
    if num == 1
        return 1
    elsif num <= 0
        return nil
    end

    (num-1) * gamma_fnc(num-1)
end

# puts gamma_fnc(0)  # => returns nil
# puts gamma_fnc(1)  # => returns 1
# puts gamma_fnc(4)  # => returns 6
# puts gamma_fnc(8)  # => returns 5040

def ice_cream_shop(flavors, favorite)
    return false if flavors.empty?
    flavors[0] == favorite || ice_cream_shop(flavors.drop(1), favorite)
end

# puts ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
# puts ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
# puts ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
# puts ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
# puts ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(string)
    return "" if string == ""
    string[-1] + reverse(string[0..-2])
end

puts reverse("house") # => "esuoh"
puts reverse("dog") # => "god"
puts reverse("atom") # => "mota"
puts reverse("q") # => "q"
puts reverse("id") # => "di"
puts reverse("") # => ""