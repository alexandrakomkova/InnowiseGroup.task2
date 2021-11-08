# frozen_string_literal: true

# .rubocop.yml
class Product
  attr_accessor :name, :price_per_weight, :img, :weight_variation

  def initialize(html)
    @name = html.xpath('//h1[@class = "product_main_name"]').text
    @img = html.xpath('//img[@id = "bigpic"]/@src')
    @weight_variation = html.xpath('//span[@class = "radio_label"]')
    @price_per_weight = html.xpath('//span[@class = "price_comb"]')
  end
end
