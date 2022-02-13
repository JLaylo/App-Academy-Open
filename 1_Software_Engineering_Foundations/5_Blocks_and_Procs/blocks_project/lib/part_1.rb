def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(dogs)
    dogs.reject { |ele| ele["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count { |ele| ele.sum > 0 }
end

def aba_translate(str)
    arr = str.split("")
    
    new_arr = arr.map do |ele|
        if "aeiou".include?(ele)
            ele + "b" + ele
        else
            ele
        end
    end
    
    new_arr.join("")
end

def aba_array(wordarr)
    new_arr = wordarr.map { |ele| aba_translate(ele) }
end