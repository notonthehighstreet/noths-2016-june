class House
  attr_reader  :prefix

  def initialize(orderer: DefaultOrderer.new, prefix: DefaultPrefix.new)
    @data = orderer.order(data)
    @prefix = prefix.apply
  end

  def line(number)
    "#{prefix} #{line_retrival(number)}"
  end

  def line_retrival(number)
    data.last(number).join(' ')
  end

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end

  def data
    [
      "the horse and the hound and the horn that belonged to",
      "the farmer sowing his corn that kept",
      "the rooster that crowed in the morn that woke",
      "the priest all shaven and shorn that married",
      "the man all tattered and torn that kissed",
      "the maiden all forlorn that milked",
      "the cow with the crumpled horn that tossed",
      "the dog that worried",
      "the cat that killed",
      "the rat that ate",
      "the malt that lay in",
      "the house that Jack built.\n"
    ]
  end
end

class DefaultOrderer
  def order(data)
    data
  end
end

class RandomOrderer
  def order(data)
    data.shuffle
  end
end

class DefaultPrefix
  def apply
    "This is"
  end
end

class PiratePrefix
  def apply
    "Ahoooy there"
  end
end

class JackBuiltEnding
  def order(data)
    final = data.pop
    data.shuffle << final
  end
end
