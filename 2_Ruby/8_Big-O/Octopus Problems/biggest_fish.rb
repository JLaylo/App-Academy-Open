FISHES = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# => "fiiiissshhhhhh"

# bubble sort -> O = n^2
def sluggishOctopus
    new_fishes = FISHES.dup
    sorted = false

    while !sorted
        sorted = true

        (0..new_fishes.length - 2).each do |i|
            if new_fishes[i].length > new_fishes[i+1].length
                new_fishes[i], new_fishes[i+1] = new_fishes[i+1], new_fishes[i]
                sorted = false
            end
        end
    end

    puts new_fishes.last
end

# sluggishOctopus


# merge sort -> O = nlog(n)
def dominantOctopus
    sorted_fishes = merge_sort(FISHES)
    puts sorted_fishes.last
end

def merge_sort(arr)
    return arr if arr.length <= 1

    mid_idx = arr.length / 2

    merge(
        merge_sort(arr.take(mid_idx)),
        merge_sort(arr.drop(mid_idx))
    )
end

def merge(left_arr, right_arr, &prc)
    merged_array = []
    prc = Proc.new{ |str1, str2| str1.length <=> str2.length }

    until left_arr.empty? || right_arr.empty?
        case prc.call(left_arr.first, right_arr.first)
        when -1
            merged_array << left_arr.shift
        when 0
            merged_array << left_arr.shift
        when 1
            merged_array << right_arr.shift
        end
    end

    merged_array + left_arr + right_arr
end

# dominantOctopus


# linear search -> O = n
def cleverOctopus
    longest_fish = ''
    FISHES.each do |fish|
        if fish.length >  longest_fish.length
            longest_fish = fish
        end
    end
    
    puts 'clever octopus'
    puts longest_fish
end

# cleverOctopus
