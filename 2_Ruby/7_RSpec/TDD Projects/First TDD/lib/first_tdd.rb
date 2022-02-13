def uniq(arr)
    uniq_arr = []
    arr.each do |item|
        uniq_arr << item if !uniq_arr.include?(item)
    end
    uniq_arr
end

def two_sum(arr)
    pos = []
    arr.each_with_index do |el1, i|
        arr[i+1..-1].each_with_index do |el2, j|
            pos << [i, i+1+j] if el1 + el2 == 0
        end
    end
    pos
end

def my_transpose(arr)
    new_arr = []
    (0..arr.length-1).each do |i|
        new_col = []
        (0..arr.length-1).each do |j|
            new_col << arr[j][i]
        end 
        new_arr << new_col
    end
    new_arr
end

def stock_picker(arr)
    pick = [0,0]
    buy_price, sell_price = arr[0], 0
    arr.each_with_index do |price, index|
        if price < buy_price then
            pick[0] = index
            buy_price = price
        end

        if price > sell_price then
            pick[1] = index
            sell_price = price
        end

        if pick[0] == arr.length-1 && pick[1] == 0 then
            #market crash, no good time to sell
            pick = nil
        end
    end
    pick
end