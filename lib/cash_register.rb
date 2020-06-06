require "pry"
class CashRegister
  attr_accessor :total
  attr_reader :discount, :items
  def initialize(*with_discount)
    @total = 0
    @discount = with_discount[0]
    @items = []
  end
  
  def add_item(title, price, *quantity)
    if quantity.empty?
      @total += price
      @items << title
      @last_item = [title, price]
    else
      quantity[0].times do
        @items << title
      end
      @total += (price * quantity[0])
    end
    
   
  end

  def apply_discount 
    if discount == nil
      return "There is no discount to apply."

    else 
      @total *= ((100.0 - @discount) / 100)
      return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def void_last_transaction
        if @last_item == nil
          @total = 0.0
        else   
        @total -= @last_item[1]
        end
     
      
  end

  

end 