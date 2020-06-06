class CashRegister
  
  attr_accessor :total, :discount, :last_transaction_amount, :items
  
  def initialize(discount = 0)
  @total = 0
  @discount = discount
  @items = []
  @last_transaction_amount = 0
  end 
def add_item(title,price,quantity = 1)
  self.total += price * quantity
    #if quantity > 0
      i = 0
      while i < quantity
        @items << title
        i += 1
      end
      @last_transaction_amount = price * quantity
   # end
end
def apply_discount()
    if @discount > 0
      @discount = @discount/100.to_f
      @total = @total - (@total * (@discount))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end


  def void_last_transaction()
    @total -= @last_transaction_amount
  end


end