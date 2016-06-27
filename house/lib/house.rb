class House
  attr_reader :data

  def initialize
    @data = [
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

  def line(number)
    "This is #{line_retrival(number)}"
  end

  def line_retrival(number)
    data.last(number).join(' ')
  end

  def recite
    1.upto(12).collect {|i| line(i)}.join("\n")
  end
end
