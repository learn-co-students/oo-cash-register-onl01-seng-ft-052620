
class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        i = 0
        until i == quantity
            @items << title
            i += 1
        end

        @last_transaction = (price * quantity)
        self.total += (price * quantity)
    end

    def apply_discount
        if @discount > 0
            self.discount = self.discount/100.0
            self.total = self.total - (self.total * self.discount)
            "After the discount, the total comes to $#{self.total.to_i}."

        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= @last_transaction
    end
end