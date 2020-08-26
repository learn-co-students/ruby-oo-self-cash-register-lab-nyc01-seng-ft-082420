require "pry"
class CashRegister
  attr_accessor :total, :discount

  def initialize(discount = 0.00)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times do
      @items << {title: title, price: price, quantity: quantity }
    end
    @total += price * quantity
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total *= 100 - @discount
      @total /= 100
      p "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    arr = []
    @items.each { |value|
      arr << value[:title]
    }
    arr
  end

  def void_last_transaction
    @total -= @items.last[:price] * @items.last[:quantity]
    @items.pop
    arr = []
    @items.each { |value|
      arr << value[:title]
    }
    arr
  end
end
