require 'csv'

class AdminUpdateProduct

  def self.admin_update_product
    serial_no = get_serial_no_input

    product_index = find_product_index(serial_no)

    if product_index
      updated_data = get_updated_product_data
      update_product(product_index, updated_data)
    else
      puts "Product not found."
    end
  end

  def self.get_serial_no_input
    loop do
      puts "Enter the product number to update:"
      serial_no = gets.chomp

      return serial_no if serial_no.match?(/^\d+$/)

      puts "Invalid product no. Please enter a numeric value."
      throw :quit_admin if Condition.check_condition
    end
  end

  def self.find_product_index(serial_no)
    product_array = CSV.read("products.csv")

    product_index = product_array.find_index do |row|
      row[0] == serial_no
    end

    product_index
  end

  def self.get_updated_product_data
    updated_data = {}

    updated_data[:brand] = AdminAddProduct.get_input("Enter updated brand name", /^[A-Za-z\s]+$/ , "Invalid name. Please enter only alphabetical characters.")
    updated_data[:name] = AdminAddProduct.get_input("Enter updated product name", /^[A-Za-z\s]+$/ , "Invalid name. Please enter only alphabetical characters.")
    updated_data[:category] = AdminAddProduct.get_input("Enter updated product category", /^[A-Za-z\s]+$/ , "Invalid Category. Please enter only alphabetical characters.")
    updated_data[:price] = AdminAddProduct.get_input("Enter updated product price", /^\d+$/, "Invalid price. Please enter a numeric value.")
    updated_data[:size] = AdminAddProduct.get_input("Enter updated product size")

    updated_data
  end

  def self.update_product(product_index, updated_data)
    product_array = CSV.read("products.csv")

    product_array[product_index][1] = updated_data[:brand]
    product_array[product_index][2] = updated_data[:name]
    product_array[product_index][3] = updated_data[:category]
    product_array[product_index][4] = updated_data[:price]
    product_array[product_index][5] = updated_data[:size]

    CSV.open("products.csv", 'w') do |csv|
      product_array.each do |row|
        csv << row
      end
    end

    puts "Product updated successfully."
  end
end
