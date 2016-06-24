# FEEL ENTITLED: Should be able to send messages to objects
# Wrap objects we can't change


class Data
  # PRIMITIVE OBSESSION
  DATA = [
    'the horse and the hound and the horn that belonged to',
    'the farmer sowing his corn that kept',
    'the rooster that crowed in the morn that woke',
    'the priest all shaven and shorn that married',
    'the man all tattered and torn that kissed',
    'the maiden all forlorn that milked',
    'the cow with the crumpled horn that tossed',
    'the dog that worried',
    'the cat that killed',
    'the rat that ate',
    'the malt that lay in',
    'the house that Jack built']
  def initialize
  end
  def data
    DATA
  end
end

# actor <that blah>action;

class House

  # PRIMITIVE OBSESSION
  # actor <that blah>action;


  attr_reader :data, :prefix
  # WATCH OUT IF PASSING 3 PARAMETERS - THIS MIGHT BE TURNING INTO A GOD CLASS
  def initialize(orderer: FixedOrderer.new, prefixer: NormalPrefixer.new)
    # MAKE THINGS DIFFERENT BY TAKING THINGS OUT BY THE SAME
    # PRIMITIVE OBSESSION - we injected a dependency
    @data = orderer.order(Data.new.data)
    @prefix = prefixer.speak
  end

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end

  def line(num)
    "#{prefix} #{phrase(num)}.\n"
  end

  def phrase(num)
    data.last(num).join(' ')
  end
end

class FixedOrderer
  def order(data)
    data.itself
  end
end

# CLASS METHODS RESIST REFACTORING
class RandomOrderer
  def order(data)
    data.shuffle
  end
end

class PiratePrefixer
  def speak
    "Aargh matey, this thing be"
  end
end

class NormalPrefixer
  def speak
    "This is"
  end
end

class RandomWithJackEnding
  def order(data)
    local_data = data.dup
    last_line = local_data.pop
    local_data.shuffle.push(last_line)
  end
end

# puts House.new(orderer: RandomOrderer.new).line(12)
# puts House.new(orderer: FixedOrderer.new).line(12)
puts House.new(orderer: FixedOrderer.new, prefixer: PiratePrefixer.new).line(12)
puts House.new(orderer: RandomWithJackEnding.new).line(12)
# INHERITANCE IS FOR SPECIALIZATION, NOT SHARED FUNCTIONALITY
# SWITCH TO COMPOSITION WITH ITS SPECIALIZATION?



# How does spotting this work if you are doing TDD?
#
