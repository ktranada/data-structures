require_relative "static_array"

class DynamicArray
  attr_accessor :store

  def initialize
    self.store, self.length, self.capacity = StaticArray.new(8), 8, 0
  end

  def [](index)

  end

  def []=(index, value)
    check_index(index)
    store[index] = value
  end

  def pop
    raise "Index out of bounds" unless (length > 0)
    value,

  end

  def push
  end

  def shift
  end

  def unshift
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
    unless (index >= 0) && (index < length)
      raise "Index is out of bounds."
    end
  end

end
