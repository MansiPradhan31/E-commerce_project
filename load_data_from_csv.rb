def load_data_from_csv
  CSV.foreach(@csv_file) do |row|
    product_data = {
      'no' => row[0],
      'brand' => row[1],
      'name' => row[2],
      'category' => row[3],
      'price' => row[4],
      'size' => row[5]
    }
    @product_array << product_data
  end
end