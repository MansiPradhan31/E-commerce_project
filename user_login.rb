require_relative 'user_features.rb'
require 'io/console'

class UserLogin
  def initialize(array, productarray, cart,order_history, userdetail, user)
    @dataarray = array
    @productarray = productarray
    @cart = cart
    @order_history = order_history
    @userdetail = userdetail
    @user = user
    @count = 0
  end

  def login
    puts "-------Login-------"
    email = ''
    loop do
      puts "Enter your email:"
      email = gets.chomp
      break unless email.empty?
      puts "Email cannot be empty. Please try again."
      @count += 1
      throw :quit if @count >=3
    end
    puts "Enter your password:"
    password = ''

    while char = STDIN.getch
      break if char == "\r" || char == "\n"  
      if char == "\u007F" || char == "\b"
        if password.length > 0
          print "\b \b"  
          password.chop!  
        end
      else
        print '*'  
        password += char
      end
    end

    login_successful = false

    File.foreach("users.txt") do |line|
      stored_email, stored_password = line.chomp.split(',')
      if stored_email == email && stored_password == password
        puts "\nLogin successful! "
        @user = email
        feature = UserFeature.new(@productarray,@cart, @order_history, @userdetail, @user).feature
        login_successful = true
        break
      end
    end

    puts "\nInvalid email or password. Please try again." unless login_successful
  end
end
