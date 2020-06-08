require 'pry'
class CashRegister
    
    attr_accessor :discount, :items , :total
    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
        @item_list = {}
    end
    def add_item(title, price, quantity = 1)
        @total += price*quantity 
        quantity.times{@items << title}
        @item_list[title] = [price, quantity]
    end
    def apply_discount

        total = @total.to_f
        discount = @discount.to_f
        if @discount != nil 
            total *= ((100 - discount)/100)
            @total = total.to_i
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end
    def items
        @items 
    end
    def void_last_transaction
        
        #binding.pry
        last_array = @item_list[@items.last]  
        @total -= last_array[0] * last_array[1]
    end
end