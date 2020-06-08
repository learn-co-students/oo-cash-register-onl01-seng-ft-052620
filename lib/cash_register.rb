# build class with instance methods
# call instance methods inside of other instance methods
# use instance methods to track info pertinent to an instance of a class

# add items of varying qtys & prices
# calc discounts
# keep track of what's added
# void last trx

# to call an instance inside another we use self keyword to refer to instance on which we are operating
# apply_discount Integer vs Float???
# void_last_trx removes last trx from total - need to make add'l attibute accessor & keep track of last trx somehow (array?) in what method of the glass are you working with an individual item?
require 'pry'
class CashRegister

    attr_accessor :total, :discount, :items, :trx

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @trx = []
    end

    def add_item(item, price, qty = 1)
        @total += (price*qty)
        q = 0
        while q < qty 
            @items << item
            q += 1
        end
        @trx << (price*qty)
    end

    def apply_discount
        if discount != 0
            apply = @discount * 0.01
            total_disc = @total * apply
            @total -= total_disc
            "After the discount, the total comes to $" + @total.round().to_s + "."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items
        # binding.pry
    end

    def void_last_transaction
        @total -= @trx.pop
    end

end