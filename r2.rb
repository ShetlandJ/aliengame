module ItemTypes
  FLAMETHROWER = "Flamethower"
  FLAMEFUEL = "units of flamer fuel"
  ION_TORCH = "Ion Torch"
  MEDKIT = "Medkit"
end

class Inventory
  def initialize()
    @items = []
  end
  
  def has(item_id)
    return @items.include? item_id
  end

  def add(item)
      if !has(item)
          puts "you picked up #{item}"
          @items.push(item) 
      end
  end

  def show()
    puts @items
  end

end
