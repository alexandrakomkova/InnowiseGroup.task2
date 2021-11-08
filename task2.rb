# frozen_string_literal: true

require 'csv'
require 'rubygems'
require 'curb'
require 'nokogiri'

require_relative 'parse'
require_relative 'work_with_yaml'

Parse.parse('https://www.petsonic.com/farmacia-para-gatos/', 'parsingProducts.csv')


=begin
get_info_about_product(html)[2].each_with_index do |weight, index|
      work_with_parsed_data(get_info_about_product(html)[0],
                            get_info_about_product(html)[1],
                            weight.text.to_s,
                            get_info_about_product(html)[3][index].text.to_s)
    end



def self.work_with_parsed_data(name, img, weight, price)
    # show_parsed_data(name, img, weight, price)
    WorkWithCSV.write_to_file(prepare_data_to_write(name, img, weight, price),
                              name)
  end
=end