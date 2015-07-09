# O(n)

class HashSet
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
    self.resize! if (num_elements + 1) > buckets.length


    bucket_for(num) << num

    self.num_elements += 1
    true
  end

  def delete(num)
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
    # Use the appropriate hash method for arbitrary object types.
    value.hash
  end



  # O(n) => # of elements that need to be re-inserted.
  # O(1) => Amortized time.
  # As input gets larger, takes twice as long before needing to resize again.
  def resize!
    new_buckets = Array.new(buckets.length * 2) { [] }

    # Rehash elements to newbuckets
    buckets.each do |bucket|
      bucket.each { |el| bucket_for(el, new_buckets) << el }
    end
    self.buckets = new_buckets
  end
end


if __FILE__ == $PROGRAM_NAME

  p "Checking insert."
  hm = HashMap.new()
  p hm.buckets
  (7).times do |i|
    hm.insert(i)
    p ("Number of elements: #{hm.num_elements}")
  end
  p hm.buckets

  p "-------------------"

  p ("Checking include.")
  p ("Does hm include '1'? " + hm.include?(1).to_s.capitalize)
  p ("Does hm include '10'? " + hm.include?(10).to_s.capitalize)
  p ("Does hm include '5'? " + hm.include?(5).to_s.capitalize)

  p "-------------------"

  p ("Checking delete.")
  p hm
  p ("Did hm delete '5'? " + hm.delete(5).to_s.capitalize)
  p ("Number of elements: #{hm.num_elements}")

  p "-------------------"

  p ("Checking resize")
  p hm.buckets
  p hm.insert(12)
  p hm.insert(14)
  p hm.insert(15)
  p hm.buckets
  p "#{hm.buckets.length} buckets & #{hm.num_elements} elements."


end
