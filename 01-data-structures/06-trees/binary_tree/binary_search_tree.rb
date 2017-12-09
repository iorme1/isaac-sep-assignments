
require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating < root.rating
      temp = root
      if temp.left
        insert(temp.left, node)
      else
        temp.left = node
        node.parent = temp
      end
    elsif node.rating > root.rating
      temp = root
      if temp.right
        insert(temp.right, node)
      else
        temp.right = node
        node.parent = temp
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data === nil

    if root.title === data
      return root
    elsif root.left
      find(root.left,data)
    elsif root.right
      find(root.right,data)
    end
  end

  def delete(root, data)
    temp = find(root,data)
    return nil if temp === nil

    parent_temp = temp.parent if temp.parent
    left_temp = temp.left if temp.left
    right_temp = temp.right if temp.right

    if parent_temp
      parent_temp.right = right_temp if right_temp
      parent_temp.left = left_temp if left_temp
    end
      temp.title = nil
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    while !queue.empty?
      queue.push(queue[0].left) if queue[0].left
      queue.push(queue[0].right) if queue[0].right
      puts "#{queue[0].title}: #{queue[0].rating}\n"
      queue.shift
    end
  end
end
