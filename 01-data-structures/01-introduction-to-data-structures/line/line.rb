class Line
  attr_accessor :members

  def initialize
    @members = []
  end

  def join(person)
    members << person
  end

  def leave(person)
    @members = members - [person]
  end

  def front
    members[0]
  end

  def middle
   members[(members.length / 2)]
  end

  def back
    members.last
  end

  def search(person)
    name = ""
    members.each { |p| name = p if p === person }
    name if name != ""
  end

  private

  def index(person)
  end
end
