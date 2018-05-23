class Pub

  attr_reader :pub_drinks, :name

  def initialize(name, pub_drinks)
    @name = name
    @pub_drinks = pub_drinks
    @till = 0
  end

  def till_count
    return @till
  end

  def remove_drink(drink)
    @pub_drinks.delete(drink)
  end

  def count_pub_drinks
    @pub_drinks.count()
  end

  def add_drink_price_to_till(drink)
    @till += drink.price
  end

  # def check_age(customer)
  #   if customer.age >= 18
  #     return true
  #   else
  #
  # end

end
