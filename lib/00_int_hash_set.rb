# O(n)
class IntHashSet
  attr_accessor :buckets, :num_elements
  def initialize
    # B/C = # keys is known.
    self.buckets = Array.new(8) { [] }
    self.num_elements = 0
  end

  # O(1) => Average time - uniform distribution.
  # O(n) => Worst time - collisions.
  def include?(num)
    bucket_for(num).include?(num)
  end

  # O(1) => Amortized
  # O(n) => Resize is O(n) but happens infrequently
  def insert(num)
    # Enforce uniqueness of keys.
    return false if include?(num)

    # Size of HashMap is proportional to number of keys.
    self.resize! if (num_elements + 1).fdiv(buckets.length) > 1.00


    bucket_for(num) << num

    self.num_elements += 1
    true
  end

  def remove(num)
    return false unless include?(num)

    bucket_for(num).delete(num)
    self.num_elements -= 1
    true
  end

  protected

  def bucket_for(value, buckets = self.buckets)
    buckets[value_hash(value) % buckets.length]
  end

  def value_hash(value)
    value
  end

  # O(n) => # of elements that need to be re-inserted.
  # O(1) => Amortized time.
  # As input gets larger, takes twice as long before needing to resize again.
  def resize!
    new_buckets = Array.new(buckets.length * 2) { [] }

    # Rehash elements to newbuckets
    buckets.each do |bucket|
      bucket.each do
        |el| bucket_for(el, new_buckets) << el
      end
    end
    self.buckets = new_buckets
  end
end
