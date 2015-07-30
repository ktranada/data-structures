require 'byebug'
class MinHeap
  attr_reader :heap, :root
  def initialize
    @heap = []
  end

  def insert(value)
    @heap << value
    parent_pos = (length - 1)/2
    new_pos = length - 1
    while parent_pos >= 0 && @heap[new_pos] < @heap[parent_pos]
      heapify_up(@heap, new_pos, parent_pos)
      new_pos = parent_pos
      parent_pos = (new_pos -1)/2
    end
  end

  def length
    @heap.length
  end

  def peek
    raise "Heap is empty" if is_empty?
    @heap.first
  end

  def remove_min
    raise "Heap is empty" if is_empty?
    value = @heap.first

    if length > 1
      @heap[0] = @heap.pop
      new_pos = (@heap[1] < @heap[2] ? 1 : 2)
      heapify_down(@heap, new_pos, 0)
      return value
    else
      return @heap.pop
    end
  end

  def is_empty?
    length == 0
  end

  def heapify_up(heap,new_pos, parent_pos)
    heap[new_pos], heap[parent_pos] = heap[parent_pos], heap[new_pos]
  end

  def heapify_down(heap, new_pos, parent_pos)
    return if heap[new_pos] >= heap[parent_pos]
    heap[new_pos], heap[parent_pos] = heap[parent_pos], heap[new_pos]
    left_child_pos = 2 * new_pos + 1
    right_child_pos = 2 * new_pos + 2
    parent_pos = new_pos

    left_child = heap[left_child_pos]
    right_child = heap[right_child_pos]

    if (!left_child.nil? || !right_child.nil?)
      new_pos = ( left_child < right_child  ? left_child_pos : right_child_pos)
      heapify_down(heap, new_pos, parent_pos)
    end


  end


end

if __FILE__ == $PROGRAM_NAME

h = MinHeap.new
h.insert 5
h.insert 30
h.insert 9
h.insert 6
h.insert 4
h.insert 42
h.insert 50
h.insert 91
h.insert 0
p h
p h.remove_min
p h
p h.peek

end
