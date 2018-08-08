require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../drink.rb")

class DrinkTest < MiniTest::Test
  def setup
    @drink1 = Drink.new("Beer", 3.0, 1)
  end

  def test_has_a_name
    assert_equal("Beer", @drink1.name)
  end

  def test_beer_has_price
    assert_equal(3, @drink1.price)
  end

  def test_drink_has_alcohol_lvl
    assert_equal(1, @drink1.alcohol_lvl)
  end
end
