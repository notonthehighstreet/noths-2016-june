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
    percentage.apply(before_discount) + multibuy.apply(basket)
  end
end

class PercentDiscount
  attr_reader :threshold, :percentage
  def initialize(percentage:, threshold:)
    @percentage = percentage
    @threshold = threshold
  end

  def apply(before_discount)
    if before_discount >= threshold
      before_discount * percentage / 100
    else
      0
    end
  end
end

class MultiDiscount
  attr_reader :quantity, :item, :discount

  def initialize(quantity:, item:, discount:)
    @quantity = quantity
    @item = item
    @discount = discount
  end

  def apply(basket)
    if basket[item] >= quantity
       basket[item] * discount
    else
      0
    end
  end
end
