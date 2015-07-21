class MinMaxStack
  attr_reader :stack
  def initialize
    @stack = []
    @max = 0
    @min = 0
  end

  def length
    @stack.length
  end

  # O(1)
  def push(value)
    if @stack.empty?
      @max, @min = value, value
      @stack << [value, @max, @min]
    else
      @max = (@max > value) ? @max : value
      @min = (@min < value) ? @min : value
      @stack << [ value, @min, @max ]
    end
  end

  def pop
    raise "Stack is empty" if @stack.empty?
    @stack.pop[0]
  end

  def max
    @stack.empty? ? nil : @stack[-1][2]
  end

  def min
    @stack.empty? ? nil : @stack[-1][1]
  end

end
