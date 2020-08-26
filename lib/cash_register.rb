require 'pry'
class CashRegister
  attr_accessor :total, :discount
  def initialize(discount = 0 )
    @total = 0
    @discount = discount
    @all_items = []
    @last_item_amount = nil
  end
  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @last_item_amount = price*quantity
    quantity.times {@all_items << title}
    @total = @total + price*quantity
  end
  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @discount = 1 - @discount*0.01
    @total = @total * @discount
    # binding.pry
    @total = @total.round
    "After the discount, the total comes to $#{total.to_s}."
  end
  def items
    @all_items
  end
  def void_last_transaction
    @total = @total - @last_item_amount
    if @last_item_amount == nil 
      @total = 0.0
    end
  end
end
