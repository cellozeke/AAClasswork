require_relative 'disk'

class Pile
  def initialize
    @stack = []
  end

  def start_stack(height)
    length = (2 * height) - 1
    height.times.reverse_each do |num|
      symbol = ('O' * (2 * num + 1)).center(length, ' ')
      @stack << Disk.new(symbol, num)
    end
  end

  def pop
    @stack.pop
  end

  def push(other_stack)
    @stack.push(other_stack)
  end

  def last
    @stack.last
  end

  def [](row)
    @stack[row]
  end

  def size
    @stack.length
  end

  def empty?
    @stack.empty?
  end
end
