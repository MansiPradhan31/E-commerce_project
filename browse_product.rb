require 'csv'

class BrowseProduct
  def initialize(csv_file,productarray)
    @csv_file = csv_file
    @product_array = productarray
  end

  def browse_load
    load_data_from_csv
  end

  def browse
    display_products
  end

  def display_products
    @product_array.each do |prod|
      puts "......................"
      puts "No: #{prod['no']}"
      puts "Brand: #{prod['brand']}"
      puts "Name: #{prod['name']}"
      puts "Category: #{prod['category']}"
      puts "Price: #{prod['price']}"
      puts "Size: #{prod['size']}"
      puts "----------------------"
    end
  end
end


