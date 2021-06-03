require 'tdd_project'

describe "#my_uniq" do 
    subject(:arr) { [1,1,3,4,2,3] }
    context "an array of elements" do 
        it "returns the array without duplicates" do 
            expect(arr.my_uniq).to eq [1,3,4,2] 
        end
        it "does not call built-in #uniq method" do 
            expect(arr).not_to receive(:uniq)
            expect(arr.my_uniq).to eq [1,3,4,2]
        end 
    end 
end 

