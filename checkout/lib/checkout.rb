require 'byebug'

class Checkout

  PRODUCTS = {
              "001" => BigDecimal("9.25"),
              "002" => BigDecimal("45.00"),
              "003" => BigDecimal("19.95")
              }

  attr_reader :basket, :promotions

  def initialize(promotions)
    @basket = Hash.new(0)
    @promotions = promotions
  end

  def scan(item, quantity = 1)
    basket[item]+= quantity
  end

  def total
    current = before_discount
    after_discount(current)
  end

  private

  def before_discount
    basket.map {|key, value| PRODUCTS[key] * value }.reduce(:+)
  end

  def after_discount(current)
    promotions.reduce(current) do |current, promotion|
      current - promotion.apply({total: before_discount, basket: basket})
    end
  end

end

class PercentDiscount
  def initialize(percentage:, threshold:)
    @percentage = percentage
    @threshold = threshold
  end

  def apply(args)
    eligible(args[:total]) ? deduction(args[:total]) : 0
  end


  private
  attr_reader :threshold, :percentage
  def eligible(before_discount)
    before_discount >= threshold
  end

  def deduction(before_discount)
    before_discount * percentage / 100
  end
end

class MultiDiscount
  def initialize(quantity:, item:, discount:)
    @quantity = quantity
    @item = item
    @discount = discount
  end

  def apply(args)
    eligible(args[:basket]) ? deduction(args[:basket]) : 0
  end

  private
  attr_reader :quantity, :item, :discount

  def eligible(basket)
    basket[item] >= quantity
  end

  def deduction(basket)
    basket[item] * discount
  end
end
