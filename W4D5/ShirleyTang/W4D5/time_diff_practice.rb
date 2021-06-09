require 'benchmark'


def my_min1(arr)  
    arr.each do |ele1|
        return ele1 if arr.all? { |ele2| ele2>=ele1}
    end
end


def my_min2(arr)
    min=arr.first

    arr.each do |ele|
        min=ele if ele < min
    end

    min
end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

p my_min1(list) # O(n^2)
p my_min2(list) # O(n)

def largest_contiguous_subsum1(arr)
  all_subarrays = []
  (0...arr.length).each do |idx1|
    (idx1...arr.length).each do |idx2|
      all_subarrays << arr[idx1..idx2]
    end
  end
  max_sum = all_subarrays[0].sum
  all_subarrays.each do |subarray|
    max_sum = subarray.sum if subarray.sum > max_sum
  end
  # all_subarrays.map(&:sum).max
  max_sum
end

def largest_contiguous_subsum2(list)
  max_sum = list.first
  current_sum = 0
  start_index = 0
  end_index = start_index
  while start_index < list.length
    current_sum += list[end_index]
    max_sum = current_sum if current_sum > max_sum
    if end_index < list.length - 1
      end_index += 1
    else
      start_index += 1
      end_index = start_index
      current_sum = 0
    end
  end
  max_sum
end

# def largest_contiguous_subsum3(list)
#   return list.max if list.all?(&:negative?)
#   max_sum = 0
#   current_sum = 0
#   idx = 0
#   while idx < list.length
#     if list[idx].negative?
#       if (current_sum + list[idx]).negative?
#         current_sum = 0
#       else
#         current_sum += list[idx]
#       end
#     else
#       current_sum += list[idx]
#       max_sum = current_sum if current_sum > max_sum
#     end
#     idx += 1
#   end
#   max_sum
# end

def largest_contiguous_subsum3(list)
  return list.max if list.all?(&:negative?)
  max_sum = 0
  current_sum = 0
  list.each do |el|
    current_sum += el
    current_sum = 0 if current_sum.negative?
    max_sum = current_sum if current_sum > max_sum
  end
  max_sum
end

def largest_contiguous_subsum4(arr)
  max = arr.first
  curr_sum = 0
  arr.each do |num|
    curr_sum += num
    max = curr_sum if curr_sum > max
    curr_sum = 0 if curr_sum.negative?
  end
  max
end


list1 = [5, 3, -7]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [-5, -1, -3]
list4 = [0, -1, 3, -2, 4, 5, -3, 8, 7, 16, 13, 0, -1, 3, -2, 4, 5, -3, 8, 7, 16, 13, 0, -1, 3, -2, 4, 5, -3, 8, 7, 16, 13, 0, -1, 3, -2, 4, 5, -3, 8, 7, 16, 13]
p largest_contiguous_subsum1(list1)
p largest_contiguous_subsum1(list2)
p largest_contiguous_subsum1(list3)
p largest_contiguous_subsum2(list1)
p largest_contiguous_subsum2(list2)
p largest_contiguous_subsum2(list3)
p largest_contiguous_subsum3(list1)
p largest_contiguous_subsum3(list2)
p largest_contiguous_subsum3(list3)
p largest_contiguous_subsum4(list1)
p largest_contiguous_subsum4(list2)
p largest_contiguous_subsum4(list3)

Benchmark.bm do |x|
  x.report { p largest_contiguous_subsum1(list4) }
  x.report { p largest_contiguous_subsum2(list4) }
  x.report { p largest_contiguous_subsum3(list4) }
  x.report { p largest_contiguous_subsum4(list4) }
end
