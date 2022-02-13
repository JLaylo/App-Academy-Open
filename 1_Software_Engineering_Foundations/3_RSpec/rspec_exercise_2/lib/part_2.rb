# def palindrome?(str)
#     reverse_str = ""
#     (0...str.length).reverse_each { |i| reverse_str += str[i] }
#     reverse_str == str
# end

def palindrome?(str)
    str.each_char.with_index do |char, i|
        if char != str[-i-1]
            return false
        end
    end

    true
end

def substrings(str)
    arr = []
    (0...str.length).each do |i|
        (i...str.length).each do |j|
            arr << str[i..j]
        end
    end
    arr
end

def palindrome_substrings(str)
    substrings(str).select { |substr| palindrome?(substr) && substr.length > 1 }
end




