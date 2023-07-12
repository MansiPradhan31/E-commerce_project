require_relative 'browse_product.rb'
require_relative "add_to_cart.rb"
require_relative 'view_cart.rb'
require_relative 'check_out.rb'
require_relative 'order_history.rb'
require_relative 'condition.rb'
class UserFeature
  def initialize(array,cart,order_history,userdetail,user) 
    @productarray = array
    @cart = cart
    @order_history = order_history
    @userdetail = userdetail
    @total=0
    @user=user
  end
  
  def feature
    browse_product = BrowseProduct.new('products.csv',@productarray)
    browse_product.browse
    consecutive_blank_enters = 0
    loop do 
      puts "\n\n......................"
      puts "-Welcome in User menu- "
      puts "1. Add to Cart \n2. View Cart \n3. Checkout \n4. View Order History \n5. LogOut \n"
      puts "......................"
      puts "Enter choice"
      choice=gets.chomp.to_i
      if choice == 5
        puts "LogOut Successful..."
        break
      elsif choice == 0
        consecutive_blank_enters += 1
        if consecutive_blank_enters >= 3
          break
        end
      else
        consecutive_blank_enters = 0
      end
      case choice          
        when 1
          AddToCart.new(@productarray,@cart,@user).add_to_cart
        when 2
          ViewCart.new(@cart,@total,@user).view_cart
        when 3
          catch :quit_checkout do
            CheckOut.new(@cart,@order_history,@userdetail,@user).checkout
          end
        when 4
          OrderHistory.new(@order_history,@userdetail,@user).view_order_history
        else
          puts "Please enter valid no."
      end
    end
  end
end