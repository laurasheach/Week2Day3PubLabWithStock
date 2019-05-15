require('minitest/autorun')
require('minitest/rg')
require_relative('../food.rb')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')

class TestFood < MiniTest::Test

  def setup

    @food1 = Food.new("Chips", 3, 10)
    @food2 = Food.new("Chips'n' Cheese", 4, 15)

  end

  def test_food_created
    assert_equal(15, @food2.rejuvenation_level)
  end

end
