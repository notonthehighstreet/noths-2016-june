class House
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

    attr_reader :data, :prefix

    def initialize(orderer: FixedOrderer.new, prefixer: DefaultPrefixer.new)
      @data   = orderer.order(DATA)
      @prefix = prefixer.prefix
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
    data
  end
end

class RandomOrderer
  def order(data)
    data.shuffle
  end
end

class DefaultPrefixer
  def prefix
    "This is"
  end
end

class PiratePrefixer
  def prefix
    "Aree this be"
  end
end


# puts House.new(orderer: RandomOrderer.new).line(12)

puts House.new(orderer: RandomOrderer.new, prefixer: PiratePrefixer.new).line(12)
