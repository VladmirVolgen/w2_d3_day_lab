class Pub

attr_reader :name, :till, :drinks

  def initialize(name, till, drinks)

    @name = name
    @till = till
    @drinks = drinks
  end

  def add_money(amount)
    @till += amount
  end

  def remove_drink(drink)
    @drinks.delete(drink)
  end

#I could use some sort of sort answer instead of nils if I wanted to do a real app, that way I would know what kind of "nils" I return and I could print an answer
  def sell_drink(drink, customer)
    if check_age(customer) == false
     return nil
    elsif sober?(customer) == false
      return nil
    end

    if @drinks.include?(drink)
      customer.buy_drink(drink)
      add_money(drink.price)
      remove_drink(drink)
    end

# Linked to the end question

    # if find_drink?(drink.name)
    #   customer.buy_drink(drink)
    #   add_money(drink.price)
    #   remove_drink(drink)
    # end


  end

  def check_age(customer)
    return  customer.age >= 18
  end

  def sober?(customer)
    return customer.drunkenness_lvl <= 5
  end

# Is there a way to look for the drink name, and that way retrieve one of the objects
  # def find_drink?(drink_name)
  #
  #   for drink in @drinks
  #     if drink.name == drink_name
  #       return drink
  #     else
  #       return false
  #     end
  #   end
  # end



end
