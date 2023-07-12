class AdminDeleteProduct
    
    def self.admin_delete_product
      serial_no = get_serial_no_input
  
      if delete_product(serial_no)
        puts "Product deleted successfully."
      else
        puts "Product not found."
      end
    end
  
    def self.get_serial_no_input
      loop do
        puts "Enter the product number to delete:"
        serial_no = gets.chomp
  
        return serial_no if serial_no.match?(/^\d+$/)
  
        puts "Invalid product no. Please enter a numeric value."
        throw :quit_admin if Condition.check_condition
      end
    end
    
    def self.delete_product(serial_no)
      product_array = CSV.read("products.csv")
      deleted = false
  
      product_array.each_with_index do |row, index|
        if row[0] == serial_no
          product_array.delete_at(index)
          deleted = true
          break
        end
      end
  
      if deleted
        CSV.open("products.csv", 'w') do |csv|
          product_array.each do |row|
            csv << row
          end
        end
      end
  
      deleted
    end
  end
  