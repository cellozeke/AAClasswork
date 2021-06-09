class Disk
  attr_reader :symbol, :value

  def initialize(symbol, value)
    @symbol = symbol
    @value = value
  end
end

# class NullDisk
#   attr_reader :symbol, :value

#   include Singleton

#   def initialize(length)
#     @symbol = ' ' * length
#     @value = -1
#   end
# end
