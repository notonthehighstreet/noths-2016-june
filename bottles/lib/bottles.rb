class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    cn = container_number_for(number)
    sn = container_number_for(cn.successor)
    "#{cn.to_s.capitalize} of beer on the wall, " +
    "#{cn} of beer.\n" +
    "#{cn.action}, " +
    "#{sn} of beer on the wall.\n"
  end

  def container_number_for(number)
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

  def container
    "bottles"
  end

  def pronoun
    "one"
  end

  def amount
    number.to_s
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def successor
    number - 1
  end
end

class ContainerNumber0 < ContainerNumber
  def amount
    "no more"
  end

  def action
    "Go to the store and buy some more"
  end

  def successor
    99
  end
end

class ContainerNumber1 < ContainerNumber
  def container
    "bottle"
  end

  def pronoun
    "it"
  end
end

class ContainerNumber6 < ContainerNumber
  def amount
    "1"
  end

  def container
    "six-pack"
  end
end
