tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

# O(n)
def slowDance(direction, tiles_array)
    puts tiles_array.index(direction)
end

# slowDance('right-down', tiles_array)


tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
   "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7}

# O(1) with hash map
def constantDance(direction, tiles_hash)
    puts tiles_hash[direction]
end

constantDance('right-down', tiles_hash)
