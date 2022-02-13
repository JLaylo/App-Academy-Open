class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(arr)
    arr.all? { |el| POSSIBLE_PEGS.has_key?(el.upcase) }
  end

  def initialize(pegs)
    if !Code.valid_pegs?(pegs)
      raise "not valid pegs"
    else
      #@pegs = pegs.map { |el| el.upcase }
      @pegs = pegs.map(&:upcase)
    end
  end

  def self.random(length)
    random_arr = []
    length.times { random_arr << POSSIBLE_PEGS.keys.sample }
    return Code.new(random_arr)
  end

  def self.from_string(pegs) 
    return Code.new(pegs.split(""))
  end

  def [] (idx)
    @pegs[idx]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    num = 0

    guess.pegs.each_index do |idx|
      num += 1 if guess[idx] == self[idx]
    end

    return num
  end

  def num_near_matches(guess)
    num = 0
    guess_leftover = []
    answer_leftover = []
    
    #remove exact matches
    guess.pegs.each_index do |idx|
      if guess[idx] != self[idx]
        guess_leftover << guess[idx]
        answer_leftover << self[idx]
      end
    end

    #count near matches and remove from leftover arr
    guess_leftover.each do |el|
      if answer_leftover.include?(el)
        num += 1
        ans_idx = answer_leftover.find_index(el)
        answer_leftover.delete_at(ans_idx)
      end
    end

    return num
  end

  def ==(other_code)
    self.pegs == other_code.pegs
  end

end
