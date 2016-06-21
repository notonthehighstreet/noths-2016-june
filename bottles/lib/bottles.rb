class Bottles
  def verse(number_of_bottles)

    "#{n_bottles(number_of_bottles)} of beer on the wall, " +
      "#{n_bottles(number_of_bottles)} of beer.\n" +
      "Take #{is_last_bottle?(number_of_bottles)? 'it' : 'one'} down and pass it around, " +
      "#{n_bottles(number_of_bottles - 1)} of beer on the wall.\n".capitalize
  end

  def n_bottles(number_of_bottles)#, is_first_sentence = false)
    # if is_first_sentence
    #   "#{number_of_bottles == 0 ? 'No more' : number_of_bottles} bottle#{'s' unless is_last_bottle?(number_of_bottles)}"
    # else
      "#{number_of_bottles == 0 ? 'no more' : number_of_bottles} bottle#{'s' unless is_last_bottle?(number_of_bottles)}"
    # end
  end

  def is_last_bottle?(number_of_bottles)
    if number_of_bottles == 1
      return true
    else
      return false
    end
  end
end
