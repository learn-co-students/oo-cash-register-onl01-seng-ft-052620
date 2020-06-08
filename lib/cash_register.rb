require "pry"

class CashRegister 
  attr_accessor :total, :price, :items, :discount
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end  
  
  
  
  
  def add_item(title, price, quantity = 1)
      @price = price
      @total += price * quantity
      if quantity > 1
      counter = 0
      while counter < quantity
        @items << items
        counter += 1
      end
    else
      @items << items
    end
  end  
  
  
  def apply_discount
    if @discount != 0
			@total = total - total * 20 / 100
			"After the discount, the total comes to $#{self.total}."
		else
			"There is no discount to apply."
		end
    
  end  
  
  def items
    @items
  end  
  
  
  def void_last_transaction
    @total -= @price
    
  end  
  
  
end