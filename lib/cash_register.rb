
class CashRegister

    attr_accessor :total, :discount

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        @price = price
        @quantity = quantity
        @total += @price*quantity
        while quantity > 0
            @items << item
            quantity -= 1
        end
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."

        else
            @total = @total - (@total*(@discount/100.0))
            "After the discount, the total comes to $#{@total.to_i}."
        end
       
    end

    def void_last_transaction

        @total -= @price*@quantity

    end

    def items
        @items
    end
end