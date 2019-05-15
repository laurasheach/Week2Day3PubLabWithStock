require('minitest/autorun')
require('minitest/rg')
require_relative('../pub.rb')
require_relative('../customer.rb')
require_relative('../drink.rb')

class TestPub < MiniTest::Test

  def setup

    @drink1 = Drink.new({name: "beer", price: 5, alcohol_level: 5, stock: 10})
    @drink2 = Drink.new({name: "wine", price: 10, alcohol_level: 10, stock: 10})
    @drink3 = Drink.new({name: "whisky", price: 15, alcohol_level: 12, stock: 10})

    @pub = Pub.new("The Bull Inn", 1000, [@drink1, @drink2, @drink3])

    @customer1 = Customer.new("Bob", 100, 0, 25)
    @customer2 = Customer.new("Margaret", 0, 60, 17)
    @customer3 = Customer.new("Jimmy", 50, 50, 65)

  end

  def test_pub_created
    assert_equal("The Bull Inn", @pub.pub_name)
  end

  def test_increase_till
    assert_equal(1005, @pub.increase_till(@drink1))
  end

  def test_find_by_name
    assert_equal(@drink2, @pub.find_by_name(@drink2))
  end

  def test_remove_from_stock
    assert_equal(@drink3, @pub.remove_from_stock(@drink3))
    assert_equal(9, @pub.stock[2].drink[:stock])
  end

  def test_sell_customer_drink
    @pub.sell_drink_to_customer(@customer1, @drink2)
    assert_equal(false, @pub.too_drunk(@customer1))
    assert_equal(9, @pub.stock[1].drink[:stock])
    assert_equal([@drink2], @customer1.drinks)
    assert_equal(90, @customer1.wallet)
    assert_equal(1010, @pub.till)
    assert_equal(10, @customer1.drunkeness)
  end

  def test_check_age__over_18
    assert_equal(true, @pub.check_age(@customer1))
  end

  def test_check_age__under_18
    assert_equal(false, @pub.check_age(@customer2))
  end

  def test_sell_customer_drink__too_young
    assert_equal("Sorry, you are too young", @pub.sell_drink_to_customer(@customer2, @drink2))
    assert_equal(10, @pub.stock[1].drink[:stock])
    assert_equal([], @customer2.drinks)
    assert_equal(0, @customer2.wallet)
    assert_equal(1000, @pub.till)
  end
#
  def test_too_drunk
    assert_equal(true, @pub.too_drunk(@customer2))
    assert_equal(false, @pub.too_drunk(@customer1))
  end

  def test_sell_customer_drink__too_drunk
    assert_equal("Sorry, you are too drunk", @pub.sell_drink_to_customer(@customer3, @drink2))
    assert_equal(10, @pub.stock[1].drink[:stock])
    assert_equal([], @customer3.drinks)
    assert_equal(50, @customer3.wallet)
    assert_equal(1000, @pub.till)
  end

  def test_stock_value
    assert_equal(50, @pub.stock_value(@drink1))
  end

  def test_stock_value__all
    assert_equal(300, @pub.stock_value__all(@drink1, @drink2, @drink3))
  end

end
