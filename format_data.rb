# frozen_string_literal: true

require_relative 'product'
# .rubocop.yml
module FormatData
  def self.form_product_name(name, weight)
    "#{name.strip}\n#{weight}"
  end

  def self.prepare_data_to_write(name, img, weight, price)
    [FormatData.form_product_name(name, FormatData.form_product_weight(weight)), FormatData.form_product_price(price),
     img]
  end

  def self.form_product_price(price)
    price.gsub(/\s+/, '').chop
  end

  def self.get_weight_measurement(weight)
    weight.delete('0-9')
  end

  def self.get_weight_number(weight)
    weight.delete('^0-9')
  end

  def self.form_product_weight(weight)
    case FormatData.get_weight_measurement(weight.gsub(/\s+/, ''))
    when 'Gr', 'Gr.'
      "#{FormatData.get_weight_number(weight)} gr"
    when 'Kg', 'Kg.'
      "#{FormatData.get_weight_number(weight)} kg"
    else
      weight
    end
  end
end
