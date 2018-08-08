require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../drink.rb")

class DrinkTest < MiniTest::Test
  def setup
    @drink1 = Drink.new("Beer", 3)
  end

  def test_has_a_name
    assert_equal("Beer", @drink1.name)
  end
end
