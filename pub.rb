class Pub

  attr_accessor :pub_name, :till, :stock

  def initialize(pub_name, till, stock)
    @pub_name = pub_name
    @till = till
    @stock = stock
  end

  def increase_till(amount)
    @till += amount.drink[:price]
  end

  def find_by_name(name)
    for drink in @stock
      if drink == name
        return drink
      end
    end
    return "Sorry, we don't have that drink."
  end

  def remove_from_stock(name)
    found_drink = find_by_name(name)
    found_drink.drink[:stock] -= 1
    return found_drink
  end

  def sell_drink_to_customer(customer, drink)
    if check_age(customer) == true && too_drunk(customer) == false
      found_drink = remove_from_stock(drink)
      customer.add_drink(found_drink)
      customer.decrease_wallet(found_drink)
      increase_till(drink)
      customer.add_alcohol_level(drink)
    elsif check_age(customer) == false
      return "Sorry, you are too young"
    elsif too_drunk(customer) == true
      return "Sorry, you are too drunk"
    end
  end

  def check_age(customer)
    if customer.age >= 18
      true
    else
      false
    end
  end

  def too_drunk(customer)
    if customer.drunkeness >= 50
      return true
    else
      return false
    end
  end

  def stock_value(drink)
    drink_value = drink.drink[:price] * drink.drink[:stock]
  end

  def stock_value__all(drink1, drink2, drink3)
    return total_stock = (drink1.drink[:price] * drink1.drink[:stock]) + (drink2.drink[:price] * drink2.drink[:stock]) + drink3.drink[:price] * drink3.drink[:stock]
  end


end
