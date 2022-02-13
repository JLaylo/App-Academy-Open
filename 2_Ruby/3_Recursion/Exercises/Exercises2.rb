$count1 = 0
$count2 = 0

def range(startnum, endnum)
    return [endnum-1] if startnum == endnum-1
    [startnum] + range(startnum+1, endnum)
end

# print range(1,5)

def rec_sum(nums_array)
    return 0 if nums_array.empty?
    sum = nums_array[0] + rec_sum(nums_array.drop(1))
end

# puts rec_sum([1, 2, 3, 4, 5])

def iter_sum(arr)
    sum = 0
    arr.each { |num| sum += num }
    sum
end

# puts iter_sum([1, 2, 3, 4, 5])

def exp1(base, exp)
    $count1 += 1
    return 1 if exp == 0
    base * exp1(base, exp-1)
end

# puts exp1(2, 3)
# puts exp1(2, 256)
# puts $count1

def exp2(b, n)
    $count2 += 1
    if n == 0
        return 1
    elsif n == 1
        return b
    end

    if n % 2 == 0 # even
        exp2(b, n/2) ** 2
    else # odd
        b * (exp2(b, (n-1) / 2) ** 2)
    end
end

# puts exp2(2, 3)
# puts exp2(2, 4)
# puts exp2(2, 256)
# puts $count2

class Array
    def deep_dup
        new_arr = []

        self.each do |el|
            if el.is_a?(Array)
                new_arr << el.deep_dup
            else
                new_arr << el
            end
        end

        new_arr
    end
end

# robot_parts = [
#   ["nuts", "bolts", "washers"],
#   ["capacitors", "resistors", "inductors"]
# ]

# robot_parts_copy = robot_parts.deep_dup
# robot_parts_copy[1] << "LEDs"
# print robot_parts[1]
# puts
# print robot_parts_copy[1]
# puts

def rec_fibonacci(n)
    if n == 1 
        return [0]
    elsif n == 2
        return [0,1]
    end

    arr = rec_fibonacci(n-1)
    arr << (arr[-1] + arr[-2])
end

# print rec_fibonacci(10)

def iter_fibonacci(n)
    if n == 1 
        return arr = [0]
    elsif n == 2
        return arr = [0,1]
    end

    arr = [0,1]
    (n-2).times { arr << (arr[-1] + arr[-2]) }
    arr
end

# print iter_fibonacci(10)

def bsearch(array, target)
    return nil if array[0] != target && array.length == 1

    mid_idx = array.length / 2

    if target == array[mid_idx]
        return mid_idx
    elsif target < array[mid_idx]
        return bsearch(array[0...mid_idx], target)
    else
        right_idx = bsearch(array[mid_idx..-1], target)
        right_idx += mid_idx if right_idx != nil
    end
end

# puts bsearch([1, 2, 3], 1) # => 0
# puts bsearch([2, 3, 4, 5], 3) # => 1
# puts bsearch([2, 4, 6, 8, 10], 6) # => 2
# puts bsearch([1, 3, 4, 5, 9], 5) # => 3
# puts bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# puts bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# puts bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
    return arr if arr.count <= 1

    mid_idx = arr.length / 2
    left_arr = arr[0...mid_idx]
    right_arr = arr[mid_idx..-1]

    merge(merge_sort(left_arr), merge_sort(right_arr))
end

def merge(left_arr, right_arr)
    merged_arr = []

    until left_arr.empty? || right_arr.empty?
        if left_arr.first < right_arr.first
            merged_arr << left_arr.shift
        else
            merged_arr << right_arr.shift
        end
    end

    merged_arr + left_arr + right_arr
end

# samplearr = (1..100).to_a
# print shuffledarr = samplearr.shuffle
# puts
# print merge_sort(shuffledarr)
# puts

def subsets(arr)
    subset_arrs = []
    return subset_arrs << [] if arr.empty?

    subset_arrs += subsets(arr[0...-1])
    
    subsets(arr[0...-1]).each do |subs|
        subs << arr.last
        subset_arrs << subs
    end

    subset_arrs
end

# print subsets([]) # => [[]]
# print subsets([1]) # => [[], [1]]
# print subsets([1, 2]) # => [[], [1], [2], [1, 2]]
# print subsets([1, 2, 3]) # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(arr_set)
    return [arr_set] if arr_set.length == 1

    perms = []

    arr_set.each do |el|
        arr_dup = arr_set.dup
        arr_dup.delete(el)
        dup_perms = permutations(arr_dup)
        dup_perms.each { |perm| perm.unshift(el) }

        perms += dup_perms
        
    end

    perms
end

# print permutations([1, 2, 3, 4]) # => [[1, 2, 3], [1, 3, 2],
#                         #     [2, 1, 3], [2, 3, 1],
#                         #     [3, 1, 2], [3, 2, 1]]

def greedy_make_change(amount, coins_arr)
    return [] if amount < coins_arr.first

    coins = []
    num_coins = amount / coins_arr.first
    num_coins.times do 
        coins << coins_arr.first
    end
    amount_left  = amount - (num_coins * coins_arr.first)

    coins + greedy_make_change(amount_left, coins_arr.drop(1))
end 

# print greedy_make_change(24, [10,7,1])

def make_better_change(amount, coins_arr)
    # return no coins if amount is zero
    return [] if amount == 0
    return nil if coins_arr.all? { |coin| coin > amount }

    # largest coins first
    sorted_coins = coins_arr.sort.reverse

    # declare best change
    best_change = nil

    # iterate through each coin
    sorted_coins.each_with_index do |coin, index|
        # coin too big to use
        next if coin > amount

        amount_left = amount - coin

        # best change for remainder
        best_remainder = make_better_change(amount_left, sorted_coins.drop(index))

        # cannot use remaining amount of change, do not use coin
        next if best_remainder.nil?

        this_change = [coin] + best_remainder

        # keep track of best change
        if best_change.nil? || (this_change.count < best_change.count)
            best_change = this_change
        end
    end

    best_change
end

print make_better_change(24, [10,7,3])