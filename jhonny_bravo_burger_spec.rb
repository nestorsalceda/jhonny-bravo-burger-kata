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
  def burger
    Burger.new
  end

  def cheese_burger
    WithCheese.new burger
  end

  def bacon_cheese_burger
    WithBacon.new cheese_burger
  end

  def bacon_egg_cheese_burger
    WithEgg.new bacon_cheese_burger
  end

  def egg_pickle_cheese_burger
    WithPickle.new WithEgg.new(WithCheese.new(burger))
  end

  def bacon_egg_onion_cheese_burger
    WithOnion.new bacon_egg_cheese_burger
  end
end


describe 'Jhonny Bravo\'s Burger' do
  context 'when calculating price for a' do
    before(:each) do
      @menu = Menu.new
    end

    it 'hamburger' do
      burger = @menu.burger
      expect(burger.price).to eq(3)
    end

    it 'cheese burger' do
      burger = @menu.cheese_burger
      expect(burger.price).to eq(4)
    end

    it 'bacon, cheese burger' do
      burger = @menu.bacon_cheese_burger
      expect(burger.price).to eq(6)
    end

    it 'bacon, egg, cheese burger' do
      burger = @menu.bacon_egg_cheese_burger
      expect(burger.price).to eq(7)
    end

    it 'egg, pickle, cheese burger' do
      burger = @menu.egg_pickle_cheese_burger
      expect(burger.price).to eq(5.5)
    end

    it 'egg, onion, bacon, cheese burger' do
      burger = @menu.bacon_egg_onion_cheese_burger
      expect(burger.price).to eq(8)
    end
  end
end
