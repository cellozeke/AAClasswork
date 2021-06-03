require 'tdd_project'

describe "#my_uniq" do 
    subject(:arr) { [1,1,3,4,2,3] }
    context "given an array of elements" do 
        it "returns the array without duplicates" do 
            expect(arr.my_uniq).to eq [1,3,4,2] 
        end
        it "does not call built-in #uniq method" do 
            expect(arr).not_to receive(:uniq)
            expect(arr.my_uniq).to eq [1,3,4,2]
        end 
    end 
end 

describe '#two_sum' do
    subject(:arr) { [-1, 0, 2, -2, 1] }
    context 'when an array of integers is given' do
        it 'returns all pairs of positions where the elements sum to zero' do
            expect(arr.two_sum.sort).to eq [[0, 4], [2, 3]]
        end
        it 'pairs should be sorted "dictionary-wise"' do
            expect(arr.two_sum).to eq [[0, 4], [2, 3]]
        end
    end
end
