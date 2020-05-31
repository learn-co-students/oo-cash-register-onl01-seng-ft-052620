
class CashRegister
 
    attr_accessor :items, :total, :discount, :last_item_price
   

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end 
   
    def total
        @total
    end
    
    def discount
        @discount
    end
    
    def add_item(item, price, quantity = 1)
        @total += price * quantity
        @items += [item] * quantity
        @last_item = [item, price, quantity]
    end
    
    def apply_discount
        return "There is no discount to apply." if @discount == 0
        @total = @total - (@total.to_f * (@discount.to_f / 100)).to_i
        return "After the discount, the total comes to $#{@total}."
      
    end

    def void_last_transaction
      @total -= @last_item[1] * @last_item[2]
      @items.pop
    end




end