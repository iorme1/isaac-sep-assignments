class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue.last
  end

  def enqueue(element)
    if self.empty?
      @queue[0] = element
      @head = element
      @tail = element
    else
      @tail = element
    end
  end

  def dequeue
    if @queue.length === 1
      @queue = Array.new
    else
      @queue = [@queue[1]]
    end
  end

  def empty?
    return true if @queue.length < 1
    false
  end
end
