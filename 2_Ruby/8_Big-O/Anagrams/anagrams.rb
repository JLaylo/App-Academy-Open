

# Phase 1 - Store all permuations of first string and check second is one of them
# O(n!) time comlpexity
def first_anagram?(str1, str2)
    str1_arr = str1.split('')
    str1_anagrams = str1_arr.permutation(str1.length).to_a
    str1_anagrams.include?(str2.split(''))
end

# puts first_anagram?("gizmo", "sally")    #=> false
# puts first_anagram?("elvis", "lives")    #=> true


# Phase 2 - Iterate over 1st string and find index in 2nd string
# O(n^2) time complexity
def second_anagram?(str1, str2)
    str2_arr = str2.split('')

    str1.split('').each do |c|
        return false if str2_arr.find_index(c) == nil
    end

    true
end

# puts second_anagram?("gizmo", "sally")    #=> false
# puts second_anagram?("elvis", "lives")    #=> true


# Phase 3 - Sort both strings alphabetically and compare
# O(nlogn) time complexity

def third_anagram?(str1, str2)
    str1_arr = str1.split('').sort
    str2_arr = str2.split('').sort

    str1_arr == str2_arr
end

# puts third_anagram?("gizmo", "sally")    #=> false
# puts third_anagram?("elvis", "lives")    #=> true


# Phase 4 - Use hashes to map occurence of each letter
# O(n) time complexity

def fourth_anagram?(str1, str2)
    hash1 = Hash[str1.split('').group_by{ |c| c }.map{ |k,v| [k, v.size] }]
    hash2 = Hash[str2.split('').group_by{ |c| c }.map{ |k,v| [k, v.size] }]

    hash1 == hash2
end

puts fourth_anagram?("gizzmo", "sally")    #=> false
puts fourth_anagram?("elvis", "lives")    #=> true