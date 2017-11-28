require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head === nil
      @head = node
      @tail = node
    elsif @head.next === nil && @head != nil
      @tail.next = node
      @tail = node
      @head.next = @tail
    else
      @tail.next = node
      @tail = node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head === @tail
      @tail = nil
      @head = nil
      return
    end

    current_node = @head
    while current_node.next != @tail
      current_node = current_node.next
    end
    current_node.next = nil
    @tail = current_node
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    while current_node != nil
      puts "#{current_node.data}\n"
      current_node = current_node.next
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node === @tail
      self.remove_tail
      return
    elsif node === @head
      self.remove_front
      return
    else
      current_node = @head
      while current_node.next != node
        current_node = current_node.next
      end
      current_node.next = node.next
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if @head === nil
      @head = node
      @tail = node
    elsif @head.next === nil && @head != nil
      node.next = @tail
      @head = node
      @head.next = @tail
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end
end
