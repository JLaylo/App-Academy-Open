require 'hanoi'

describe HanoiGame do
    subject(:hanoi) { HanoiGame.new }

    describe '#render' do
        it 'pretty-prints stacks' do
            expect(hanoi.render).to eq("Tower 0: 3 2 1\nTower 1: \nTower 2: \n")
        end

        it 'prints shorter stacks' do
            hanoi.move(0,2)
            hanoi.move(0,1)
            expect(hanoi.render).to eq("Tower 0: 3\nTower 1: 2\nTower 2: 1\n")
        end
    end

    describe '#move' do
        it 'allows moving to blank space' do
            expect{ hanoi.move(0,2) }.to_not raise_error
        end

        it 'allows moving onto a larger disk' do
            hanoi.move(0,2)
            hanoi.move(0,1)
            expect{ hanoi.move(2, 1) }.to_not raise_error
        end

        it 'does not allow moving from an empty stack' do
            expect{ hanoi.move(2,0) }.to raise_error(/Invalid move/)
        end

        it 'does not allow moving onto a smaller disk' do
            hanoi.move(0,2)
            expect{ hanoi.move(0, 2) }.to raise_error(/Invalid move/)
        end
    end

    describe '#won?' do
        it 'is not won at the start' do
            expect(hanoi.won?).to eq(false)
        end

        it 'is won when all disks are moved to tower 1' do
            hanoi.move(0, 1)
            hanoi.move(0, 2)
            hanoi.move(1, 2)
            hanoi.move(0, 1)
            hanoi.move(2, 0)
            hanoi.move(2, 1)
            hanoi.move(0, 1)
            expect(hanoi.won?).to eq(true)
        end

        it 'is won when all disks are moved to tower 2' do
            hanoi.move(0, 2)
            hanoi.move(0, 1)
            hanoi.move(2, 1)
            hanoi.move(0, 2)
            hanoi.move(1, 0)
            hanoi.move(1, 2)
            hanoi.move(0, 2)
            expect(hanoi.won?).to eq(true)
        end
    end
end