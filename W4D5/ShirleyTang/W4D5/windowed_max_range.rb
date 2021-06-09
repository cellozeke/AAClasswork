def windowed_max_range1(arr, w)
  current_max_range = nil
  (0..arr.length - w).each do |idx|
    window = arr[idx...idx + w]
    diff = window.max - window.min
    current_max_range = diff if diff > current_max_range
  end
end
