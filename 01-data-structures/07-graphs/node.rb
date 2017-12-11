class Node
  attr_accessor :name
  attr_accessor :film_actor_hash

  def initialize(name)
    @name = name
    @film_actor_hash = {}
  end
end


def find_kevin_bacon(name,film_count = 0)
  name.film_actor_hash.each do |movie, people|
    film_count += 1

    people.each do |person|
     if person === "kevin_bacon"
        connection = "Found Kevin Bacon in #{film_count} films"
        return connection
     end
   end
   if film_count === 6
     something = "Can't find Kevin Bacon Connection"
     return connection
   else
     return find_kevin_bacon(people[0], film_count)
   end
 end
end





name1 = Node.new("name1")
name2 = Node.new("name2")
name3 = Node.new("name3")
name4 = Node.new("name4")
name5 = Node.new("name5")
name6 = Node.new("name6")
name7 = Node.new("name7")
name8 = Node.new("name8")
name9 = Node.new("name9")


name1.film_actor_hash["The Matrix"] = [name9, name1]
name2.film_actor_hash["District 9"] = [name6, name3, name5]
name3.film_actor_hash["Pacific Rim"] = [name4, name5]
name4.film_actor_hash["Braveheart"] = [name1,name7]
name5.film_actor_hash["Star Wars: Return of the Jedi"] = [name4,name3,name2]
name6.film_actor_hash["Donnie Darko"] = [name9,name2,name1]
name7.film_actor_hash["Star Wars: A New Hope"] = [name8,name2]
name8.film_actor_hash["Footloose"] = [name3,name2,name1, "kevin_bacon"]
name9.film_actor_hash["Mystic River"] = [name6, "kevin_bacon",name4]


find_kevin_bacon(name6)
