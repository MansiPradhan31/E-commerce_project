class ViewCart
  def initialize(cart, total, user)
    @cart = cart
    @total = total
    @user = user
  end

  def view_cart
    if @cart.empty?
      puts "Your cart is empty. Add items to your cart..."
      return
    end

    puts "------View cart-------"

    @cart.each do |prod|
      if prod[1] == @user
        temp = prod[0]
        quantity = prod[2].to_i
        puts "--------------------------"
        puts "Brand: #{temp['brand']}"
        puts "Name: #{temp['name']}"
        puts "Price: #{temp['price']}"
        puts "Category: #{temp['category']}"
        puts "Size: #{temp['size']}"
        puts "Quantity: #{quantity}"
        puts "Total price: #{temp['price'].to_i * quantity}"
        @total += temp['price'].to_i * quantity 
      end
    end

    puts ""
    puts "Total amount is: #{@total}"
  end
end
