def my_map(arr, &blk)
    new_arr = []
    arr.each do |ele|
        new_arr << blk.call(ele)
    end
    new_arr
end

def my_select(arr, &blk)
    new_arr = []
    arr.each do |ele|
        if blk.call(ele) == true
            new_arr << ele
        end
    end
    new_arr
end

def my_count(arr, &blk)
    count = 0
    arr.each do |ele|
        if blk.call(ele) == true
            count += 1
        end
    end
    count
end

def my_any?(arr, &blk)
    arr.each do |ele|
        if blk.call(ele) == true
            return true
        end
    end

    false
end

def my_all?(arr, &blk)
    arr.each do |ele|
        if blk.call(ele) == false
            return false
        end
    end

    true
end

def my_none?(arr, &blk)
    arr.each do |ele|
        if blk.call(ele) == true
            return false
        end
    end

    true
end