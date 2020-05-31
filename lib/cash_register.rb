require 'pry'

class CashRegister 
  
  attr_accessor :total, :discount, :title, :price, :quantity, :items, :last_transaction
  
  CashRegister = []
  
  def initialize(discount=nil) 
    @discount = discount
    @total = 0 
    @items = []
    @transaction_num = 0
  end 
  
  def total 
    @total 
  end 
  
  def add_item(title, price, quantity=1)
    @title = title 
    @price = price 
    @quantity = quantity 
    @total += price * quantity
    @transaction_num += 1 
    if quantity > 1 
      quantity.times do 
        @items << title 
      end 
    else 
      @items << title 
    end 
    @total
  end 

  def apply_discount
    if @discount
      savings = @total.to_f * (@discount.to_f / 100)
      @total = (@total - savings).to_i
      "After the discount, the total comes to $#{@total}."
    else 
      "There is no discount to apply."
    end 
  end 
  
  def items
    @items
  end 
  
  def void_last_transaction 
    @total -= @price
    @transaction_num -= 1 
    if @transaction_num == 0 
      @total = 0.0 
    end 
    
  end 
  
end 
