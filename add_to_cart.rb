class AddToCart
  def initialize(product_array, cart, user)
    @product_array = product_array
    @cart = cart
    @user = user
    @product_not_matched_count = 0
  end

  def add_to_cart
    puts "Enter the product number to add the product to your cart:"
    product_number = gets.chomp.to_i

    if valid_product_number?(product_number)
      @product_not_matched_count = 0 
      product_index = product_number - 101
      product = @product_array[product_index]

      puts "Enter the quantity:"
      quantity = gets.chomp.to_i

      if valid_quantity?(quantity)
        @cart << [product, @user, quantity]
        puts "Product added successfully!"
        return if Condition.check_condition
        add_to_cart
      else
        puts "Invalid quantity. Please enter a positive number."
        return if Condition.check_condition
        add_to_cart
      end
    else
      @product_not_matched_count += 1 
      if @product_not_matched_count >= 3
        puts "Product not matched. Returning back..."
        sleep(1)
        return
      else
        puts "Product not matched..."
        return if Condition.check_condition
        add_to_cart
      end
    end
  end

  def valid_product_number?(product_number)
    product_index = product_number - 101
    product_index.between?(0, @product_array.length - 1)
  end

  def valid_quantity?(quantity)
    quantity.positive?
  end
end
