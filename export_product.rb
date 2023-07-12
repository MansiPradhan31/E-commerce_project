require 'csv'

class ExportProduct
  def self.store_product(product_data)
    if product_data.empty?
      puts "No product data provided. Please add products and then export..."
      return
    end

    CSV.open('products.csv', 'a') do |csv|
      csv << product_data.values
    end

    puts "Product stored successfully."
    product_data.clear
  end
end
