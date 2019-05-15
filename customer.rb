class Customer

  attr_accessor :name, :wallet, :drunkeness, :age, :drinks

  def initialize(name, wallet, drunkeness, age)
    @name = name
    @wallet = wallet
    @drunkeness = drunkeness
    @age = age
    @drinks = []
  end

  def does_wallet_have_funds(amount)
    if amount <= @wallet
      true
    else
      false
    end
  end

  def decrease_wallet(amount)
    @wallet -= amount.drink[:price]
  end

  def add_drink(drink)
    @drinks.push(drink)
  end

  def add_alcohol_level(drink)
    @drunkeness += drink.drink[:alcohol_level]
  end

  def decrease_drunkeness_level(food)
    @drunkeness  -= food.rejuvenation_level
  end


end
