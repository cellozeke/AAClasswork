class InvalidNumberOfInputs < StandardError
  def initialize
    puts 'Invalid number of inputs'
    super
  end
end

class InvalidPileNumber < StandardError
  def initialize
    puts 'Pile choices must be between 1 to 3'
    super
  end
end

class SamePileNumber < StandardError
  def initialize
    puts 'Pile numbers should be different'
    super
  end
end

class EmptyFirstPile < StandardError
  def initialize
    puts 'Cannot move from an empty pile'
    super
  end
end

class DiskSize < StandardError
  def initialize
    puts 'Cannot place larger disk on top of smaller disk'
    super
  end
end
