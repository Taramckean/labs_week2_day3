require("minitest/autorun")
require("minitest/rg")

require_relative("../drink.rb")

class DrinkTest < Minitest::Test

  def setup
    @drink1 = Drink.new("Tennents", 3, 4)
    @drink2 = Drink.new("Red wine", 5, 11)
    @drink3 = Drink.new("Vodka red bull", 6, 40)
  end

  def test_drink_name
    assert_equal("Tennents", @drink1.name)
  end

  def test_drink_price
    assert_equal(5, @drink2.price)
  end

  def test_drink_alcohol_level
    assert_equal(40, @drink3.alcohol_level)
  end

end
