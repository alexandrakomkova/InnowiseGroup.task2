# frozen_string_literal: true

# .rubocop.yml
module WorkWithCSV
  def self.create_file(filename)
    CSV.open(filename, 'w')
    WorkWithCSV.set_headers_to_file(filename)
  end

  def self.set_headers_to_file(filename)
    headers = %w[name price image]
    CSV.open(filename, 'a+') do |row|
      row << headers
    end
  end

  def self.write_to_file(data_to_write, product_name)
    CSV.open('parsingProducts.csv', 'a+') do |row|
      row << data_to_write
    end
    puts "-----product #{product_name.strip} is written-----\n\n"
  end
end

