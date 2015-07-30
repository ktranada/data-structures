require_relative '04a_node'

class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = Node.new(nil, false)
    @tail = Node.new(nil, false)
    @node_count = 0

    @head.insert_right(@tail)
  end

  def empty?
    head.next == tail
  end

  def push(value)
    tail.insert_left(Link.new(value))
    self.node_count += 1
    value
  end

  def pop
    raise "List is empty" if empty?
    value = tail.prev.value
    tail.prev.remove
    self.node_count -= 1
    value
  end

# TODO test this
  def remove_link(value)
    count = 1
    current_node = head.next
    until count == node_count
      current_node.remove if (current_node.value == value)
      current_node = current_node.next
      count += 1
    end
  end

  def shift
    raise "List is empty" if empty?
    value = head.next.value
    head.next.remove
    self.node_count -= 1
    value
  end

  def unshift(value)
    head.insert_right(Link.new(value))
    self.node_count += 1
    value
  end

end
