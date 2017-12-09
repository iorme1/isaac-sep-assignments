require_relative 'node'

class MinBinaryHeap
  attr_accessor :heap

  def initialize
    @heap = [nil]
  end

  def insert(data)
    @heap << data
    sift_up(@heap.size - 1)
  end

  def sift_up(index)
    if index === 1
      return
    elsif @heap[index].rating < @heap[index / 2].rating
      temp = @heap[index]
      @heap[index] = @heap[index / 2]
      @heap[index / 2] = temp
      sift_up(index / 2)
    end
  end


  def delete(data)
    @heap.each_with_index do |item,i|
      if item && item === data
        @heap.delete_at(i)
      end
    end
    sift_up(@heap.size - 1)
  end


  def find(data)
    @heap.each do |item|
     if item && item === data
       return item
     end
    end
  end


  def print
    @heap.each do |item|
      puts "#{item.title}: #{item.rating}\n" if item
    end
  end
end
