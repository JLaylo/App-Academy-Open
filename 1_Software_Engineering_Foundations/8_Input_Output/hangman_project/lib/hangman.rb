class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    return DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(chr)
    @attempted_chars.include?(chr)
  end

  def get_matching_indices(chr)
    idx_arr = []
    @secret_word.each_char.with_index do |el, i|
      idx_arr << i if el == chr
    end
    return idx_arr
  end

  def fill_indices(chr, arr)
    arr.each { |el| @guess_word[el] = chr }
  end

  def try_guess(char)
    indices = get_matching_indices(char)
    if indices == []
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, indices)
    end

    if already_attempted?(char)
      print 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      return true
    end
  end

  def ask_user_for_guess
    print 'Enter a char: '
    guess = gets.chomp
    try_guess(guess)
  end

  def win?
    if @guess_word.join("") == @secret_word
      print 'WIN'
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      print 'LOSE'
      return true
    else
      return false
    end
  end
  
  def game_over?
    if win? || lose?
      print @secret_word
      return true
    else
      return false
    end
  end
end


