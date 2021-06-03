class Array     
    def my_uniq
        new_arr = []

        each {|el| new_arr << el unless new_arr.include?(el) }

        new_arr 

        # uniq
    end 
end