require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')
require_relative('../customer.rb')
require_relative('../pub.rb')

class TestDrink < MiniTest::Test

  def setup


    @drink1 = Drink.new({name: "beer", price: 5, alcohol_level: 5, stock: 10})
    @drink2 = Drink.new({name: "wine", price: 10, alcohol_level: 10, stock: 10})
    @drink3 = Drink.new({name: "whisky", price: 15, alcohol_level: 12, stock: 10})

  end

  def test_drink_created
    assert_equal("wine", @drink2.drink[:name])
  end

end
