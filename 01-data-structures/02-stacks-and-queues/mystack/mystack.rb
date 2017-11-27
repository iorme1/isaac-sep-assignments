class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack = @stack + [item]
    self.top = item
  end

  def pop
    popped = self.top
    @stack = @stack - [self.top]
    self.top = @stack.last
    popped
  end

  def empty?
    return true if @stack.length < 1
    false
  end
end
