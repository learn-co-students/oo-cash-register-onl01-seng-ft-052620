require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 0)
        if quantity > 0
            @price = price * quantity
            @total += price * quantity
            @items.fill(title, @items.size, quantity)
        else 
            @total += price
            @items << title
            @price = price
        end
    end

    def apply_discount
        discount = (100.0 - @discount) / 100.0
        @total = @total * discount
        if @discount > 0
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= @price
    end
end