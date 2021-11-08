# frozen_string_literal: true

require_relative 'format_data'
# .rubocop.yml
module WorkWithParsedData
  def self.work_with_parsed_data(name, img, weight, price)
    # show_parsed_data(name, img, weight, price)
    WorkWithCSV.write_to_file(FormatData.prepare_data_to_write(name, img, weight, price),
                              name)
  end

  def self.work(product)
    show_parsed_data(product.name, product.img, product.weight, product.price)
  end
end

def show_parsed_data(name, img, weight, price)
  puts name.strip, img, weight, price
end
