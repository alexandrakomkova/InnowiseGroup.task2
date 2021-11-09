# frozen_string_literal: true

require_relative 'format_data'
# .rubocop.yml
module WorkWithParsedData
  def self.work_with_parsed_data(name, img, weight, price)
    # show_parsed_data(name, img, weight, price)
    WorkWithCSV.write_to_file(FormatData.prepare_data_to_write(name, img, weight, price),
                              FormatData.form_product_name(name, weight))
  end
end

def show_parsed_data(name, img, weight, price)
  puts name.strip, img, weight, price
end
