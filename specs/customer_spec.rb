require("minitest/autorun")
require("minitest/rg")

require_relative("../drink.rb")
require_relative("../customer.rb")
require_relative("../pub.rb")
require_relative("../food.rb")

class CustomerTest < Minitest::Test

def setup
  @customer1 = Customer.new("Joe", 50, 30)
  @customer2 = Customer.new("Tara", 100, 17)
  @drink1 = Drink.new("Tennents", 3, 4)
  @drink2 = Drink.new("Red wine", 5, 11)
  @drink3 = Drink.new("Vodka red bull", 6, 120)
  @pub = Pub.new("Molly Malones", [@drink1, @drink2, @drink3])
  @food1 = Food.new("banana", 1, 30)
end

def test_customer_name
  assert_equal("Joe", @customer1.name)
end

def test_customer_wallet
  assert_equal(50, @customer1.wallet)
end

def test_customer_age
  assert_equal(30, @customer1.age)
end

# def test_customer_buys_drink
#   @customer1.buys_drink(@drink1)
#   assert_equal(1, @customer1.customer_drinks_count)
# end

def test_reduce_wallet
  @customer1.reduce_wallet(@drink1.price)
  assert_equal(47, @customer1.customer_wallet_count)
end

def test_drunkenness_increase
  @customer1.increase_drunkenness(@drink1.alcohol_level)
  assert_equal(4, @customer1.drunkenness_level_check)
end

def test_customer_can_buy_drink_from_pub__overage
  @customer1.take_drink_from_pub(@pub, @drink1)
  assert_equal(2, @pub.count_pub_drinks)
  assert_equal(47,@customer1.customer_wallet_count)
  assert_equal(3, @pub.till_count)
end

def test_customer_can_buy_drink_from_pub__underage
  @customer2.take_drink_from_pub(@pub, @drink1)
  assert_equal(3, @pub.count_pub_drinks)
  assert_equal(50,@customer1.customer_wallet_count)
  assert_equal(0, @pub.till_count)
end

def test_customer_can_buy_drink_from_pub__sober
  @customer1.take_drink_from_pub(@pub, @drink1)
  assert_equal(2, @pub.count_pub_drinks)
  assert_equal(47,@customer1.customer_wallet_count)
  assert_equal(3, @pub.till_count)
end

def test_customer_can_buy_drink_from_pub__drunk
  @customer1.take_drink_from_pub(@pub, @drink3)
  @customer1.take_drink_from_pub(@pub, @drink3)
  assert_equal(2, @pub.count_pub_drinks)
  assert_equal(44,@customer1.customer_wallet_count)
  assert_equal(6, @pub.till_count)
end

def test_customer_sobers_with_food
  @customer1.take_drink_from_pub(@pub, @drink3)
  @customer1.eats_food(@food1)
  assert_equal(90, @customer1.drunkenness_level_check)
end


end
