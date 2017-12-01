class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)
    @queue[@queue.length] = element
    @tail = @queue.last
    @head = @queue[0]
  end

  def dequeue
    @queue.shift
  end

  def empty?
    return true if @queue.length < 1
    false
  end
end
