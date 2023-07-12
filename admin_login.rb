require_relative 'admin_add_product.rb'
require_relative 'admin_update_product.rb'
require_relative 'admin_delete_product.rb'
require_relative 'export_product.rb'
require_relative 'condition.rb'
class AdminLogin
  def initialize(array,order_history,userdetail,user) 
    @productarray = array
    @order_history = order_history
    @userdetail = userdetail
    @user = user
  end
  
  def admin
    name = "mansi"
    pass = "Mansi@123"
    puts "-----------Admin Account------------"
    puts "Enter admin name"
    username = gets.chomp
    puts "Enter admin password"
    userpass = gets.chomp
    if (username).eql?(name)&&(userpass).eql?(pass)
      puts "Login Successful...\n"
      admin_menu
    else
      puts "Wrong inputs please enter correct admin name and password...\n"
      return
    end
  end
  def admin_menu
    consecutive_blank_enters = 0
    
    loop do
      puts "\n-----Admin Dashboard-----"
      puts ""
      puts "1. Add product"
      puts "2. Update product"
      puts "3. Delete product"
      puts "4. Export Product"
      puts "5. View order history"
      puts "6. Exit"
      puts "-----------------------------"
      puts "Enter your choice"
      choice = gets.chomp.to_i

      if choice == 6
        break
      elsif choice == 0
        consecutive_blank_enters += 1
        if consecutive_blank_enters >= 3
          puts "Exiting the program..."
          sleep(1)
          break
        end
      else
        consecutive_blank_enters = 0
      end
      catch :quit_admin do
        case choice

        when 1
            AdminAddProduct.admin_add_product
        when 2  
            AdminUpdateProduct.admin_update_product
        when 3
            AdminDeleteProduct.admin_delete_product
        when 4
            ExportProduct.store_product(AdminAddProduct.get_product_data)
        when 5
          puts "-----User Order History-----"
          if @order_history.nil? || @order_history.empty?
            puts "No order history available."
          else
            OrderHistory.new(@order_history, @userdetail, @user).view_order_history
          end
        else
          puts "Invalid input. Please enter a correct number."
        end
      end
    end
  end  
end