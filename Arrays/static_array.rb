class StaticArray
  attr_accessor :store
  def initialize(length)
    self.store = Array.new(length, nil)
  end

  # Syntatic sugar - so we don't have to run `a.at(index)`.
  def [](index)
    return store[index]
  end

  def []=(index, value)
    store[index] = value
  end
end
