class Array
    def my_uniq
        new_arr = []

        each { |el| new_arr << el unless new_arr.include?(el) }

        new_arr

        # uniq
    end

    def two_sum
        pairs = []
        (0...length - 1).each do |i|
            (i + 1...length).each do |j|
                pairs << [i, j] if self[i] == -self[j]
            end
        end
        pairs
        # [[2, 3], [0, 4]]
    end

    def my_transpose
        new_matrix = []
        
        length.times do |i|
            sub_matrix = []
            length.times do |j|
                sub_matrix << self[j][i]
            end
            new_matrix << sub_matrix
        end 

        new_matrix

        # transpose
    end
end

def stock_picker(arr)
    max_profit = 0
    indices = [0, 0]
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            if arr[j] - arr[i] > max_profit
                max_profit = arr[j] - arr[i]
                indices = [i, j]
            end
        end
    end
    indices
end

# [10, 30, 20, 40, 70, 5]
