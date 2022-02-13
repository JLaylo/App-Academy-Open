def partition(arr, n)
    less_arr = []
    more_arr = []

    arr.each do |num|
        if num < n
            less_arr << num
        else
            more_arr << num
        end
    end
    
    [less_arr, more_arr]
end


def merge(hash1, hash2)
    new_hash = {}
    hash1.each { |k, v| new_hash[k] = v }
    hash2.each { |k, v| new_hash[k] = v }
    new_hash
end


def censor(sentence, curse_arr)
    vowels = "aeiou"
    sentence_arr = sentence.split(" ")
    new_sentence = []

    sentence_arr.each_with_index do |word|
        if curse_arr.include?(word.downcase)
            # Can be made into a helper method
            word.each_char.with_index do |char, idx|
                if vowels.include?(char.downcase)
                    word[idx] = "*"
                end
            end
        end
        new_sentence << word
    end
    new_sentence.join(" ")
end


def power_of_two?(num)
    while num > 1
        num /= 2.0
    end

    num == 1
end