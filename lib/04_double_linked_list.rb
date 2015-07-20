class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = Link.new(nil, false)
    @tail = Link.new(nil, false)
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

class Link
  attr_accessor :next, :prev, :adjustable
  def initialize(value, adjustable = true)
    @val, @next, @prev, @adjustable = value, nil, nil, adjustable
  end

  def check_current
    # Node must be detached in order to insert
    !(self.next || self.prev)
  end

  def insert_left(node)
    raise "Node must be detached" unless node.check_current
    node.next = self
    node.prev = self.prev
    self.prev.next = node if self.prev
    self.prev = node
  end

  def insert_right(node)
    raise "Node must be detached" unless node.check_current
    # Order matters, if we sever next node early, we lost it entirely.
    node.prev = self
    node.next = self.next
    self.next.prev = node if self.next
    self.next = node
  end

  def value
    raise "Head/tail node" unless self.adjustable
    self.value
  end

  def value=(value)
    raise "Head/tail node" unless self.adjustable
    self.value = value
  end

  def remove
    raise "Head/tail node" unless self.adjustable
    self.prev.next = self.next
    self.next.prev = self.prev
    self.prev, self.next = nil, nil
  end
end
