
require_relative 'user_detail.rb'
require_relative 'view_cart.rb'
class CheckOut
  def initialize(cart, order_history ,userdetail, user)
    @cart = cart
    @order_history = order_history
    @userdetail = userdetail
    @user = user
    
  end

  def checkout
    if @cart.empty?
      puts "Firstly add order to your view cart and then checkout..."
      return
    end

    name = prompt_for_input("Enter your name: ", /^[A-Za-z\s]+$/, "Invalid name. Please enter only alphabetical characters.")
    address = prompt_for_input("Enter your address: ",//,'')
    contact = prompt_for_input("Enter your contact no.: ", /^\d{10}$/, "Invalid contact number. Please enter a 10-digit number.")
    bank = prompt_for_input("Enter your bank name: ", /^[A-Za-z\s]+$/, "Invalid bank name. Please enter only alphabetical characters.")
    number = prompt_for_input("Enter your card no.: ", /^\d{16}$/, "Invalid card number. Please enter a 16-digit number.")
    cvv = prompt_for_input("Enter your cvv no.: ", /^\d{3}$/, "Invalid cvv number. Please enter a 3-digit number.")

    user_detail = UserDetail.new(name, address, contact, bank, number, cvv)
    @userdetail << [user_detail, @user]
    puts "Order Placed"
    @order_history << @cart.clone
    @cart.clear
  end

  def prompt_for_input(message, regex = nil, error_message = nil)
    input = nil

    loop do
      print message
      input = gets.chomp.strip

      if input.empty?
        puts "#{message} cannot be empty."
        throw :quit_checkout if Condition.check_condition
      elsif regex && !input.match?(regex)
        puts error_message
        throw :quit_checkout if Condition.check_condition
      else
        return input
      end
    end

    input
  end
end

