# frozen_string_literal: true

# .rubocop.yml
class Product
  attr_accessor :name, :price_per_weight, :img, :weight_variation

  def initialize(html)
    @name = get_info_about_product(html)[0]
    @img = get_info_about_product(html)[1]
    @weight_variation = get_info_about_product(html)[2]
    @price_per_weight = get_info_about_product(html)[3]
  end

  def get_info_about_product(html)
    product_name = html.xpath('//h1[@class = "product_main_name"]').text
    product_img = html.xpath('//img[@id = "bigpic"]/@src')
    product_weight_variation = html.xpath('//span[@class = "radio_label"]')
    price_per_weight = html.xpath('//span[@class = "price_comb"]')
    [product_name, product_img, product_weight_variation, price_per_weight]
  end
end