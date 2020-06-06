require "pry"

class CashRegister
 
attr_accessor :discount, :total, :items, :last_item, :all_items 



    def initialize(discount = 0)
@total = 0
@discount = discount
@items = []
@all_items = []

end
def add_item(title , price, quantity = 1 )
    @total += price * quantity
    @items += [title] * quantity
    @last_item = [title, price, quantity]
    @all_items = @all_items << [title , price, quantity]
    
    #binding.pry
end

def apply_discount
    if @discount != 0
        @total = @total - (@total.to_f * (@discount.to_f / 100)).to_i
        return "After the discount, the total comes to $#{@total}." 
    else
        return "There is no discount to apply."
    end
end

def void_last_transaction
if @all_items == nil
    return @total = 0.0
else
    @total -= @all_items.last[1]
   
end
   #binding.pry
end

end