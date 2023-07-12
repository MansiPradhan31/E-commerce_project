require 'csv'

class AdminAddProduct
   @product_data = {}
  def self.admin_add_product
   
    @product_data[:serial_no] = get_input("Enter product no.", /^\d+$/, "Invalid S.NO. Please enter a numeric value.")
    @product_data[:brand] = get_input("Enter brand name", /^[A-Za-z\s]+$/, "Invalid name. Please enter only alphabetical characters.")
    @product_data[:name] = get_input("Enter product name", /^[A-Za-z\s]+$/ , "Invalid name. Please enter only alphabetical characters.")
    @product_data[:category] = get_input("Enter product category", /^[A-Za-z\s]+$/ , "Invalid Category. Please enter only alphabetical characters.")
    @product_data[:price] = get_input("Enter product price", /^\d+$/, "Invalid price. Please enter a numeric value.")
    @product_data[:size] = get_input("Enter product size")
    puts "\nExport your data..."
  end

  def self.get_input(prompt, regex = nil, error_message = nil)
    loop do
      puts prompt
      input = gets.chomp.strip

      if input.empty?
        puts "#{prompt} cannot be empty."
        throw :quit_admin if Condition.check_condition
      elsif regex && !input.match?(regex)
        puts error_message
        throw :quit_admin if Condition.check_condition
      else
        return input
      end
    end
  end

  def self.get_product_data
    return @product_data
  end
end
