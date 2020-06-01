
require 'pry'
class CashRegister
attr_accessor :total, :discount, :items


def initialize(discount =nil)
@total = 0
@items =[]
@item_hash ={}
@discount = discount
end

def add_item(title, price, quantity = nil)
quantity !=nil && quantity> 1 ? quantity.times do @items<< title end : @items<< title
@item_hash[title]=[price, quantity]
quantity ? @total+= price*quantity : @total+= price;
end

def apply_discount
total = @total.to_f
discount = @discount.to_f
if @discount !=nil
    total *= (1-(discount/100));
    @total = total.to_i
    "After the discount, the total comes to $#{@total}."
else "There is no discount to apply."
end
end

def void_last_transaction
    last_item = @item_hash[@items[-1]]
    last_item[1] !=nil ? @total -= last_item[0] * last_item[1] : @total -= last_item[0]
end

end
