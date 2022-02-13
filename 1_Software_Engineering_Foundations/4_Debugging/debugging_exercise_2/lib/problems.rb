# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    i = num
    while i > 0
        if num % i == 0 && prime?(i)
            return i
        end
        i -= 1
    end
end

def prime?(num)
    return false if num < 2

    (2...num).each do |factor|
        if num % factor == 0
            return false
        end
    end

    true
end

def unique_chars?(str)
    chars = Hash.new(0)
    str.each_char { |c| chars[c] += 1 } #count each char
    chars.values.none? { |n| n > 1 }
    #can also use array of seen chars
end

def dupe_indices(arr)
    elecount = Hash.new { |h, k| h[k] = [] } #default is empty array
    arr.each_with_index do |ele, i| 
        elecount[ele] << i
    end

    elecount.select { |k,v| v.length > 1 }
end

def ana_array(arr1, arr2)
    hash1 = Hash.new(0)
    hash2 = Hash.new(0)
    arr1.each { |el1| hash1[el1] += 1 }
    arr2.each { |el2| hash2[el2] += 1 }
    hash1 == hash2
end