class Bottles

  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).map { |i| verse(i) }.join("\n")
  end

  def verse(number)
    "#{how_many(number).capitalize} #{beer_holder(number)} of beer on the wall, #{how_many(number)} #{beer_holder(number)} of beer.\n#{mission(number)}, #{how_many(succ(number))} #{beer_holder(succ(number))} of beer on the wall.\n"
  end

  def mission(number)
    if number == 0
      "Go to the store and buy some more"
    else
      "Take #{consignment(number)} down and pass it around"
    end
  end

  def succ(number)
    if number == 0
      99
    else
      number - 1
    end
  end

  def beer_holder(number)
    if number == 1
      "bottle"
    else
      "bottles"
    end
  end

  def consignment(number)
    if number == 1
      "it"
    else
      "one"
    end
  end

  def how_many(number)
    if number == 0
      "no more"
    else
      number.to_s
    end
  end

end
