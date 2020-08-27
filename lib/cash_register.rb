require 'pry'
class CashRegister
    attr_accessor :total, :discount, :items, :last_transcation
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
    def add_item(item,price,quantity = 1)
        self.total += price*quantity
        quantity.times {
            @items.push(item)
        }
        self.last_transcation = price * quantity
    end
    def apply_discount
        if self.discount > 0
            self.total *=0.8
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        self.total -= self.last_transcation
    end
#binding.pry
end