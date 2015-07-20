require_relative "static_array"

class DynamicArray
  attr_accessor :store, :length
  attr_reader :capacity

  def initialize
    store, length, capacity = StaticArray.new(8), 8, 0
  end

  # O(1)
  def [](index)
    check_index(index)
    store[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  # O(1)
  def pop
    raise "Index out of bounds" unless (length > 0)
    value, self[length - 1] = self[length - 1], nil
    length -= 1
    value
  end

  # O(1) amortized
  # O(n) worst case, because of the possible resize.
  def push
    resize! if length == capacity

    length += 1
    self[length - 1] = value
    nil
  end

  def shift
  end

  def unshift
  end

  protected

  def check_index(index)
    unless (index >= 0) && (index < length)
      raise "Index is out of bounds."
    end
  end

  def resize!
    new_capacity = capacity * 2
    new_store = StaticArray.new(new_capacity)
    length.times { |idx| new_store[idx] = self[idx] }

    self.capacity, self.store = new_capacity, new_store
  end
end


if __FILE__ = $PROGAM_NAME

end
