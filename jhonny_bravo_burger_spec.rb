class Burger
  attr_reader :price
  @@PRICES = {
    :cheese => 1,
    :bacon => 2,
    :egg => 1,
    :pickle => 0.5,
    :onion => 1
  }
  def initialize
    @price = 3
  end

  def add(*ingredients)
    ingredients.each do |ingredient|
      @price += @@PRICES[ingredient]
    end
  end
end

describe 'Jhonny Bravo\'s Burger' do
  context 'when calculating price for a' do
    before(:each) do
      @burger = Burger.new
    end

    it 'hamburger' do
      expect(@burger.price).to eq(3)
    end

    it 'cheese burger' do
      @burger.add(:cheese)
      expect(@burger.price).to eq(4)
    end

    it 'bacon, cheese burger' do
      @burger.add(:cheese, :bacon)
      expect(@burger.price).to eq(6)
    end

    it 'bacon, egg, cheese burger' do
      @burger.add(:bacon, :egg, :cheese)
      expect(@burger.price).to eq(7)
    end

    it 'egg, pickle, cheese burger' do
      @burger.add(:egg, :pickle, :cheese)
      expect(@burger.price).to eq(5.5)
    end

    it 'egg, onion, bacon, cheese burger' do
      @burger.add(:egg, :onion, :bacon, :cheese)
      expect(@burger.price).to eq(8)
    end
  end
end
