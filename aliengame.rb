require_relative 'r2'

class Game

  def initialize(start)
    @quips = [
      "You died. You suck at this.",
      "Nice job, you died...",
      "You are such a loser",
      "Your skill level? 'Brian at Alien Isolation'"
    ]
  @start = start
  puts "in init @start = " + @start.inspect
  end

  def prompt()
    print "> "
  end

def play()
  puts "@start => " + @start.inspect
  next_room = @start

  while true
    puts "\n---------"
    room = method(next_room)
    next_room = room.call()
  end
end

def death()
  puts @quips[rand(@quips.length())]
  Process.exit(1)
end

$inventory = Inventory.new()
$alien = Alien.new()

def arrival()
  puts "You're in the main transit lobby of Sevastapol"
  puts "To your left is Working Joe missing its head"
  puts "crumpled in a heap. Next to its body is a"
  puts "Flamethrower and flamer fuel. Do you want to pick it up?"

  prompt()
  item_pickup = gets.chomp.downcase

  if item_pickup == "yes"
    $inventory.add(ItemTypes::FLAMETHROWER)
    puts "You head to the Sevastapol Transit Station up ahead."
  else
    puts "You head to the Sevastapol Transit Station"
    puts "deciding against prying the Flamethrower from"
    puts "The Joe's hands"
  end
return :transit_room 

end

def transit_room
  puts "Which section do you want travel to?"
  puts "If you want a list of destinations, type 'map'"
  puts "To check your inventory, type I"
  prompt()
  choice = gets.chomp.downcase

  if choice == "map"
    puts "You can travel to Medical (M), Engineering (E) or Scimed Tower (ST). Travel to Seegson Synthetics (SS) is currently unavailable"
    return :transit_room

    elsif choice == "m" 
      puts "Transferring to Medical."
      puts "Thank you for choosing Sevastapol HyperLink"
      return :medical

    elsif choice == "e" 
        puts "Transferring to Engineering."
        puts "Thank you for choosing TSSST-. Error. Please reboot Voice Systems."
        return :engineering

    elsif choice == "st" 
         puts "Transferring to the Scimed Tower."
         puts "Upgrade your Working Joe to the latest technology today!"
         return :scimed_tower 

    elsif choice == "ss" 
         puts "The power is out, I can't go here now. I'll have to go somewhere else."
         return :transit_room 

    elsif choice == "i"
        puts "In your pack, you currently have have the"
        puts "following items:"
        $inventory.show()
        return :transit_room
    else 
        puts "Input not recognised."
       return :transit_room
  end
end
end

def medical()
  puts "You have arrived in Medical"

  $alien.alien_fight()

  puts "You look around you and see several rooms."
  puts "Which room do you want to enter?"
  puts "The dimly lid surgeon's office (so) that's absolutely drowning in blood or the dark spooky corridor (sc)?"
  puts "Alternatively, you can always return (r) to the transit room"

  prompt()
  choice = gets.chomp.downcase

  if choice == "so"
    puts "You enter the surgeon's office, your feet sticking to"
    puts "the floor."
    return :death
    
  elsif choice == "sc"
    puts "Your proceed into the darkened corridor and the alien grabs you"
    return :death

  elsif choice == "r"
    puts "You quickly jump back through the open transit doors in time and you head back to the Transit Room"
    return :transit_room

  elsif choice == "i"
      puts "In your pack, you currently have have the"
      puts "following items:"
      $inventory.show()
    return :medical

  else 
    puts "That's not a valid choice"
    return :medical
  end

  
end

def engineering()
  puts "You have arrived in Engineering"
  puts "Which room do you want to enter?"
  puts "The reactor room (rr) that's has an unusual dripping sound coming from within or the vent that has acid corrosion around it (v)?"
  puts "Alternatively, you can always return (r) to the transit room"
  prompt()
  choice = gets.chomp.downcase

  if choice == "rr"
    puts "You walk into the Reactor Room and are met with an army of Joes who procee to Michael Myers you to death"
    return :death

  elsif choice == "v"
    puts "As you crawl into the vent, the acid drips onto the control panel and the vent closes, slicing you in half."
    return :death

  elsif choice == "r"
    puts "You quickly jump back through the open transit doors in time and you head back to the Transit Room"
    return :transit_room

  elsif choice == "i"
      puts "In your pack, you currently have have the"
      puts "following items:"
      $inventory.show()
    return :engineering

    else 
      puts "That's not a valid choice"
      return :engineering
    
  end
end

  def scimed_tower()
    puts "You have arrived at the Scimed Tower"
    puts "Where do you want to go?"
    puts "You can hear faint human voices through the Crew Chambers (cc) door, but you can only hear footsteps through the Rec Room door (rr) "
    puts "Alternatively, you can always return (r) to the transit room"
    prompt()
    choice = gets.chomp.downcase

    if choice == "cc"
      puts "As the door opens the last thing you hear is a gunshot which hits you in the head and makes you dead."
      return :death

    elsif choice == "rr"
      puts "You enter the Rec Room only to discover that footprints you heard were of the alien who grabs you and does that face thing."
      return :death

    elsif choice == "r"
      puts "You quickly jump back through the open transit doors in time and you head back to the Transit Room"
      return :transit_room

    elsif choice == "i"
        puts "In your pack, you currently have have the"
        puts "following items:"
        $inventory.show()
      return :scimed_tower

      else 
        puts "That's not a valid choice"
        return :scimed_tower
    end
  end

a_game = Game.new(:arrival)
a_game.play()
