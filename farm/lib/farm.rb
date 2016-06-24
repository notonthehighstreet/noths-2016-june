# You can't mock things you don't own

using Article

# Why not override Animal.all  ?

class FakeValidAnimal
  def self.all(ids)

  end
end

class ValidAnimal
  # outerface for each interface
  def self.all(ids)
    Animal.all(ids).map {|animal| animal || NilAnimal.new}
  end
end

class Farm
  attr_reader :animals

  def initialize(animals)
    # reduce the conditional to one place
    @animals = animals.map {|animal| animal || NilAnimal.new}
  end

  def lyrics
    animals.map {|animal| verse(animal) }.join("\n\n")
  end

  def verse(animal)
    sound   = animal.sound
    species = animal.species
    "Old MacDonald had a farm, E-I-E-I-O,\n" +
    "And on that farm he had #{species.articlize}, E-I-E-I-O,\n" +
    "With #{sound.articlize} #{sound} here " +
      "and #{sound.articlize} #{sound} there,\n" +
    "Here #{sound.articlize}, there #{sound.articlize}, " +
      "everywhere #{sound.articlize} #{sound},\n" +
    "Old MacDonald had a farm, E-I-E-I-O."
  end
end

class NilAnimal
  def sound
    "<silence>"
  end
  def species
    "<silence>"
  end
end
