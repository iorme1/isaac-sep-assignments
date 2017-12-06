require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    hash_item = Node.new(key,value)
    index = index(key,size)

    if @items[index] === nil
      @items[index] = hash_item
      return
    end

    new_index = next_open_index(index)
    if new_index == -1
      resize
    else
      @items[new_index] = hash_item
    end
  end


  def [](key)
    @items.each_with_index do |item,i|
     if item && item.key === key
       return item.value
     end
   end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    looped = index
    if index === @items.size - 1
      index = 0
    else
      index +=1
    end

    while @items[index] && index != looped
      if index === (@items.size - 1)
        index = 0
      else
        index += 1
      end
    end

     return index === looped ? -1 : index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    temp = @items
    @items = Array.new(@items.size * 2)

    temp.each_with_index do |item,i|
      @items[index(item.key,size)] = item if item
    end
  end
end
