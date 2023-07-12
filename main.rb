require_relative 'register.rb'
require_relative 'user_login.rb'
require_relative 'admin_login.rb'
require_relative 'browse_product.rb'
require_relative 'search_product.rb'
require_relative 'condition.rb'
require_relative 'load_data_from_csv.rb'
class Main
  def initialize
    @dataarray = []
    @productarray = []
    @cart = []
    @order_history = []
    @userdetail = []
    @user = nil
  end

  def run
    consecutive_blank_enters = 0
    
    loop do
      puts "\n-----Welcome to my store-----"
      puts ""
      puts "1. Browse Product"
      puts "2. Search Product"
      puts "3. Register an Account"
      puts "4. User Login"
      puts "5. Admin Login"
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

      case choice
      when 1
        browse_product = BrowseProduct.new('products.csv',@productarray)
        browse_product.browse_load
        browse_product.browse
      when 2
        search_product = SearchProduct.new('products.csv',@productarray)
        search_product.search
      when 3
        re = Register.new
        catch :quit do
          re.register
        end
        puts "Returning to the main menu..."
        sleep(1)
      when 4
        catch :quit do
          UserLogin.new(@dataarray, @productarray, @cart, @order_history, @userdetail, @user).login
        end
        puts "Returning to the main menu..."
        sleep(1)
      when 5
        admin = AdminLogin.new(@productarray,@order_history,@userdetail,@user).admin
        
      else
        puts "Invalid input. Please enter a correct number."
      end
    end
  end
end

run = Main.new
run.run
