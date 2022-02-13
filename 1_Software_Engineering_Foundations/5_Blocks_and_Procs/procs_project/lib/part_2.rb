def reverser(str, &blk)
    blk.call(str.reverse)
end

def word_changer(sentence, &blk)
    arr_sen = sentence.split(" ")
    new_sen = []

    arr_sen.each { |word| new_sen << blk.call(word) }
    new_sen.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    result1 = prc1.call(num)
    result2 = prc2.call(num)
    
    if result1 > result2
        return result1
    else
        return result2
    end
end

def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each do |ele|
        if prc1.call(ele) && prc2.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index do |ele, i|
        if i.even?
            new_arr << prc1.call(ele)
        else
            new_arr << prc2.call(ele)
        end
    end
    new_arr
end