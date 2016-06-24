class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    container_number      = container_number_factory(number)
    next_container_number = container_number_factory(container_number.successor)
    "#{container_number.capitalize} of beer on the wall, " +
    "#{container_number} of beer.\n" +
    "#{container_number.action}, " +
    "#{next_container_number} of beer on the wall.\n"
  end

  def container_number_factory(number)
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
end

class ContainerNumber
  attr_reader :number

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
    number - 1
  end
end

class ContainerNumber0 < ContainerNumber
  def successor
    99
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
