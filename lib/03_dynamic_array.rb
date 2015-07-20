require_relative "02_static_array"

class DynamicArray
  attr_accessor :store, :size, :index, :num_elements

  def initialize(size)
    self.store, @size, @num_elements = StaticArray.new(size), size, 0
  end


  def [](index)
    store[index]
  end

  def []=(index, value)
    store[index] = value
  end

  # O(1)
  def pop
    raise "Empty array" unless (num_elements > 0)
    self.num_elements -= 1
    val, store[num_elements] = store[num_elements], nil
    val
  end

  # O(1) amortized
  # O(n) worst case, because of the possible resize.
  def push(value)
    resize! if size == num_elements
    store[num_elements] = value
    self.num_elements += 1
    nil
  end

  # O(n)
  def shift
    raise "Empty array" if num_elements == 0
    val = store[0]
    (1..num_elements).each { |idx| @store[idx - 1] = @store[idx] }
    self.num_elements -= 1
    val
  end

  # O(n)
  def unshift(value)
    resize! if (num_elements + 1) > size
    num_elements.downto(0) { |idx| @store[idx] = @store[idx - 1]}
    @store[0] = value
    self.num_elements += 1
    nil
  end


  protected


  # O(n)
  # O(1) amortized
  def resize!
    new_capacity = num_elements * 2
    new_store = Array.new(new_capacity)
    num_elements.times { |idx| new_store[idx] = @store[idx] }

    self.size, self.store = new_capacity, new_store
  end
end
