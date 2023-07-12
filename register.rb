require 'io/console'
require_relative 'condition.rb'
class Register
  MAX_ATTEMPTS = 3

  def register
    puts "-------Registration--------"

    email_attempts = 0
    password_attempts = 0

    loop do
      puts "Enter your email: (Require-name-> ......@gmail.com)"
      email = gets.chomp

      if email.empty?
        puts "Email cannot be blank."
        puts ""
        return if Condition.check_condition
      elsif email_exist?(email)
        puts "Email already exists."
        puts ""
        return if Condition.check_condition
      elsif valid_email?(email)
        break if register_with_password(email)
      else
        puts "Invalid email format..."
        puts ""
        return if Condition.check_condition
      end

      email_attempts += 1
      break if email_attempts >= MAX_ATTEMPTS
    end
  end

  def register_with_password(email)
    password_attempts = 0

    loop do
      puts "Enter your password:"
      password = gets.chomp

      if valid_password?(password)
        File.open("users.txt", "a") do |file|
          file.puts("#{email},#{password}")
        end
        puts "Registration successful!"
        puts ""
        return true
      else
        puts "Invalid password format......\nContain at least one uppercase letter, one lowercase letter, one numeric value, one symbol, and have a minimum length of 8 characters."
        puts ""
        return if Condition.check_condition
      end

      password_attempts += 1
      throw :quit if password_attempts >= MAX_ATTEMPTS
    end
  end

  def email_exist?(email)
    File.foreach("users.txt") do |line|
      return true if line.start_with?(email)
    end
    false
  end

  def valid_email?(email)
    /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match?(email)
  end

  def valid_password?(password)
    /^(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.*[0-9])(?=.*[a-z]).{8,}$/.match?(password)
  end
end
