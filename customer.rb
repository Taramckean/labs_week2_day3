class Customer

  attr_reader :name, :age, :wallet

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end


  def customer_drinks_count
    @customer_drinks.count()
  end

  def reduce_wallet(drink_price)
    @wallet -= drink_price
  end

  def customer_wallet_count
    return @wallet
  end

  def increase_drunkenness(drink_alcohol_level)
    @drunkenness += drink_alcohol_level
  end

  def drunkenness_level_check
    return @drunkenness
  end

  def take_drink_from_pub(pub, drink)
    if @age >= 18
      if @drunkenness <= 100
       pub.remove_drink(drink)
       # @drunkenness += drink.drink_alcohol_level
       increase_drunkenness(drink.alcohol_level)
       @wallet -= drink.price
       pub.add_drink_price_to_till(drink)
     end
   end
  end


end
