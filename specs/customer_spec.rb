require('minitest/autorun')
require('minitest/rg')
require_relative('../customer.rb')
require_relative('../drink.rb')
require_relative('../pub.rb')
require_relative('../food.rb')


class TestCustomer < MiniTest::Test

  def setup

    @customer1 = Customer.new("Bob", 100, 0, 25)
    @customer2 = Customer.new("Margaret", 0, 60, 17)

    @drink1 = Drink.new({name: "beer", price: 5, alcohol_level: 5, stock: 10})
    @drink2 = Drink.new({name: "wine", price: 10, alcohol_level: 10, stock: 10})
    @drink3 = Drink.new({name: "whisky", price: 15, alcohol_level: 12, stock: 10})

    @food1 = Food.new("Chips", 3, 10)
    @food2 = Food.new("Chips'n' Cheese", 4, 15)

  end

  def test_customer_created
    assert_equal("Margaret", @customer2.name)
  end

  def test_does_wallet_have_funds
    assert_equal(false, @customer2.does_wallet_have_funds(10))
  end

  def test_decrease_wallet
    assert_equal(95, @customer1.decrease_wallet(@drink1))
  end

  def test_add_drink
    assert_equal(["beer"], @customer1.add_drink("beer"))
  end

  def test_add_alcohol_level
    assert_equal(5, @customer1.add_alcohol_level(@drink1))
  end

  def test_decrease_drunkeness_level
    assert_equal(45, @customer2.decrease_drunkeness_level(@food2))
  end

end
