list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# my_min(list)  # =>  -5

# Phase 1 -> O(n^2)
def my_min (arr)
  arr.each_with_index do |num1, i1|
    min = true

    arr.each_with_index do |num2, i2|
      next if i2 == i1
      min = false if num2 < num1
    end

    return num1 if min
  end
end

# puts my_min(list)

# Phase 2 -> O(n)
def my_min_linear(list)
  min = list.first
  list.each { |num|  min = num if num < min}
  puts min
end

# my_min_linear(list)

# new_list = [5, 3, -7]
# new_list = [2, 3, -6, 7, -6, 7]
new_list = [3,5,-10,100,-12]

# Phase 1 -> O(n^3) time, O(n^3) space
def largest_contiguous_subsum(arr)
   sub_arrs = []
   max_subsum = 0
   max_subarr = []

   arr.each_index do |idx1|
    arr.each_index do |idx2|
      next if idx2 < idx1
      sub_arrs << arr[idx1..idx2]
    end
   end

   sub_arrs.each do |sub_arr|
    arr_sum = sub_arr.sum
    if max_subsum < arr_sum
      max_subsum = arr_sum 
      max_subarr = sub_arr
    end
   end

   puts max_subsum
   print max_subarr
   puts
end

largest_contiguous_subsum(new_list)


# Phase 2 -> O(n) time, O(1) space
def largest_subsum_linear(arr)
    max_subsum = arr.first
    curr_subsum = arr.first

  (1...arr.length).each do |i|
    curr_subsum = 0 if curr_subsum < 0
    curr_subsum += arr[i]
    max_subsum = curr_subsum if max_subsum < curr_subsum
  end

  puts max_subsum
end

largest_subsum_linear(new_list)