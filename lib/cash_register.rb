require "pry"

class CashRegister
attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount = "no")
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    self_total = price * quantity
    @total += self_total
    quantity.times do
      @items << title
    end 
    @last_transaction = self_total
  end

  def apply_discount
    if @discount == "no"
      "There is no discount to apply."
    else
      @total = @total * 0.8
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end 

  def void_last_transaction
    @total = @total - @last_transaction
    @total
  end

end