def all_words_capitalized?(wordarr)
    wordarr.all? { |word| word.capitalize == word }
end

def no_valid_url?(urlarr)
    url_end = ['com', 'net', 'io', 'org']

    # urlarr.none? do |url|
    #     url_parts = url.split(".")
    #     url_end.include?(url_parts[1])
    # end

    urlarr.none? do |url|
        url_end.any? { |ele| url.end_with?(ele) }
    end
end

def any_passing_students?(studentarr)
    studentarr.any? do |student| 
        avg = student[:grades].sum / ( student[:grades].length * 1.0 )
        avg >= 75
    end
end