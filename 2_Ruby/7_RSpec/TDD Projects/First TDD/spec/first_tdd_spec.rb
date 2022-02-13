require 'rspec'
require 'first_tdd'

describe "#uniq" do
    let(:array) { [1, 2, 1, 3, 3] }   
    let(:uniq_array) { uniq(array.dup) } 

    it "removes duplicates from an array" do
        array.each do |item|
            expect(uniq_array.count(item)).to eq(1)
        end
    end

    it "only contains items from the original" do
        uniq_array.each do |item|
            expect(array).to include(item)
        end
    end

    it "does not modify the original array" do
        expect{uniq(array)}.to_not change{array}
    end
end

describe "#two_sum" do
    let(:array) { [-1, 2, -2] }
    let(:one_zero) { [-1, 0, 2] }
    let(:two_zero) { [-1, 0, 2 ,0] }

    it "finds a zero sum pair" do
        expect(two_sum(array)).to eq([[1,2]])
    end
    
    it "is not confused by a single zero" do
        expect(two_sum(one_zero)).to eq([])
    end

    it "handles two zeros" do
        expect(two_sum(two_zero)).to eq([[1,3]])
    end
end

describe "#my_transpose" do
    let(:array) {[
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
    ]}

    let(:transposed){[
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
    ]}

    it "transposes a matrix" do
        expect(my_transpose(array)).to eq(transposed)
    end

end

describe "#stock_picker" do
    it "finds a simple pair" do
        expect(stock_picker([3,1,0,4,6,9])).to eq([2,5])
    end

    it "finds a better pair after an inferior pair" do
        expect(stock_picker([3,2,5,0,6])).to eq([3,4])
    end

    it "does not buy stocks in a crash" do
        expect(stock_picker([5,4,3,2,1])).to be_nil
    end
end
