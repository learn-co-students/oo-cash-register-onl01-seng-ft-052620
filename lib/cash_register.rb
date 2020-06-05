class CashRegister
  attr_accessor :total, :previous_total, :discount, :items
  
  def initialize(discount = 0.0)
    @total = 0.0 
    @previous_total
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity = 1)
    @previous_total = @total 
    for i in 1..quantity do 
      @items << title
    end
    @total += (price * quantity)
  end
  
  def apply_discount
    if @discount != 0.0 
      @total -= (@total * (@discount * 0.01))
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total = @previous_total
  end

end



