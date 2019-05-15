class Food

  attr_accessor :food_name, :price, :rejuvenation_level

  def initialize(food_name, price, rejuvenation_level)
    @food_name = food_name
    @price = price
    @rejuvenation_level = rejuvenation_level
  end

end
