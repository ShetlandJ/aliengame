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

def transit_room()
  puts "You're in the main transit hub of Sevastapol"
  puts "Which section do you want travel to?"
  puts "If you want a list of destinations, type 'map'"

  prompt()
  choice = gets.chomp()

  if choice == "map"
    puts "You can travel to Medical (M), Engineering (E) or Scimed Tower (ST). Travel to Seegson Synthetics (SS) is currently unavailable"
    return :transit_room

    elsif choice == "Medical" or  choice == "M" or choice == "(M)" 
      puts "Transferring to Medical."
      puts "Thank you for choosing Sevastapol HyperLink"
      return :medical

    elsif choice == "Engineering" or choice ==  "E" or choice == "(E)" 
        puts "Transferring to Engineering."
        puts "Thank you for choosing TSSST-. Error. Please reboot Voice Systems."
        return :engineering

    elsif choice == "Scimed Tower" or choice == "ST" or choice == "(ST)" 
         puts "Transferring to the Scimed Tower."
         puts "Upgrade your Working Joe to the latest technology today!"
         return :scimed_tower 

    elsif choice == "Seegson Synthetics" or choice == "SS" or choice == "(SS)" 
         puts "The power is out, I can't go here now. I'll have to go somewhere else."
         return :transit_room 

    else 
        puts "Input not recognised."
       return :transit_room
  end
end
end

def medical()
  puts "You have arrived in Medical"
  puts "You see Flame Thrower fuel, do you pick up? (P)"
  puts "Which room do you want to enter?"
  puts "The dimly lid surgeon's office (SO) that's absolutely drowning in blood or the dark spooky corridor (SC)?"
  puts "Alternatively, you can always return (R) to the transit room"
  prompt()
  choice = gets.chomp()

  if choice == "SO" or choice == "(SO)"
    puts "You proceed into the surgeon's office and a facehugger kills you"
    return :death

  elsif choice == "SC" or choice == "(SC)"
    puts "Your proceed into the darkened corridor and the alien grabs you"
    return :death

  elsif choice == "R" or choice == "(R)"
    puts "You quickly jump back through the open transit doors in time and you head back to the Transit Room"
    return :transit_room

  else 
    puts "That's not a valid choice"
  end

  
end

def engineering()
  puts "You have arrived in Engineering"
  puts "Which room do you want to enter?"
  puts "The reactor room (RR) that's has an unusual dripping sound coming from within or the vent that has acid corrosion around it (V)?"
  puts "Alternatively, you can always return (R) to the transit room"
  prompt()
  choice = gets.chomp()

  if choice == "RR" or choice == "(RR)"
    puts "You walk into the Reactor Room and are met with an army of Joes who procee to Michael Myers you to death"
    return :death

  elsif choice == "V" or choice == "(V)"
    puts "As you crawl into the vent, the acid drips onto the control panel and the vent closes, slicing you in half."
    return :death

  elsif choice == "R" or choice == "(R)"
    puts "You quickly jump back through the open transit doors in time and you head back to the Transit Room"
    return :transit_room

    else 
      puts "That's not a valid choice"
    
  end
end

  def scimed_tower()
    puts "You have arrived at the Scimed Tower"
    puts "Where do you want to go?"
    puts "You can hear faint human voices through the Crew Chambers (CC) door, but you can only hear footsteps through the Rec Room door (RR) "
    puts "Alternatively, you can always return (R) to the transit room"
    prompt()
    choice = gets.chomp()

    if choice == "CC" or choice == "(CC)"
      puts "As the door opens the last thing you hear is a gunshot which hits you in the head and makes you dead."
      return :death

    elsif choice == "RR" or choice == "(R)"
      puts "You enter the Rec Room only to discover that footprints you heard were of the alien who grabs you and does that face thing."
      return :death

    elsif choice == "R" or choice == "(R)"
      puts "You quickly jump back through the open transit doors in time and you head back to the Transit Room"
      return :transit_room

      else 
        puts "That's not a valid choice"
      
    end
  end

a_game = Game.new(:transit_room)
a_game.play()
