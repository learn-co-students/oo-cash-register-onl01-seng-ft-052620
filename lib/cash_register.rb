# require 'pry'

class CashRegister

attr_accessor :total, :discount, :items, :transactions

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @transactions = {}
    end

    def add_item(title, price, quantity = 1)
        @total += price*quantity
        quantity.times { @items << title }
        @transactions[title] = [price, quantity]
    end

    def apply_discount
        if @discount != 0
            @total = @total * (100 - @discount) / 100
            return "After the discount, the total comes to $#{@total}."
        else return "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        details = @transactions[@items[-1]]
        void_price = details[0]*details[1]
        @total -= void_price
    end

end