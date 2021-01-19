require_relative "room"

class Hotel

   attr_reader :rooms

  def initialize(name, roomsHash)
     @name = name
     @rooms = Hash.new
     roomsHash.each { |room, capacity| @rooms[room] = Room.new(capacity) }
  end

  def name
     @name.split.map(&:capitalize).join(" ")
  end

  def room_exists?(room)
     @rooms.has_key?(room)
  end


  def check_in(person,room)
   if !room_exists?(room)
      puts "sorry room does not exits, please try another room"
      return false
   end

   success = @rooms[room].add_occupant(person)
   if success
      puts "check in successfull"
   else
      puts "sorry! room is full, please try another room"
   end
  end

  def has_vacancy?
     @rooms.values.any? { |room| !room.full? }
  end

  def list_rooms
     @rooms.each { |name, room| puts "#{name} #{room.available_space}" }
  end

end

hotel1 = Hotel.new("hotel1 dono", "one"=>1, "two"=>1,"three"=>1)

p hotel1.check_in("p1","one")
p hotel1.check_in("p2","two")
p hotel1.check_in("p3","three")

p hotel1.list_rooms