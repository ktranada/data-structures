require_relative '06_min_max_stack'




class MinMaxStackQueue
  def initialize
    @in, @out = MinMaxStack.new, MinMaxStack.new
  end

  # O(1)
  def enqueue(value)
    @in.push(value)
  end

  # O(1) amortized
  def dequeue
    if @out.empty?
      @out << @in.pop until @in.empty?
    end

    @out.pop
  end

  def length
    @in.length + @out.length
  end

  # O(1)
  def max
    maxes []
    maxes << @in.max if @in.length > 0
    maxes << @out.max if @out.length > 0

    maxes.max
  end

  # O(1)
  def min
    mins []
    mins << @in.min if @in.length > 0
    mins << @out.min if @out.length > 0

    mins.min
  end
end
