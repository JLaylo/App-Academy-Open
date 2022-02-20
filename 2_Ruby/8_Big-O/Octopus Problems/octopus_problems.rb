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

def merge(arr1, arr2, &prc)
    #to do
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
