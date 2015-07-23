class Burger
  def price
    3
  end
end

class With
  def initialize(burger)
    @burger = burger
  end
end

class WithCheese < With
  def price
    1 + @burger.price
  end
end

class WithBacon < With
  def price
    2 + @burger.price
  end
end

class WithEgg < With
  def price
    1 + @burger.price
  end
end

class WithPickle < With
  def price
    0.5 + @burger.price
  end
end

class WithOnion < With
  def price
    1 + @burger.price
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
      @burger = WithCheese.new(@burger)

      expect(@burger.price).to eq(4)
    end

    it 'bacon, cheese burger' do
      @burger = WithBacon.new(WithCheese.new(@burger))
      expect(@burger.price).to eq(6)
    end

    it 'bacon, egg, cheese burger' do
      @burger = WithBacon.new(WithEgg.new(WithCheese.new(@burger)))
      expect(@burger.price).to eq(7)
    end

    it 'egg, pickle, cheese burger' do
      @burger = WithPickle.new(WithEgg.new(WithCheese.new(@burger)))
      expect(@burger.price).to eq(5.5)
    end

    it 'egg, onion, bacon, cheese burger' do
      @burger = WithEgg.new(WithOnion.new(WithBacon.new(WithCheese.new(@burger))))
      expect(@burger.price).to eq(8)
    end
  end
end
