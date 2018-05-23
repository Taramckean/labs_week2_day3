require("minitest/autorun")
require("minitest/rg")

require_relative("../food.rb")


class FoodTest < Minitest::Test


  def setup
    @food1 = Food.new("banana", 1, 30)
  end

  def test_name
    assert_equal("banana", @food1.name)
  end

  def test_name
    assert_equal(30, @food1.rejuvination)
  end
end
