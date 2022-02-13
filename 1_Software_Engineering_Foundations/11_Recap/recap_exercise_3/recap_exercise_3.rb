def no_dupes?(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    uniq = hash.select { |k,v| v == 1 }
    uniq.keys
end

# print no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# print no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# print no_dupes?([true, true, true])            # => []


def no_consecutive_repeats?(arr)
    (0...arr.length-1).each do |i|
        return false if arr[i] == arr[i+1]
    end

    true
end

# puts no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# puts no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# puts no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# puts no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# puts no_consecutive_repeats?(['x'])                              # => true


def char_indices(str)
    indices = Hash.new { |h, k| h[k] = [] }
    str.each_char.with_index { |c, i| indices[c] << i }
    indices
end

# print char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# print char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    longest_streak = ""
    current_streak = ""

    (0...str.length).each do |i|
        if str[i-1] == str[i] || i == 0
            current_streak += str[i]
        else
            current_streak = str[i]
        end

        if current_streak.length >= longest_streak.length           
            longest_streak = current_streak
        end
    end

    longest_streak
end

# puts longest_streak('a')           # => 'a'
# puts longest_streak('accccbbb')    # => 'cccc'
# puts longest_streak('aaaxyyyyyzz') # => 'yyyyy
# puts longest_streak('aaabbb')      # => 'bbb'
# puts longest_streak('abc')         # => 'c'


def bi_prime?(num)
    (2...num).each do |x|
        if num % x == 0
            factor2 = num / x

            #puts "factor1 = #{x}, factor2 = #{factor2}"
            return true if is_prime?(x) && is_prime?(factor2)
        end 
    end

    return false
end

def is_prime?(num)
    return false if num < 2
    (2...num).none? { |x| num % x == 0 }
end

# puts bi_prime?(14)   # => true
# puts bi_prime?(22)   # => true
# puts bi_prime?(25)   # => true
# puts bi_prime?(94)   # => true
# puts bi_prime?(24)   # => false
# puts bi_prime?(64)   # => false


def vigenere_cipher(message, keys)
    alphabet = ("a".."z").to_a
    newstr = ""
    
    message.each_char.with_index do |c, i|
        new_idx = alphabet.index(c) + keys[i % keys.length]
        newstr += alphabet[new_idx % 26]
    end

    newstr
end 

# puts vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# puts vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# puts vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# puts vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# puts vigenere_cipher("yawn", [5, 1])             # => "dbbo"


def vowel_rotate(str)
    vowels = ["a", "e", "i", "o", "u"]
    new_str = ""

    str.each_char.with_index do |ch, i|
        if vowels.include?(ch)
            # find index of previous vowel
            new_idx = i-1
            while !vowels.include?(str[new_idx])
                new_idx -= 1
            end
            new_str += str[new_idx]
        else
            new_str += ch
        end
    end

    new_str
end

# puts vowel_rotate('computer')      # => "cempotur"
# puts vowel_rotate('oranges')       # => "erongas"
# puts vowel_rotate('headphones')    # => "heedphanos"
# puts vowel_rotate('bootcamp')      # => "baotcomp"
# puts vowel_rotate('awesome')       # => "ewasemo"


# PROC PROBLEMS

class String

    def select(&prc)
        new_str = ""

        if prc != nil
            self.each_char do |ch|
                new_str += ch if prc.call(ch)
            end
        end

        new_str
    end

    # p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
    # p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
    # p "HELLOworld".select          # => ""


    def map!(&prc)
        self.each_char.with_index do |ch, i|
            self[i] = prc.call(ch, i)
        end

        self
    end

    # word_1 = "Lovelace"
    # word_1.map! do |ch| 
    #     if ch == 'e'
    #         '3'
    #     elsif ch == 'a'
    #         '4'
    #     else
    #         ch
    #     end
    # end
    # p word_1        # => "Lov3l4c3"

    # word_2 = "Dijkstra"
    # word_2.map! do |ch, i|
    #     if i.even?
    #         ch.upcase
    #     else
    #         ch.downcase
    #     end
    # end
    # p word_2        # => "DiJkStRa"

end




# RECURSION PROBELMS

def multiply(a, b)
    return 0 if b == 0

    if b > 0 
        a + multiply(a, b-1)
    else
        (-a) + multiply(a, b+1)
    end
end

# puts multiply(3, 5)        # => 15
# puts multiply(5, 3)        # => 15
# puts multiply(2, 4)        # => 8
# puts multiply(0, 10)       # => 0
# puts multiply(-3, -6)      # => 18
# puts multiply(3, -6)       # => -18
# puts multiply(-3, 6)       # => -18


def lucas_sequence(i)
    arr = []

    if i == 0
        return arr
    elsif i == 1
        return [2]
    elsif i == 2
        return [2, 1]
    end

    arr += lucas_sequence(i-1)
    arr << arr[-1] + arr [-2]
end

# print lucas_sequence(0)   # => []
# puts
# print lucas_sequence(1)   # => [2] 
# puts   
# print lucas_sequence(2)   # => [2, 1]
# puts
# print lucas_sequence(3)   # => [2, 1, 3]
# puts
# print lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# puts
# print lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]
# puts


def prime_factorization(num)
    arr = []
    other_factor = 0
    
    if is_prime?(num)
        return arr << num
    end

    # find next prime factor
    (2...num).each do |x|
        if num % x == 0 && is_prime?(x)
            arr << x
            other_factor = num / x
            break
        end 
    end

    arr += prime_factorization(other_factor)
end

# print prime_factorization(12)     # => [2, 2, 3]
# puts
# print prime_factorization(24)     # => [2, 2, 2, 3]
# puts
# print prime_factorization(25)     # => [5, 5]
# puts
# print prime_factorization(60)     # => [2, 2, 3, 5]
# puts
# print prime_factorization(7)      # => [7]
# puts
# print prime_factorization(11)     # => [11]
# puts
# print prime_factorization(2017)   # => [2017]
# puts