# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?

        if self.all? { |el| el.is_a?(Numeric) }
            return self.max - self.min
        end
    end

    def average
        return nil if self.empty?

        if self.all? { |el| el.is_a?(Numeric) }
            avg = self.sum / (self.length * 1.0)
            return avg
        end
    end

    def median
        return nil if self.empty?

        mid_idx = self.length / 2
        sorted = self.sort

        if self.length.odd?
            sorted[mid_idx]
        else
            sorted[mid_idx-1..mid_idx].sum / 2.0
        end
    end

    def counts
        hash = Hash.new(0)
        self.each { |el| hash[el] += 1 }
        hash
    end

    def my_count(val)
        count = 0
        self.each { |el| count += 1 if el == val}
        count
    end

    def my_index(val)
        self.each_with_index do |el, i| 
            if el == val
                return i
            end
        end
        
        return nil
    end

    def my_uniq
        seen = []
        self.each do |el|
            if !seen.include?(el)
                seen << el
            end
        end
        seen
    end

    def my_transpose
        new_arr = []

        (0...self.length).each do |x|
            sub_arr = []
            (0...self.length).each do |y|
                sub_arr << self[y][x]
            end
            new_arr << sub_arr
        end

        new_arr
    end
end
