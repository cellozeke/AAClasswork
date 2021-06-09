require_relative 'pile'
require_relative 'errors'

class Game
  def initialize(height)
    @height = height
    @stack1 = Pile.new
    @stack2 = Pile.new
    @stack3 = Pile.new
    @stack1.start_stack(height)
    @stacks = [@stack1, @stack2, @stack3]
  end

  def get_move
    print 'Please enter a move (e.g. 1 3): '
    choices = gets.chomp.split(' ')
    raise InvalidNumberOfInputs unless choices.length == 2
    raise InvalidPileNumber unless choices.all? { |choice| %w[1 2 3].include?(choice) }
    raise SamePileNumber if choices.first == choices.last
    choices.map { |choice| choice.to_i - 1 }
  end

  def move(choices)
    orig, dest = @stacks[choices.first], @stacks[choices.last]
    raise EmptyFirstPile if orig.empty?
    raise DiskSize unless valid_move?(orig, dest)
    dest.push(orig.pop)
  end

  def valid_move?(stack1, stack2)
    return true if stack2.empty?
    stack1.last.value < stack2.last.value
  end

  def win?
    @stack3.size == @height
  end

  def render
    max_height = @stacks.map(&:size).max
    max_height.times.reverse_each do |row|
      @stacks.each do |stack|
        print ' | '
        print stack[row] ? stack[row].symbol : ' ' * (2 * @height - 1)
      end
      puts ' | '
    end
  end

  def play
    system('clear')
    until win?
      render
      begin
        move(get_move)
      # rescue StandardError
      #   puts 'Invalid choices, please try again'
      #   retry
      rescue InvalidNumberOfInputs
        retry
      rescue InvalidPileNumber
        retry
      rescue SamePileNumber
        retry
      rescue EmptyFirstPile
        retry
      rescue DiskSize
        retry
      end
      system('clear')
    end
    render
    puts 'You win!'
  end
end
