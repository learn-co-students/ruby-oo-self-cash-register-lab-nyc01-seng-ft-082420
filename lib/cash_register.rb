require "pry"

class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction


    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        quantity.times {@items << title}
        @last_transaction = price * quantity
   
    end

    def apply_discount
        if discount
            self.total -= @total * discount / 100
            "After the discount, the total comes to $#{total}."
        else
            "There is no discount to apply."    
        end     
    end

    def items
        @items
    end

    def void_last_transaction
        self.total -= @last_transaction
        self.items.pop()
        if self.items.length == 0
            self.total = 0.0
        end
    end
end
