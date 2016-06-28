require_relative '../lib/checkout.rb'

describe Checkout do
  subject(:checkout) {described_class.new({percentage: 10, threshold: BigDecimal.new("60")}, {quantity: 2, item: "001", discount: BigDecimal("0.25")})}

  describe "#scan" do
    it 'can scan an item' do
      checkout.scan("001", 2)
      expect(checkout.basket).to eq({"001" => 2})
    end
  end

  describe "#total" do
    it "can total up an order" do
      checkout.scan("001", 3)
      expect(checkout.total).to eq(BigDecimal.new("27"))
    end

    it "applies a percentage discount" do
      checkout.scan("002", 2)
      expect(checkout.total).to eq(BigDecimal.new("81"))
    end

    it "applies a multibuy discount" do
      checkout.scan("001", 2)
      expect(checkout.total).to eq(BigDecimal.new("18"))
    end
  end
end
