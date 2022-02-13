def average (num1, num2)
    (num1 + num2) / 2.0
end

def average_array(arr)
    arr.sum / ( arr.length * 1.0 )
end

def repeat(str, num)
    newstr = ""
    num.times { newstr += str }
    newstr
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(sentence)
    words = sentence.split(" ")
    alt_words = words.map.with_index do |ele, i|
        if i % 2 == 0
            ele.upcase
        else
            ele.downcase
        end
    end
    alt_words.join(" ")
end