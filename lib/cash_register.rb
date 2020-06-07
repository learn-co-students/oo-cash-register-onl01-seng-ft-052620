class CashRegister
  attr_accessor :discount, :total, :last_item, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_item = []
  end

  def add_item(item, price, quantity = 1)
    @total = @total + price*quantity
    @last_item = [item, price, quantity]
    counter = 0
    until counter == quantity
      @items << item
      counter += 1
    end
  end

  def apply_discount
    if @discount == 20
      @total = @total*(1 - @discount/100.0)
      return "After the discount, the total comes to $#{@total.to_i}."
    elsif @discount == 0
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = @total - @last_item[1]*@last_item[2]
  end

end
