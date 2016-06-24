# conversion methods on core - is okay
class Integer
  def to_container_number
    ContainerNumber.for(self)
  end
end

class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  # container_number_like_object
  def verse(number)
    container_number      = ContainerNumber.for(number)
    "#{container_number.capitalize} of beer on the wall, " +
    "#{container_number} of beer.\n" +
    "#{container_number.action}, " +
    "#{container_number.successor} of beer on the wall.\n"
  end
end

class ContainerNumber
  attr_reader :number

  # THIS IS THE SEAM
  # throw the number over the wall
  # and get a container number back
  # Once you have a factory
  # YOU MUST USE THE FACTORY!!!
  # container_number_for <= name helps for the next part
  # Move into class method, rather than own class
  # TAG YOUR SHIMS
  def self.for(number)
    return number if number.kind_of?(ContainerNumber)
    case number
    when 0
      ContainerNumber0
    when 1
      ContainerNumber1
    when 6
      ContainerNumber6
    else
      ContainerNumber
    end.new(number)
  end

  def initialize(number)
    @number = number
  end

  def to_s
    "#{amount} #{container}"
  end

  def capitalize
    to_s.capitalize
  end

  def amount
    number.to_s
  end

  def container
    "bottles"
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    "one"
  end

  def successor
    (number - 1).to_container_number
  end
end

class ContainerNumber0 < ContainerNumber
  def successor
    99.to_container_number
  end
  def action
    "Go to the store and buy some more"
  end
  def amount
    "no more"
  end
end

class ContainerNumber1 < ContainerNumber
  def pronoun
    "it"
  end
  def container
    "bottle"
  end
end

class ContainerNumber6 < ContainerNumber
  def container
    "six-pack"
  end
  def amount
    "1"
  end
end
