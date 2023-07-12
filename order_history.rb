class OrderHistory
  def initialize(order_history, userdetail, user)
    @order_history = order_history
    @userdetail = userdetail
    @user = user
  end

  def view_order_history
    if @order_history.empty?
      puts "No order history available."
      return
    end

    @userdetail.each do |deta|
      if deta[1] == @user
        temp = deta[0]
        puts "-------Personal information-------"
        puts "Name: #{temp.name}"
        puts "Address: #{temp.add}"
        puts "Contact: #{temp.con}"
        puts "Bank : #{temp.bank}"
        puts "Card No.: #{temp.num}"
        puts "CVV No. : #{temp.cvv}"
        puts "-----------------------------"
      end
    end

    puts "\n---------Order History---------"
      @order_history.each_with_index do |order, index|
        order.each do |prod|
          quantity = prod[2]
          total_price = prod[0]["price"].to_i * quantity
          puts "User name: #{prod[1]}"
          puts "Order #{index+1}:"
          puts "Brand: #{prod[0]['brand']}"
          puts "Name: #{prod[0]['name']}"
          puts "Category: #{prod[0]['cat']}"
          puts "Price: #{prod[0]['price']}"
          puts "Size: #{prod[0]['size']}"
          puts "Quantity: #{quantity}"
          puts "Total Price: #{total_price}"
          puts "--------------------------"
        end
      end
    
  end
end
