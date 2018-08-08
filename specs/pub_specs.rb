require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../pub")
require_relative("../drink")
require_relative("../customer")

class PubTest < MiniTest::Test
  def setup

    @drink1 = Drink.new("Beer", 3.0, 1)
    @drink2 = Drink.new("Ale", 4.0, 1)
    @drink3 = Drink.new("Wine", 5.0, 2)
    @drink4 = Drink.new("Vodka", 6.0, 3)

    drinks = [@drink1, @drink2, @drink3, @drink4]

    @customer1 = Customer.new("Allan", 10.0, 12)
    @customer2 = Customer.new("John", 10.0, 19)
    @customer3 = Customer.new("Arnold", 10.0, 40, 10)

    @pub = Pub.new("CodeDrinks", 500.0, drinks)
  end

  def test_has_a_name
    assert_equal("CodeDrinks", @pub.name)
  end

  def test_has_till
    assert_equal(500, @pub.till)
  end

  def test_has_drinks
    assert_equal(4, @pub.drinks.count)
  end

  # def test_find_drink_by_name
  #   assert_equal(@drink1, @pub.find_drink("Beer"))
  # end
  #
  # def test_drink_by_name__not_found
  #   assert_equal("We don't have that drink", @pub.find_drink("ygiy"))
  # end

  def test_add_money
    @pub.add_money(50)
    assert_equal(550, @pub.till)
  end

  def test_remove_drink
    @pub.remove_drink(@drink1)
    assert_equal(3, @pub.drinks.count)
  end

  def test_sell_drink
    @pub.sell_drink(@drink1, @customer2)
    assert_equal(503, @pub.till)
    assert_equal(3, @pub.drinks.count)
  end

  def test_sell_drink__too_young_to_sell
    @pub.sell_drink(@drink1, @customer1)
    assert_equal(500, @pub.till)
    assert_equal(4, @pub.drinks.count)
  end

  def test_check_age
    assert_equal(false, @pub.check_age(@customer1))
  end

  def test_check_age__pass
    assert_equal(true, @pub.check_age(@customer2))
  end

  def test_sober__yes
    assert_equal(true, @pub.sober?(@customer2))
  end

  def test_sober__no
    assert_equal(false, @pub.sober?(@customer3))
  end

end
