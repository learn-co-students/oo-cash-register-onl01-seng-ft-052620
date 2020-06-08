class CashRegister

    attr_accessor :items, :discount, :total, :last_transaction
  
    def initialize(discount=0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, amount, quantity=1)
      self.total += amount * quantity
      quantity.times do
        items << title
      end
      self.last_transaction = amount * quantity
    end
  
    def apply_discount
      if discount != 0
        self.total = (total * ((100.0 - discount.to_f)/100)).to_i
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total = self.total - self.last_transaction
    end
  end


  #Hint #1: Keep in mind that to call an instance method inside another instance method, we use the self keyword to refer to the instance on which we are operating.

# class CashRegister
#     attr_accessor :total, :discount

    #sets an instance variable @total on initialization to zero
    #optionally takes an employee discount on initialization (20)
    # def initialize(total = 0, discount = 20)
        # @total = total
        # @discount = discount
    # end

    #accepts a title and a price and increases the total
    #expect{cash_register.add_item("eggs", 0.98)}.to change{cash_register.total}.by(0.98)
    # def add_item(item, price, quantity = 1)
        # self.total += price * quantity
    # end

        # applies the discount to the total price
        # get the total and apply the discount to that
        #"After the discount, the total comes to $800."
        #CashRegister #apply_discount the cash register was initialized with an employee discount reduces the total
        #no discount = "There is no discount to apply." 
    # def apply_discount
#         if discount > 0
#             totalDisc = (total*discount)
#             total - totalDisc
#             return "After the discount, the total comes to $#{total}."
#         else
#             "There is no discount to apply."
#         end
#     end
# end
