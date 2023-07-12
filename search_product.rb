require 'csv'

class SearchProduct
  def initialize(csv_file, product_array)
    @csv_file = csv_file
    @product_array = product_array
  end

  def search
    load_data_from_csv
    puts "Search product"
    puts "......................"
    puts "Search the product by Name, Brand, and Category"
    search_term = gets.chomp.downcase

    if search_term.empty?
      puts "Invalid search term. Please enter a valid term."
      return
    else

      found_products = @product_array.select do |prod|
        prod['name'].to_s.downcase.include?(search_term) ||
          prod['brand'].to_s.downcase.include?(search_term) ||
          prod['category'].to_s.downcase.include?(search_term)
      end

      unique_products = found_products.uniq

      if unique_products.empty?
        puts "Product not found...\n"
      else
        unique_products.each do |prod|
          puts "----------------------"
          puts "No: #{prod['no']}"
          puts "Brand: #{prod['brand']}"
          puts "Name: #{prod['name']}"
          puts "Category: #{prod['category']}"
          puts "Price: #{prod['price']}"
          puts "Size: #{prod['size']}"
        end
      end
    end
  end
end
