require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @matrix = {}
    @width = width
    @height = height
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[pixel] = [x, y]
  end

  def at(x, y)
    @matrix.key([x,y]) 
  end

  private

  def inbounds(x, y)
  end

end
