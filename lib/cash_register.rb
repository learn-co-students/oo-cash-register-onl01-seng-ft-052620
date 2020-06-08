require 'pry'
class CashRegister
  attr_accessor :total, :discount, :all, :price_of_items, :all_quantities

  def initialize(discount = 1)
    self.total = 0
    self.discount = discount
    self.all = []
    self.price_of_items = []
    self.all_quantities = []
  end

   def total
     @total
   end

   def add_item(title, price, quantity = 1)
   count = 0
   self.total += price * quantity
   self.all_quantities << quantity
   while count < quantity
   self.all << title
   self.price_of_items << price
   count += 1
   end
   end

   def apply_discount
     if discount > 1
    discount_amount = self.total * self.discount/100
    self.total -= discount_amount
    return "After the discount, the total comes to $#{self.total}."
  else
      return "There is no discount to apply."
  end
   end
   def items
   self.all
   end

   def void_last_transaction
    self.total -= self.price_of_items.last * self.all_quantities.last
   end

end
