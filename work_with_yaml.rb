# frozen_string_literal: true

require 'yaml'
# .rubocop.yml
module WorkWithYaml
  module_function

  # @return [Array]
  def read_parameters
    yaml_filename = 'parameters.yaml'
    parameters = YAML.safe_load(File.open(yaml_filename))
    [parameters['filename'], parameters['url'], parameters['product_per_page'].to_i]
  end
end
