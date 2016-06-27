class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map {|i| verse(i)}.join("\n")
  end

  def verse(number)
      cn = ContainerNumber.new(number)
      sn = ContainerNumber.new(cn.successor)
      "#{cn.quantity.capitalize} #{cn.container} of beer on the wall, " +
      "#{cn.quantity} #{cn.container} of beer.\n" +
      "#{cn.action}, " +
      "#{sn.quantity} #{sn.container} of beer on the wall.\n"
  end

  def containter_factory(number)
    case number
    when 0
      ContainerNumber0
    else
      cont
    end.new
  end
end

class ContainerNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container
    number == 1 ? "bottle" : "bottles"
  end

  def quantity
    number == 0 ? "no more" : number.to_s
  end

  def pronoun
    number == 1 ? "it" : "one"
  end

  def action
    number == 0 ? "Go to the store and buy some more" : "Take #{pronoun} down and pass it around"
  end

  def successor
    number == 0 ? "99" : number - 1
  end
end

class ContainerNumber0
  def action
    "Go to the store and buy some more"
  end

  def successor
    "99"
  end

  def quantity
    "no more"
  end
end
