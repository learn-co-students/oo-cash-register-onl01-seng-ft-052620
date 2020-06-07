class CashRegister 
  attr_accessor :discount, :item, :last_transaction, :total 
  
  def initialize(discount = 0)
    @items = []
    @discount = discount 
    @total = 0 
  end 
  
  def add_item(title, amount, quantity=1)
    self.total +=amount * quantity
    quantity.times do 
      @items << title 
    end 
    self.last_transaction = amount * quantity
  end 
  
  def apply_discount
    if discount !=0 
      self.total = (total * ((100 - discount.to_f)/100)).to_i 
      "After the discount, the total comes to $#{self.total}."
    else 
      "There is no discount to apply."
  end 
end 

def items
  @items 
end

def void_last_transaction
  self.total = self.total - self.last_transaction
end 
end 
