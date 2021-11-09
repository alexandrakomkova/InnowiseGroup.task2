# frozen_string_literal: true

require 'csv'
require_relative 'work_with_csv'
require_relative 'work_with_parsed_data'
require_relative 'work_with_url'
require_relative 'product'
# .rubocop.yml
module Parse
  module_function

  def parse_product(product_url)
    html = WorkWithUrl.get_html(product_url)
    product = Product.new(html)
    product.weight_variation.each_with_index do |weight, index|
      WorkWithParsedData.work_with_parsed_data(product.name,
                                               product.img,
                                               weight.text.to_s,
                                               product.price_per_weight[index].text.to_s)
    end
  end

  def parse_one_page(count_products, url)
    product_page = WorkWithUrl.get_html(url).xpath('//div[@class = "product-desc display_sd"]//@href')
    (0...count_products).each do |product_counter|
      Parse.parse_product(product_page[product_counter].to_s.gsub(/\s+/, ''))
    end
  end

  def parse(url, filename)
    WorkWithCSV.create_file(filename)
    product_per_page = WorkWithYaml.read_parameters[2]
    count_products = WorkWithUrl.get_html(url).xpath('//input[@id = "nb_item_bottom"]/@value').text.to_i
    count_pages = (count_products / product_per_page.to_f).ceil
    (1..count_pages).each do |p_counter|
      set_count_products_to_parse(count_products, p_counter, product_per_page, url)
      count_products -= product_per_page
    end
  end

  def set_count_products_to_parse(count_products, p_counter, product_per_page, url)
    threads = []
    url = WorkWithUrl.form_page_url(url, p_counter) if p_counter > 1
    threads << if count_products < product_per_page
                 Thread.new { Parse.parse_one_page(count_products, url) }
               else
                 Thread.new { Parse.parse_one_page(product_per_page, url) }
               end
    threads.each(&:join)
  end
end
=begin
=end