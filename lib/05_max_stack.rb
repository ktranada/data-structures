class MaxStack
  attr_reader :stack
  def initialize
    @stack = []
    @max = 0
  end

  # O(1)
  def push(value)
    if (@stack.empty? || value > max)
      @max = value
    end
    @stack << [value, @max]
  end

  # O(1)
  def pop
    raise "Stack is empty" if @stack.empty?
    @stack.pop
  end

  # O(1)
  def max
    raise "Stack is empty" if @stack.empty?
    @stack[-1][1]
  end
end
