require_relative "00_int_hash_set"
class HashSet < IntHashSet
  protected
  def value_hash(value)
    # Use the appropriate hash method for an arbitrary object type.
    value.hash
  end
end


if __FILE__ == $PROGRAM_NAME

  puts "\n"
  puts "Checking insert."
  hm = HashSet.new()
  p hm.buckets
  (7).times do |i|
    hm.insert(i)
    puts "# elements: #{hm.num_elements}"
  end
  p hm.buckets

  puts "\n"
  puts "-------------------"
  puts "\n"

  puts ("Checking include: ")
  puts ("Include '1': " + hm.include?(1).to_s.capitalize)
  puts ("Include '10': " + hm.include?(10).to_s.capitalize)
  puts ("Include '5': " + hm.include?(5).to_s.capitalize)
  puts ("Number of elements: #{hm.num_elements}")

  puts "\n"
  puts "-------------------"
  puts "\n"

  puts ("Checking delete: ")
  p hm.buckets
  puts ("Delete '5': " + hm.remove(5).to_s)
  puts ("Number of elements: #{hm.num_elements}")

  puts "\n"
  puts "-------------------"
  puts "\n"

  puts ("Checking resize: ")
  puts  "Pre-resize: #{hm.buckets.length} buckets & #{hm.num_elements} elements "
  p hm.buckets
  puts ("Insert 12: " + hm.insert(12).to_s)
  puts ("Insert 14: " + hm.insert(14).to_s)
  puts ("Insert 15: " + hm.insert(15).to_s)
  p hm.buckets
  puts "Post-resize: #{hm.buckets.length} buckets & #{hm.num_elements} elements."
  puts "\n"

end
