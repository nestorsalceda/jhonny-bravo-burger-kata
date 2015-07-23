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

class Menu
  def initialize
    @burger = Burger.new
    inject_build_methods
  end

  def cook
    @burger
  end

  private

  def inject_build_methods
    {:cheese => WithCheese, :bacon => WithBacon, :egg => WithEgg, :onion => WithOnion, :pickle => WithPickle}.each do |key, value|
      define_singleton_method "with_#{key}".to_sym do
        @burger = value.new @burger
        self
      end
    end
  end
end

describe 'Jhonny Bravo\'s Burger' do
  context 'when calculating price for a' do
    before(:each) do
      @menu = Menu.new
    end

    it 'hamburger' do
      burger = @menu.cook
      expect(burger.price).to eq(3)
    end

    it 'cheese burger' do
      burger = @menu.with_cheese.cook
      expect(burger.price).to eq(4)
    end

    it 'bacon, cheese burger' do
      burger = @menu.with_bacon.with_cheese.cook
      expect(burger.price).to eq(6)
    end

    it 'bacon, egg, cheese burger' do
      burger = @menu.with_bacon.with_egg.with_cheese.cook
      expect(burger.price).to eq(7)
    end

    it 'egg, pickle, cheese burger' do
      burger = @menu.with_egg.with_pickle.with_cheese.cook
      expect(burger.price).to eq(5.5)
    end

    it 'egg, onion, bacon, cheese burger' do
      burger = @menu.with_egg.with_onion.with_bacon.with_cheese.cook
      expect(burger.price).to eq(8)
    end
  end
end
