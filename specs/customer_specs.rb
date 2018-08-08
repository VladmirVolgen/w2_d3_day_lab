require("minitest/autorun")
require("minitest/rg")
require("pry")
require_relative("../pub")
require_relative("../customer")
require_relative("../drink")

class CustomerTest < MiniTest::Test

  def setup
    @drink1 = Drink.new("Beer", 3.0, 1)
    @drink2 = Drink.new("Ale", 4.0, 1)
    @drink3 = Drink.new("Wine", 5.0, 2)
    @drink4 = Drink.new("Vodka", 6.0, 3)

    @customer1 = Customer.new("Alvaro", 10.0, 28)
    @customer2 = Customer.new("Mindy", 1.0, 16)


  end

  def test_has_name
    assert_equal("Alvaro", @customer1.name)
  end

  def test_has_wallet
    assert_equal(10, @customer1.wallet)
  end

  def test_customer_has_age
    assert_equal(28, @customer1.age)
  end

  def test_customer_has_drunkenness_lvl
    assert_equal(0, @customer1.drunkenness_lvl)
  end

  # def test_buy_drink
  #   @customer1.buy_drink(@drink1, @pub)
  #   assert_equal(7, @customer1.wallet)
  #   assert_equal(3, @pub.drinks.count)
  #   assert_equal(303, @pub.till)
  # end

  def test_buy_drink
    @customer1.buy_drink(@drink1)
    assert_equal(7.0, @customer1.wallet)
    assert_equal(1, @customer1.drunkenness_lvl)
  end

  def test_buy_drink__no_money
    @customer2.buy_drink(@drink3)
    assert_equal(1.0, @customer2.wallet)
    assert_equal(0, @customer2.drunkenness_lvl)
  end

  def test_can_buy__true
    assert_equal(true, @customer1.can_buy?(@drink1))
  end

  def test_can_buy__false
    assert_equal(false, @customer2.can_buy?(@drink4))
  end





end
