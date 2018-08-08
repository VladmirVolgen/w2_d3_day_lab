class Customer

  attr_reader :name, :wallet, :age, :drunkenness_lvl

  def initialize(name, wallet, age, drunkenness_lvl = 0)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness_lvl = drunkenness_lvl
  end

  # def buy_drink(drink, pub)
  #   # return "we don't have that drink" if drink is not on the pub
  #   # search for drink object
  #   drink = pub.find_drink(drink_name)
  #   # return drink if drink == drink.is_str
  #   @wallet -= drink.price
  # end

  # change this
  def buy_drink(drink)
    @wallet -= drink.price
    @drunkenness_lvl += drink.alcohol_lvl

  end


end
