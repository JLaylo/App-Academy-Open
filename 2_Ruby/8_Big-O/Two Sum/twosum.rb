# Given an array of unique integers and a target sum,
# determine whether any two integers in the array sum to that amount.


# O(n^2) time complexity
# O(1) space complexity, no new data created
def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |num1, i1|
        arr.each_with_index do |num2, i2|
            next if i1 == i2
            return true if num1 + num2 == target_sum
        end
    end

    false
end

arr = [0, 1, 5, 7]
# puts bad_two_sum?(arr, 6) # => should be true
# puts bad_two_sum?(arr, 10) # => should be false


# O(nlogn) time complexity
# O(n) space complexity, sorted array made
def okay_two_sum?(arr, target_sum)
    sorted_arr = arr.sort #uses quicksort
    i, j = 0, sorted_arr.length-1

    while i < j
        result = sorted_arr[i] + sorted_arr[j] <=> target_sum

        case result
        when 0
            return true
        when -1
            i += 1
        when 1
            j -= 1
        end
    end

    false
end

# puts okay_two_sum?(arr, 6) # => should be true
# puts okay_two_sum?(arr, 10) # => should be false


# O(n) time complexity
# O(n) space complexity, hash map made
def two_sum?(arr, target_sum)
    num_hash = {}

    arr.each do |el|
        return true if num_hash[target_sum - el] #true if difference in hash already
        num_hash[el] = true
    end

    false
end

puts two_sum?(arr, 6) # => should be true
puts two_sum?(arr, 10) # => should be false