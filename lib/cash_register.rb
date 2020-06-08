require 'pry'

class CashRegister
  attr_accessor :total, :prevTotal, :discount, :items
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, quantity = 1)
    @prevTotal = @total
    @total += price * quantity
    quantity.times do 
      @items << item
    end
    
  end
  
  def apply_discount
    if @discount > 0
      @total -= @total * (@discount / 100.0)
      if @total % 1 == 0 
        @total = @total.to_i
      end
     "After the discount, the total comes to $#{@total}."
   else
     "There is no discount to apply."
   end
  end
  
  def items
    @items 
    #binding.pry
  end
  
  def void_last_transaction
    @total = @prevTotal
    @total
  end
end
