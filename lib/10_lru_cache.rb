class LRUCache
  attr_reader :capacity, :count, :store
  def initialize(capacity)
    @capacity = capacity
    @count = 0
    @store = {}
  end

  def add(key, value)
    if count == capacity
      lru_item = store.first[0]
      @store.delete(lru_item)
    end
    @count += 1
    @store[key] = value
  end

  def fetch(key)
    item = @store[key]
    @store.delete(key)
    @store[key] = item[1]
    item
  end

  def remove(key)
    @store.delete(key)
  end

end

if __FILE__ == $PROGRAM_NAME

  cache = LRUCache.new(5)
   cache.add(1, 2)
   cache.add(3, 4)
  p cache.store
  p cache
  p "LRU: " + cache.store.first.to_s
  p cache.fetch(1)
  p "LRU: " + cache.store.first.to_s
   cache.add(5, 6)
  p cache.store
    cache.remove(5)
  p cache.store
  p "LRU: " + cache.store.first.to_s
   cache.add(10,20)
  p cache.store
   cache.add(8, 9)
   p "LRU: " + cache.store.first.to_s
   p cache.store
   cache.add(20,20)
   p "LRU: " + cache.store.first.to_s


end
