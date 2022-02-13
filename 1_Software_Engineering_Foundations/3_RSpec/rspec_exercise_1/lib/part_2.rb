def hipsterfy(word)
    vowels = "aeiou"
    new_word = ""
    (0...word.length).reverse_each do |i|
        if vowels.include?(word[i])
            word[i] = ""
            break
        end
    end
    return word
end

def vowel_counts(str)
    vowels = "aeiou"
    vow_count = Hash.new(0)
    str.downcase.each_char do |ch|
        if vowels.include?(ch)
            vow_count[ch] += 1
        end
    end
    vow_count
end

def caesar_cipher(msg, n)
    # alphabet = 'abcdefghijklmnopqrstuvwxyz'
    alphabet_arr = ('a'..'z').to_a
    mod_msg = ""
    msg.each_char do |ch|
        if alphabet_arr.include?(ch)
            new_idx = (alphabet_arr.index(ch) + n) % 26
            mod_msg += alphabet_arr[new_idx]
        else
            mod_msg += ch
        end
    end
    mod_msg
end
