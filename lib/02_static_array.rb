class StaticArray
  attr_accessor :store
  def initialize(length)
    self.store = Array.new(length, nil)
  end

  # Syntatic sugar - so we don't have to run `store.at(index)`.
  def check_bounds(index)
    if (index > store.length || index < 0)
      return false
    end
    true
  end

  def [](index)
    check_bounds(index)
    store[index]
  end

  def []=(index, value)
    check_bounds(index)
    store[index] = value
  end
end
