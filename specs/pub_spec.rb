require("minitest/autorun")
require("minitest/rg")

require_relative("../drink.rb")
require_relative("../customer.rb")
require_relative("../pub.rb")

class PubTest < Minitest::Test

  def setup
    @customer1 = Customer.new("Joe", 50, 30)
    @drink1 = Drink.new("Tennents", 3, 4)
    @drink2 = Drink.new("Red wine", 5, 11)
    @drink3 = Drink.new("Vodka red bull", 6, 40)
    @pub = Pub.new("Molly Malones", [@drink1, @drink2, @drink3])
  end

def test_name_of_pub
  assert_equal("Molly Malones", @pub.name)
end

def test_check_till_is_0
assert_equal(0, @pub.till_count)
end

def test_pub_drinks
assert_equal([@drink1, @drink2, @drink3], @pub.pub_drinks)
end

def test_remove_drink_from_pub_drinks
  @pub.remove_drink(@drink1)
  assert_equal(2,@pub.count_pub_drinks)
end

def test_add_drink_price_to_till
  @pub.add_drink_price_to_till(@drink1)
  assert_equal(3, @pub.till_count)
end


end
