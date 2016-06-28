require 'byebug'
class Checkout

  PRODUCTS = {
              "001" => BigDecimal("9.25"),
              "002" => BigDecimal("45.00"),
              "003" => BigDecimal("19.95")
              }

  attr_reader :basket, :percentage, :multibuy

  def initialize(percentage, multibuy)
    @basket = Hash.new(0)
    @percentage = percentage
    @multibuy = multibuy
  end

  def scan(item, quantity = 1)
    basket[item]+= quantity
  end

  def total
    before_discount - discount(before_discount)
  end

  private

  def before_discount
    basket.map {|key, value| PRODUCTS[key] * value }.reduce(:+)
  end

  def discount(before_discount)
    percent(before_discount) + multi
  end

  def percent(before_discount)
    if before_discount >= percentage[:threshold]
      before_discount * percentage[:percentage] / 100
    else
      0
    end
  end

  def multi

    if basket[multibuy[:item]] >= multibuy[:quantity]
       basket[multibuy[:item]] * multibuy[:discount]
    else
      0
    end
  end
end
