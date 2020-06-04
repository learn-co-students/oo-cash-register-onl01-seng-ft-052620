require 'pry'

class CashRegister
	attr_accessor :total, :discount, :items, :last_transaction

	def initialize(discount=0)
		@total = 0
		@discount = discount
		@items = []
	end

	def add_item(item_name, price, quantity = 1)
		self.total += price*quantity
		self.items += [item_name]*quantity
		self.last_transaction = {item_name: item_name, price: price, quantity: quantity}
	end

	def apply_discount
		self.total *= (1 - self.discount*0.01)
		if self.discount > 0 
			"After the discount, the total comes to $#{self.total.to_i}." 
		else
			"There is no discount to apply."
		end
	end

	def void_last_transaction
		self.total -= @last_transaction[:price]*@last_transaction[:quantity]
		self.items -= [@last_transaction[:item_name]]*@last_transaction[:quantity]
	end
end
