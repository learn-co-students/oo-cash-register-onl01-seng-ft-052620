class CashRegister

    attr_accessor :total, :discount, :items, :last_transaction

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @last_transaction = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        self.items.push([title] * quantity).flatten!
        self.last_transaction = [title,price,quantity]
    end

    def apply_discount
        if discount == 0
            return "There is no discount to apply."
        end
        self.total *= 1- self.discount/100.0
        "After the discount, the total comes to $#{self.total.to_i}."
    end

    def void_last_transaction
        self.total -= self.last_transaction[1] * self.last_transaction[2]
        self.items = self.items.slice(0,self.items.length - self.last_transaction[2])
    end

end
