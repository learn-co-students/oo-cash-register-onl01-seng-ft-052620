require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :last_trans

    def initialize(discount = 0)
        @last_trans = {}
        @items = []
        @total = 0
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        i = 1
        while i <= quantity
            @items << title
            i += 1
            last_trans[title] = price * quantity
        end
    end

    def apply_discount
        if self.discount == 0
            "There is no discount to apply."
        else 
            discount_total = self.total * (self.discount.to_f/100)
            self.total -= discount_total
            "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        item = @items.pop
        self.total -= last_trans[item]
        last_trans.clear
    end



end
